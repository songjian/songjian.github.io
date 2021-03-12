---
layout: post
title: Gogs安装记录
categories: [技术文章]
image: /assets/img/gogs.png
---

Gogs是一款极易搭建的自助 Git 服务，和Gitlab类似，但是资源消耗少很多。

**安装步骤**

1. 新建git用户 
```sh
useradd git
```
2. 下载二进制安装包，解压到/home/git/gogs目录
3. 设置仓库根目录: /home/git/gogs-repositories
4. 管理员登录PostgreSQL数据库，新建gogs库和gogs用户

**参考**

* [官方文档——二进制安装](https://gogs.io/docs/installation/install_from_binary.html)
* [Gogs 安装教程（最简单版）](https://blog.csdn.net/linzhenlong123/article/details/78298659)
