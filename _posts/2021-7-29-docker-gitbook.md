---
layout: post
title: 使用Docker构建GitBook
categories: [Docker]
tags: [Docker, GitBook]
date: 2021-7-29 12:00:00 -0500
---
拉取镜像 

```sh
docker pull fellah/gitbook
```

运行 

```sh
docker run -p 8005:4000 -v $PWD:/srv/gitbook fellah/gitbook 
```

编译静态网页 

```sh
docker run -v /srv/gitbook -v /srv/html fellah/gitbook gitbook build . /srv/html 
```

参考

> https://hub.docker.com/r/fellah/gitbook
