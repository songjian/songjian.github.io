---
layout: post
title: 记一个weditor安装错误
categories: [Python]
tags: [Python, weditor]
---
weditor是用于Android元素定位的Python软件包。

pip安装weditor-0.6.5.tar.gz报GBK读取错误，Windows命令行里添加

```sh
set PYTHONUTF8=1
```
