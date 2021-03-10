---
layout: post
title: Nginx路径重写
categories: [技术文章]
---


```
server {
    listen       80;
    server_name  www.nginx.org  nginx.org;
    if ($http_host = nginx.org) {
        rewrite  (.*)  http://www.nginx.org$1;
    }
    ...
}
```