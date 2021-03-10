---
layout: post
title: wsl使用中遇到的问题
categories: [技术文章]
---

* wsl挂载的windows磁盘，内容修改后不能及时反应
  * 例如：代码放在/mnt/c/目录下，jekyll s --watch提供web服务，修改代码后无法即时显示
  * 解决办法：文件保存到wsl的linux文件系统下
