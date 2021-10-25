---
layout: post
title: gitbook安装
categories: git gitbook
---

## 设置nodejs版本
gitbook需要10.21.0版nodejs

``` bash
nvm install 10.21.0 && nvm use 10.21.0
```

## 通过npm安装gitbook
``` bash
npm install gitbook-cli -g
gitbook -V
```

## 常用命令
初始化
``` bash
gitbook init ./newbook
```

构建
``` bash
gitbook build 
```

Debugging
``` bash
gitbook build ./ --log=debug --debug
```

启动服务
``` bash
gitbook serve
```

指定端口启动
``` bash
gitbook serve --port 4001
```

## 参考
* [使用 Gitbook 打造你的电子书](https://zhuanlan.zhihu.com/p/34946169)
