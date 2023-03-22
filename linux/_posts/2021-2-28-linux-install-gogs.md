---
layout: post
title: 二进制方式安装Gogs
tags: git gogs linux
categories: git gogs
---

### 第 1 步: 创建git用户

```bash
useradd git
```

### 第 2 步: 在PostgreSQL数据库创建gogs库和gogs用户

```bash
sudo -u postgres psql -c "create user gogs with password 'gogs';"
sudo -u postgres psql -c "create database gogs owner gogs;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE gogs TO gogs;"
```

### 第 3 步: 下载安装gogs二进制安装包

* 下载二进制包
  * [https://gogs.io/docs/installation/install_from_binary.html](https://gogs.io/docs/installation/install_from_binary.html)
* 解压目录 `/home/git/gogs`

### 第 4 步: 配置gogs开机启动

* 设置git仓库根目录: /home/git/gogs-repositories

### 参考

* [官方文档——二进制安装](https://gogs.io/docs/installation/install_from_binary.html)
* [Gogs 安装教程（最简单版）](https://blog.csdn.net/linzhenlong123/article/details/78298659)
