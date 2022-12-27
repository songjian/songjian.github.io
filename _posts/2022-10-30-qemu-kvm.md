---
layout: post
title: QEMU/KVM
categories: KVM
---
KVM是Kernel-based Virtual Machine的缩写，意思是基于内核的虚拟机。从2.6.20版开始加入Linux内核。

QEMU可以作为计算机模拟器或者虚拟机使用。

## 安装

```sh
sudo apt install qemu-kvm libvirt-bin bridge-utils virt-manager virtinst virt-viewer
```

## 工具

### 图形工具

`virtual machine manager`（中文：虚拟系统管理器）

### 命令行工具

#### virsh

`virsh` 是kvm一个管理工具包。

列出所有虚拟机

```sh
virsh list --all
```

查看网络有关的命令帮助

```sh
virsh help newwork
```

编辑网络配置文件

```sh
virsh net-edit default
```

查看网络名称

```sh
virsh net-list
``` 

开启网络

```sh
virsh net-start default
```

自动连接网络

```sh
virsh net-autostart default
```

关闭网络

```sh
virsh net-destroy default 
```

自动启动虚拟机

```sh
virsh autostart [虚拟机名称]
```

