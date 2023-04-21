---
layout: post
title: Caddy
tags: caddy
categories: caddy
---
Caddy支持API和Caddyfile两种方式配置

Caddy有两种工作方式，使用API或Caddyfile，API使用json作为配置，Caddyfile结合CLI使用。

## 应用

#### 静态文件服务器

当前目录

```sh
caddy file-server --listen :3015 –browse
```

指定目录

```sh
caddy file-server --listen :3015 –browse –root ~/mysite
```

## 引用

> - [https://caddyserver.com/](https://caddyserver.com/)
> - [https://caddyserver.com/docs/](https://caddyserver.com/docs/)
