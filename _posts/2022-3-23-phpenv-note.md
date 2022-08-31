---
layout: post
title: PHPENV使用笔记
categories: PHP
---

Github地址：https://github.com/phpenv/phpenv

phpenv是php的版本管理工具，可以在电脑上管理多个php版本。

第1步 下载

```bash
git clone git://github.com/phpenv/phpenv.git ~/.phpenv
```

第2步 设置环境变量

```bash
echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bash_profile
```

第3步 phpenv init 添加shell中

```bash
echo 'eval "$(phpenv init -)"' >> ~/.bash_profile
```

第4步 shell重登录

```bash
exec $SHELL -l
```

第5步 安装php-build（可选）

```bash
git clone git://github.com/php-build/php-build $(phpenv root)/plugins/php-build
```

第6步 安装php新版本后执行（可选） 

```bash
phpenv rehash
```

第7步 列出所有可能版本

```bash
phpenv install -l
```

第8步 安装php8

```bash
phpenv install 8.0.0
```

安装过程中可能会提示缺少库，使用`sudo apt install libname`安装。
