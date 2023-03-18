---
layout: post
title: RedmiBook Pro 15 @Ubuntu
categories: RedmiBookPro15
---
## Windows

原机带了Win10系统，后来升级了Win11

## Linux

## 换系统的原因

周末把公司配的RedmiBook Pro 15笔记本电脑换成了Ubuntu 22.04系统。我平时主要工作偏向后端开发，Windows日常使用不太方便，开发时需要通过Docker Desktop和WSL，系统用久了，WSL磁盘读取速度会很慢，因为Docker Desktop和WSL都依赖Hyper-v，属于磁盘的使用效率不搞

安装过程非常顺畅，官网下载ISO文件，写入U盘，使用图形安装引导程序，没有遇到问题，网络网卡也能正确驱动。

### 硬件

1. 指纹模块
2. 触摸板两指缩放不支持

### 编程

#### VSCode

安装VSCode遇到一个问题，从Ubuntu软件中心安装的VSCode不支持输入中文，需要到VSCode官网按照安装指引去安装。

#### Vim

从[https://github.com/songjian/dotfiles](https://github.com/songjian/dotfiles)取出`.vimrc`配置文件。
