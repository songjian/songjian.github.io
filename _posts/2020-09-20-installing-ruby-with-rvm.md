---
layout: post
title: 使用RVM安装Ruby
categories: [ruby]
tags: [ruby, rvm]
---
官网

[https://rvm.io/](https://rvm.io/)

安装RVM

```sh
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.bashrc
source ~/.bash_profile
```

修改 RVM 的 Ruby 安装源到 Ruby China 的 Ruby 镜像服务器

```sh
echo "ruby_url=https://cache.ruby-china.com/pub/ruby" > ~/.rvm/user/db
```

遇到网络问题可以尝试

如果提示 `curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused`
使用[https://www.ipaddress.com/](https://www.ipaddress.com/)网站查询raw.githubusercontent.com真实ip，设置到`sudo vim /etc/hosts`中。

gem更换清华大学镜像源

```sh
# 添加 TUNA 源并移除默认源
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
# 列出已有源
gem sources -l
# 应该只有 TUNA 一个
```

替换bundler默认源

```sh
bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
```

使用gem安装软件包

```sh
gem install [软件包名]
# 例如：
gem install rails
gem install bundler
```

列出已知Ruby版本

```sh
rvm list known
```

安装一个Ruby版本

```sh
rvm install 3.0.0 --disable-binary
```

参考

* [RVM 实用指南](https://ruby-china.org/wiki/rvm-guide)
* [Ruby Gems 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/rubygems/)
