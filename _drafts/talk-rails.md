---
layout: post
title: 如何部署一个旧Rails项目？
---
## 大纲

* 自动打包Docker镜像
* 使用Github Actions自动部署
* 拉取镜像重启docker-compose

## 起因

Ubuntu22.04系统上带的Ruby3.0,如果需要旧版Ruby，一般需要使用RVM或者rbenv下载Ruby源代码，然后编译。

Ruby2.3我在Ubuntu20.04系统上编译成功过，但是在Ubuntu22.04解决了所有编译报错之后，使用中还是有问题。最终我还是选择使用Docker部署项目。

## Forward

最近公司要开一个新项目，人手不足，项目中一些功能，以前开发的项目已经实现过，所以准备在以前的项目基础上进行开发。

旧项目使用的是Rails 5，Ruby版本2.3，Ubuntu 22.04系统上使用旧版Ruby比较麻烦。虽然有RVM和rbenv等Ruby环境管理工具。编译旧版Ruby还是遇到了一些困难。

Ruby 2.3需要openssl1.0，Ubuntu 22.04带的openssl3.0，openssl新版和旧版变动很大，不能使用新版编译，所以需要先下载openssl1.0进行编译，再在编译Ruby 2.3时指定openssl1.0目录。修复所有编译中的报错之后，终于编译成功，但是使用中还是报了一些错误。最后还是选择Docker作为开发和部署的环境。
