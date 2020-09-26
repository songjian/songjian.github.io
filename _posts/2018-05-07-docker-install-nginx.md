---
layout: post
title: Docker nginx 安装
categories: 技术文章
---

一、HTTP服务

1. 将image抓取到本地

``` bash
docker image pull nginx
```

2. 运行nginx

``` bash
docker container run /
-d \
-p 127.0.0.2:8080 \
--rm \
--name mynginx \
nginx
```
