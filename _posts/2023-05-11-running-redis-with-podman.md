---
layout: post
title: Podman运行Redis
date: 2023-05-11 21:08:00 +0800
category: Podman
tags: [Podman, Redis]
---
## 使用podman运行redis

```bash
podman run -d --rm --name redis_server -p 6379:6379 redis
```

## 使用systemd开机启动

```bash
bash -c \
  "mkdir -p ~/.config/systemd/user \
  && cd ~/.config/systemd/user \
  && podman generate systemd --new --files --name redis_server \
  && systemctl --user daemon-reload"
```

## 配置文件

Redis的Docker镜像不包括`redis.conf`需要去官网下载。

下载地址: [https://redis.io/docs/management/config/](https://redis.io/docs/management/config/)

## 安装redis客户端

```bash
sudo apt install redis-tools
```

## 客户端连接服务器

```bash
redis-cli
```
