# Arch Linux

```sh
To install Arch Linux follow the installation guide:
https://wiki.archlinux.org/title/Installation_guide

For Wi-Fi, authenticate to the wireless network using the iwctl utility.
For mobile broadband (WWAN) modems, connect with the mmcli utility.
Ethernet, WLAN and WWAN interfaces using DHCP should work automatically.

After connecting to the internet, the installation guide can be accessed
via the convenience script Installation_guide.
```

## 参考

* [Installation guide](https://wiki.archlinux.org/title/Installation_guide)
* [2021年 Arch Linux 中文安装教程 | 超详细解说](https://www.youtube.com/watch?v=NLVNFHGyBEU)

## 工具

* Neofetch 是一个简单但有用的命令行系统信息工具，它用 Bash 编写。
```sh
# Arch Linux 安装
pacman -S netofetch

# Debian 安装
apt install neofetch

# 使用
neofetch
```

## 要点

* UEFI 规范要求支持 FAT12、FAT16 和 FAT32 文件系统（[参见 UEFI 规范 2.9 版 13.3.1.1 小节](https://uefi.org/sites/default/files/resources/UEFI_Spec_2_9_2021_03_18.pdf#G17.1019485)），但每个符合规范的厂商可以选择添加对其他文件系统的支持；比如，苹果公司（Apple）的 Mac 支持（并默认使用）他们自己的 HFS+ 或 APFS 文件系统。
* vmlinux 是一个包括 linux kernel 的静态链接的可运行文件。文件类型是 linux 接受的可运行文件格式之中的一个(ELF、COFF或a.out)。
* vmlinuz 是可引导的，压缩的 linux 内核，“vm” 代表的 “virtual memory” 。vmlinuz是vmlinux经过gzip和objcopy(*)制作出来的压缩文件。vmlinuz不仅是一个压缩文件，并且在文件的开头部分内嵌有gzip解压缩代码。所以你不能用gunzip 或 gzip –dc解包vmlinuz。vmlinuz是一个统称。有两种详细的表现形式：zImage和bzImage(big zImage)。zImage和bzImage的差别在于本身的大小和载入到内存的地址不同。zImage是0~640KB，bzImage是1M以上。假设内核比較小。那么能够採用zImage 或bzImage之中的一个，两种方式引导的系统运行时是同样的。大的内核採用bzImage。不能採用zImage。

## 准备

### 镜像写入U盘

```sh
dd if=archlinux-2022.06.01-x86_64.iso of=/dev/sdc bs=1M
```

### 连接 SSH 安装

使用 `passwd` 创建一个简单密码，然后查询 IP，可以通过终端登录安装。

### 硬盘分区

EFI 300M；swap：4G；root分区：剩余空间。

```sh
cfdisk /dev/sda
```
### 设置 Boot loader

```sh
efibootmgr --disk /dev/sda --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=UUID=55394c70-e770-4433-aeee-d688a837576c rw initrd=\initramfs-linux.img' --verbose
```

### 设置网络

```sh
# 启用网卡
ip link set enp0s25 up
```

## 问题

`Failed to open file "/sys/devices/system/cpu/microcode/reload": Read-only file system`

## 安装

```sh
pacstrap -i /mnt base base-devel linux linux-firmware linux-headers vim nano intel-ucode bash-completion

arch-chroot /mnt

# 安装 Systemd 启动器
bootctl install

vim /boot/loader/entries/arch.conf
```

编辑 `/boot/loader/entries/arch.conf` 文件
```conf
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
```

从哪个硬盘分区启动，写入启动配置文件
```sh
echo "options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/sda3) rw" >> /boot/loader/entries/arch.conf
```

延长SSD寿命，启用 fstrim
```sh
systemctl enable fstrim.timer
```

配置网络、蓝牙、声音
```sh
pacman -S networkmanager network-manager-applet dialog wpa_supplicant dhcpcd
```

启动安装的服务
```sh
systemctl enable dhcpcd@eno2
systemctl enable NetworkManager
```

蓝牙 打印机 音量
```sh
pacman -S mtools bluez bluez-utils cups xdg-utils xdg-user-dirs alsa-utils pulseaudio pulseaudio-bluetooth reflector
```

启动蓝牙
```sh
systemctl enable bluetooth
```

启动打印机服务
```sh
systemctl enable cups
```

OpenSSH
```sh
pacman -S openssh
```

启动 sshd
```sh
systemctl enable sshd
```

检查启动器
```sh
bootctl status
```

创建用户
```sh
useradd -m -s /bin/bash -G wheel arch
visudo
```

安装结束，取消挂载
退出 `arch-chroot`
```sh
exit
```

```sh
umount -R /mnt
```

重启
```sh
reboot
```