---
layout: post
title: 记一个weditor在windows上的安装错误
categories: [Python]
tags: [weditor]
---
weditor是用于Android元素定位的Python软件包。

windows系统pip安装weditor-0.6.5.tar.gz报GBK读取错误，Windows命令行里添加

```sh
set PYTHONUTF8=1
```
