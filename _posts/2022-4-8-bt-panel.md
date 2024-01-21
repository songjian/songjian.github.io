---
layout: post
title: 宝塔面板使用记录
categories: [宝塔]
tags: [宝塔]
---
#### 查看默认登录地址

```sh
/etc/init.d/bt default
```

#### 手动调用 acme_v2.py 获取证书

```sh
# 生成证书
/www/server/panel/pyenv/bin/python /www/server/panel/class/acme_v2.py --domain example.cn,www.example.cn --type http --path /www/wwwroot/example.cn

# 复制证书到cert目录
cp -r /www/server/panel/vhost/letsencrypt/example.cn /www/server/panel/vhost/cert/
```
