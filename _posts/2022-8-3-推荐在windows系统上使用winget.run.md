---
layout: post
title: 推荐windows系统使用winget.run
categories: [windows]
tags: [windows, winget]
---
#### [winget.run](https://winget.run/ )

是Windows 11系统默认安装的命令行包管理程序`winget`的软件包索引网站，可以方便的在此网站上搜索软件包和获得安装用的命令。

## 常用软件的安装

git

```sh
winget install --id Git.Git -e --source winget
```

微信

```sh
winget install --id Tencent.WeChat --source winget
```

Visual Studio Code

```sh
winget install --id Microsoft.VisualStudioCode --source winget
```
