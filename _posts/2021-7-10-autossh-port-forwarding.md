---
layout: post
title: 使用SSH端口转发，将局域网内主机端口转发到公网服务器上
categories: [Linux]
tags: [ssh, port-forwarding, autossh]
---
## 更新 2022年4月9日

周末邻居装修导致我家突然断电了，服务器断电关机，之前家里NAS和阿里云服务器上搭了几条SSH隧道，使用`autossh -R port:host:port host2 -Nf`这种方式，后台运行的隧道多了就有点乱，正好借着这次服务器关机，把之前的隧道整理一下，统一写入客户端ssh的config配置文件中，以后链接到同一台服务器上的多条隧道就可以执行像这样的一条语句`autossh host-tunnel -Nf`，比之前简洁不少。

### 整理前

```sh
# nextcloud
autossh -R 23408:localhost:3002 publishhost -Nf

# nginx
autossh -R 23409:localhost:80 publishhost -Nf
```

### 整理后

在`~/.ssh/config`文件中添加

```conf
# ~/.ssh/config
Host s2-tunnel
  Hostname 47.104.128.157
  User yy
  RemoteForward 23408 localhost:3002
  RemoteForward 23409 localhost:80
```

命令行运行

```sh
# 开启隧道
autossh s2-tunnel -Nf
```

## 转发的概念

### 动态代理

```sh
ssh -D 2121 shop -N
```

### 远程转发

```sh
# SSH 远程端口转发
ssh -R 23409:localhost:4003 -Nf publishhost
ssh -R 23408:localhost:3002 publishhost -Nf

# 使用 AutoSSH 监控 SSH 远程端口转发
autossh -R 23408:localhost:3002 publishhost -Nf
autossh -R 23409:localhost:80 publishhost -Nf
```

### 本地转发

1. 路由器通过端口映射到局域网ssh端口
2. 局域网主机启动sshd服务
3. nextcloud设置本地端口访问
4. 服务器ssh本地端口转发，通过局域网sshd连接nextcloud端口
    a. 例：publishhost主机23408端口转发到s2服务器3002端口
        i. ssh -L 23408:localhost:3002 s2 -Nf

### 使用 AutoSSH 自动重连

AutoSSH 是一种用以对 SSH 登录进行安全地自动化的软件。

## 参考

> * [SSH 端口转发](https://wangdoc.com/ssh/port-forwarding.html#%E8%BF%9C%E7%A8%8B%E8%BD%AC%E5%8F%91)
> * [SSH隧道详解与使用AutoSSH实现稳定的内网穿透](https://zhuanlan.zhihu.com/p/433582651)
> * [SSH 反向隧道 内网穿透，AutoSSH自动重连](https://blog.csdn.net/s526294412/article/details/100117267)
