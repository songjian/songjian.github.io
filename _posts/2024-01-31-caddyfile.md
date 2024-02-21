---
layout: post
title: 深入理解Caddyfile配置
date: 2024-01-31 21:08:00 +0800
category: Caddy
tags: Caddy
---
都说Caddy的配置十分友好，正好有一个项目需要自动申请SSL证书，尝试一下Caddy的配置

Caddy的官方文档：[https://caddyserver.com/docs/](https://caddyserver.com/docs/)

Caddy可以使用api和Caddyfile两种方式配置，我使用的是Caddyfile。

### Caddyfile的配置

结构
----

### 块 Blocks

块由`{}`包起来。

#### 全局可选的块 Global options

使用没有键的块就是全局选项

```caddy
{

}
```

全局选项必须是第一个块

### 站点块

只有一个站点Caddyfile，`{}`可以省略。

### 指令 Directives

指令是自定义服务方式的关键字，必须出现在站点块内，并且是站点块中一行的第一个单词

指令的参数使用空格分割，如果参数中有空格需要使用""括起来

如果参数中带"号可以使用\\"转移

不想使用转移可以使用\`\`把参数括起来

#### handle指令和route指令的区别

handle和route指令互相排斥，流程上会先匹配handle指令，如果有满足就不会再匹配route指令。

### 示例

#### 后端负载均衡

```caddy
localhost {
    [reverse\_proxy](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy)
    localhost:9000 localhost:9001 {
        lb\_policy first
    }
}
```

lb\_policy是reverse\_proxy的子指令，用于负载均衡。

#### 前端使用Vue.j的route History模式加后端的配置

```caddy
# 全局配置
{
    log {
        level INFO
        output stdout
    }
}

# 站点配置
localhost {
    # 后端
    handle /api* {
        # 代理到后端
        reverse_proxy localhost:3000
    }

    # 前端
    handle {
        encode {
            gzip 9
            minimum_length 1024
            match {
                header Content-Type text/plain
                header Content-Type application/javascript
                header Content-Type application/x-javascript
                header Content-Type text/css
                header Content-Type application/xml
                header Content-Type text/javascript
                header Content-Type application/x-httpd-php
                header Content-Type image/jpeg
                header Content-Type image/gif
                header Content-Type image/png
            }
        }
        root * /var/www/html
        file_server

        try_files {path} {path}/ /index.html
    }
}
```

### 实践中遇到的问题

受使用Nginx的习惯影响，开始在匹配器里写了正则，结果发现工作不正常，查了文档发现Caddyfile不支持正则。

`handle / {}` 只匹配根路径，如果要匹配所有路径需要 `handle {}`。
