---
layout: post
title: Windows创建软链接的命令mklink
categories: [Windows]
tags: [Windows, mklink]
---
最近在windows系统上做开发。通常在Linux系统上如果有几个项目公用一部分资源文件，可以创建一个资源的"链接"到需要使用的目录，但是在我印象里window只有“快捷方式”这么个东西。于是在网上搜索了一下。用于在windows系统上创建链接的命令是mklink。

```sh
mklink
创建符号链接。

MKLINK [[/D] | [/H] | [/J]] Link Target

        /D      创建目录符号链接。默认为文件
                符号链接。
        /H      创建硬链接而非符号链接。
        /J      创建目录联接。
        Link    指定新的符号链接名称。
        Target  指定新链接引用的路径
                (相对或绝对)。

```

##### 使用方法

```sh
mklink /d mylink c:\dir1
```

`mklink` 不仅可以链接本地资源，也可以链接共享文件夹

```sh
mklin /d photos \\192.168.1.200\phots
```