---
layout: post
title: RedmiBook Pro 15 @Ubuntu
categories: Linux Ubuntu
---
```sh
$ stat /lost+found/
  文件：/lost+found/
  大小：16384     	块：32         IO 块：4096   目录
设备：10302h/66306d	Inode：11          硬链接：2
权限：(0700/drwx------)  Uid：(    0/    root)   Gid：(    0/    root)
最近访问：2022-10-30 13:07:02.000000000 +0800
最近更改：2022-10-30 13:07:02.000000000 +0800
最近改动：2022-10-30 13:07:02.000000000 +0800
创建时间：2022-10-30 13:07:02.000000000 +0800
```
周末把工作用的电脑RedmiBook Pro 15换成Ubuntu 22.04系统。

安装过程非常顺畅，官网下载ISO文件，写入U盘，使用图形安装引导程序，没有遇到问题，网络网卡也能正确驱动。

### 硬件

1. 指纹模块
2. 触摸板两指缩放不支持

### 编程

#### VSCode

安装VSCode遇到一个问题，从Ubuntu软件中心安装的VSCode不支持输入中文，需要到VSCode官网按照安装指引去安装。

#### Vim

从[https://github.com/songjian/dotfiles](https://github.com/songjian/dotfiles)取出`.vimrc`配置文件。
