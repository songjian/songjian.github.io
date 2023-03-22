---
layout: post
title: 自己写了一个操作代理软件的Python包
categories: python
---
## Forward

因为需要给一个国外的软件写自动化测试程序，但是又不想折腾网络环境配置，于是打算把代理软件安装到自动化测试环境中，但是运行测试时需要启动代理软件，并且要在运行测试期间切换一次线路，所以需要控制代理软件。查看了一下软件的文档，应该没有提供操作API，我根据软件特征自己写了一个，包括PC端和Android端操作程序。

## Github

* [https://github.com/songjian/aurora](https://github.com/songjian/aurora)
* [https://github.com/songjian/aurora-android-app](https://github.com/songjian/aurora-android-app)