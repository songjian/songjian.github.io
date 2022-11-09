---
layout: post
title: WSL入门指南
categories: WSL
---

这系列文章是帮助你了解在Windows上使用WSL（Windows子系统）作为开发环境，来开发原本是运行在Linux下的程序。如果你的技术栈一直是基于Windows系统，可能你不需要阅读这篇文章，如果你用到的技术栈依赖Linux或者你想把开发环境从MacOS和Linux等类Unix系统转到Windows，这篇文章可能对你有用。

### 使用WSL作为开发环境

基于WSL开发入门系列 1

最近在帮助新同事配置WSL作为开发环境，从同事的使用中得到反馈是安装和使用的过程很有挫败感，所以我想写一篇文章来帮助新手配置WSL。

配置WSL作为开发环境的流程

-. 检查系统版本，根据系统版本选择安装方式
-. 按照微软官方给出的文档进行安装
-. 熟悉基本的Linux命令
-. 了解WSL和Windows10系统的磁盘和网络的互操作
-. 了解一些常用的工具

用到的知识：

* 在Windows的搜索框（Win11）或者按`win + r`键中输入`winver`查看Windows版本
* 在`Microsoft Store`中可以获取和安装Linux系统
* 需要一个好用的终端工具链接Linux系统

如果使用中有挫败感，这个挫败感可能有以下原因：

* 不熟悉Windows10子系统的概念
* 不了解Windows10子系统和虚拟机的区别
* 对Linux系统的命令不熟悉
* 对在Linux系统下开发需要做那些工作不熟悉

为什么要在Linux

我感觉可能不是安装不上，主要是对wsl不了解，对使用方式和报出来的错很迷惑

最近有两个新同事加入公司，我推荐他们使用WSL作为开发环境，我把微软官方的安装指南链接丢给他们，以为这样就能把WSL配置好，实际结果超出我的预料。

选择WSL其实就是把开发环境搭建在Linux上，这需要Linux知识，在加上WSL是以Windows的子系统的方式在工作，这就更加增加了WSL的入门难度，你需要对Linux和Windows都了解才能比较好的让它工作。

这篇文章不是一步步教你怎么配置WSL，它是让你对WSL有个初步的认识。

## WSL历史

WSL虽然存在的时间不长，但是已经经历了两个版本，并且第一版和第二版还有不小的差别，第一版。。。，第二版WSL实际是运行在Hyper-V（微软家的虚拟机）中，它运行的是完整的Linux内核

## WSL的安装

https://docs.microsoft.com/zh-cn/windows/wsl/install-win10

***微软的安装介绍页还在继续更新，当你查看上面的页面内容时，不一定和我文章中描述的内容一致。***

当前WSL支持两种安装方式: **简化安装**和**手动安装**

简化安装的使用条件是
1. **Windows 预览体验计划**
2. **Windows 10 的预览版（OS 版本 20262 或更高版本）**

不满足简化安装条件，需要使用手动安装。

## WSL如何访问Windows的硬盘

WSL默认已经把硬盘挂载到`/mnt`目录下，访问C盘只需要`cd /mnt/c`，访问D盘只需`cd /mnt/d`

## 建议

WSL还不完全兼容linux，使用中有如下问题：

* Systemd不可用

## Docker

在Docker官方网站下载**Docker Desktop for Windows**，选择安装到WSL

## 坑

* WSL挂载的Windows磁盘，内容修改后不能及时反应，解决办法：文件保存到wsl的linux文件系统下
* WSL默认没有启动ssh服务，需要手动启动`sudo service ssh start`

## 你可能需要

* 推荐安装流程参考

* [Ubuntu官方的安装到WSL的指引](https://ubuntu.com/wsl)
* [微软官方介绍WSL1和WSL2区别的文档](https://docs.microsoft.com/zh-cn/windows/wsl/compare-versions)
