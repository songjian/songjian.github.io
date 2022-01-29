---
layout: post
title: 开发环境放入vhdx
categories: 开发 vhdx win11
---

每次重装系统都是一次痛苦的经历，安装常用软件、配置语言开发环境，为了减小重装系统带来的痛苦，所以想到将开发环境放入vhdx中，只要把制作好的vhdx文件放入外置存储设备（U盘、移动硬盘）或拷贝到电脑硬盘上，就能快速获得熟悉的开发环境。

特性：

* vhdx设置为动态磁盘大小，最大为100GB
* OS: Windows11（内部版本22000.348）
* 加入Windows预览体验计划（Beta）
* WSL: Ubuntu 20.04 LTS
* Docker Desktop (基于WSL)
* PowerToys v0.49.1 - 微软开发的实用工具，可以帮助提高工作效率
* Visual Studio Code
* Amazon Kindle