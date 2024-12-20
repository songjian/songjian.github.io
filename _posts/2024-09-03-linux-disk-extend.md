---
layout: page
title: Linux硬盘扩容与Docker数据迁移
date: 2024-09-03
categories: [Linux]
tags: [Linux, Docker]
---
## 简介

云服务器磁盘买小了，后来使用Docker的时候，发现磁盘空间不够用了，又买了一个200G的数据盘。为了不影响原来项目的使用，把新的数据盘分成了两个分区，一个用于Docker的数据，一个用于数据备份。

## 查看磁盘信息

```bash
lsblk
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda     202:0    0  250G  0 disk 
├─xvda1  202:1    0 49.9G  0 part /
├─xvda2  202:2    0  200G  0 part /data
├─xvda14 202:14   0    4M  0 part 
└─xvda15 202:15   0  106M  0 part /boot/efi
```

## 卸载分区

```bash
umount /data
```

## 删除分区

```bash
fdisk /dev/xvda

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

This disk is currently in use - repartitioning is probably a bad idea.
It's recommended to umount all file systems, and swapoff all swap
partitions on this disk.


Command (m for help): p

Disk /dev/xvda: 250 GiB, 268435456000 bytes, 524288000 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: B28BC60D-C864-49DB-A9FF-7B6FF9BCC625

Device          Start       End   Sectors  Size Type
/dev/xvda1     227328 104857566 104630239 49.9G Linux filesystem
/dev/xvda2  104857600 524287966 419430367  200G Linux filesystem
/dev/xvda14      2048     10239      8192    4M BIOS boot
/dev/xvda15     10240    227327    217088  106M EFI System

Partition table entries are not in disk order.

Command (m for help): d
Partition number (1,2,14,15, default 15): 2

Partition 2 has been deleted.

Command (m for help): w
The partition table has been altered.
Syncing disks.
```

## 创建新分区

```bash
fdisk /dev/xvda

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

This disk is currently in use - repartitioning is probably a bad idea.
It's recommended to umount all file systems, and swapoff all swap
partitions on this disk.


Command (m for help): p

Disk /dev/xvda: 250 GiB, 268435456000 bytes, 524288000 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: B28BC60D-C864-49DB-A9FF-7B6FF9BCC625

Device       Start       End   Sectors  Size Type
/dev/xvda1  227328 104857566 104630239 49.9G Linux filesystem
/dev/xvda14   2048     10239      8192    4M BIOS boot
/dev/xvda15  10240    227327    217088  106M EFI System

Partition table entries are not in disk order.

Command (m for help): n
Partition number (2-13,16-128, default 2): 
First sector (104857567-524287966, default 104857600): +100G
Value out of range.
First sector (104857567-524287966, default 104857600): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (104857600-524287966, default 524287966): +100G

Created a new partition 2 of type 'Linux filesystem' and of size 100 GiB.
Partition #2 contains a ext4 signature.

Do you want to remove the signature? [Y]es/[N]o: Y

The signature will be removed by a write command.

Command (m for help): n
Partition number (3-13,16-128, default 3): 
First sector (314572800-524287966, default 314572800): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (314572800-524287966, default 524287966): 

Created a new partition 3 of type 'Linux filesystem' and of size 100 GiB.

Command (m for help): w
The partition table has been altered.
Syncing disks.
```

## 查看新分区

```bash
lsblk
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda     202:0    0  250G  0 disk 
├─xvda1  202:1    0 49.9G  0 part /
├─xvda2  202:2    0  100G  0 part 
├─xvda3  202:3    0  100G  0 part 
├─xvda14 202:14   0    4M  0 part 
└─xvda15 202:15   0  106M  0 part /boot/efi
```

## 格式化新分区

```bash
mkfs.ext4 /dev/xvda2
mkfs.ext4 /dev/xvda3
```

## 挂载新分区

```bash
mkdir /data
mkdir /backup

mount /dev/xvda2 /data
mount /dev/xvda3 /backup
```

## /var/lib/docker 目录迁移

```bash
systemctl stop docker
mv /var/lib/docker /data
```

## 更新 /etc/fstab

```bash
vi /etc/fstab

获取新分区的UUID

blkid

UUID=xxxx-xxxx-xxxx-xxxx /data ext4 defaults 0 2
UUID=xxxx-xxxx-xxxx-xxxx /backup ext4 defaults 0 2
```

## 重启服务器

```bash
reboot
```

## 完成

调整完成后，查看磁盘信息

```bash
lsblk
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda     202:0    0  250G  0 disk 
├─xvda1  202:1    0 49.9G  0 part /
├─xvda2  202:2    0  100G  0 part /var/lib/docker
├─xvda3  202:3    0  100G  0 part /backup
├─xvda14 202:14   0    4M  0 part 
└─xvda15 202:15   0  106M  0 part /boot/efi
```
