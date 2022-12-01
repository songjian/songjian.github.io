---
layout: post
title: 使用phpenv管理PHP版本
categories: PHP
---
[phpenv](https://github.com/phpenv/phpenv)是一个PHP语言的版本管理工具，可以方便管理多个PHP版本。

第1步 克隆代码到用户主目录

```sh
git clone git://github.com/phpenv/phpenv.git ~/.phpenv
```

第2步 设置环境变量

```sh
echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bash_profile
```

第3步 phpenv init 添加shell中

```sh
echo 'eval "$(phpenv init -)"' >> ~/.bash_profile
```

第4步 shell重登录

```sh
exec $SHELL -l
```

第5步 安装php-build（可选）

```sh
git clone git://github.com/php-build/php-build $(phpenv root)/plugins/php-build
```

第6步 安装php新版本后执行（可选） 

```sh
phpenv rehash
```

第7步 列出所有可能版本

```sh
phpenv install -l
```

第8步 安装php8

```sh
phpenv install 8.0.0
```

安装过程中可能会提示缺少库，使用`sudo apt install libname`安装。
