---
layout: post
title: Docker in Docker 技术实践
categories: [docker]
tags: [docker, dind, docker in docker]
date: 2024-03-19 10:58:00 +0800
---
## 背景

有时候我们需要在容器中操作宿主机上的 Docker 守护进程，这种场景叫做 Docker in Docker，简称：DinD。

## 尝试的其他方法

在应用DinD技术之前，我想到过用其他方法操作宿主机上 Docker 守护进程。

将宿主机的目录挂载到容器中，容器根据需要启动的容器，在目录中生成docker-compose.yml文件，宿主机上监听目录中的文件变动，文件有变动的时候，根据配置文件启动或停止容器。

这个方案的缺点：这个方案可以解决操作容器的启动和停止，但是想得到容器的运行状态就做不到了。

## Docker in Docker (DinD)

于是就想能不能在容器里操作宿主机的 Docker 守护进程，顺着这个思路在网上搜索，发现是可以的，甚至还有一个专用术语用于描述这种行文（DinD）。

搜索到这一步突然想起来，相关的文章几年前看过，因为没有使用场景，看过也就忘了。今天碰到相关场景，才真正实践了这项技术。

### 实践

#### 把 Docker 客户端安装到容器中

`Dockerfile` 中添加运行安装Docker客户端的命令

```Dockerfile
RUN apt-get update && apt-get install -y ca-certificates curl \
   && install -m 0755 -d /etc/apt/keyrings \
   && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
   && chmod a+r /etc/apt/keyrings/docker.asc \
   && echo \
       "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
       $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
       tee /etc/apt/sources.list.d/docker.list > /dev/null \
   && apt-get update \
   && apt-get install -y docker-ce-cli docker-compose-plugin \
   && rm -rf /var/lib/apt/lists/*
```

#### 把 Docker 守护进程的 socket 文件挂载到容器中

`/var/run/docker.sock` 挂载到容器

```yaml
volumes:
    - /var/run/docker.sock:/var/run/docker.sock
```
