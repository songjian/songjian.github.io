---
layout: post
title: 手动调用宝塔acme_v2.py获取证书
categories: acme python
---

## 生成证书

```bash
/www/server/panel/pyenv/bin/python /www/server/panel/class/acme_v2.py --domain codeorder.cn,www.codeorder.cn --type http --path /www/wwwroot/codeorder.cn
```

## 复制到cert目录

```bash
cp -r /www/server/panel/vhost/letsencrypt/codeorder.cn /www/server/panel/vhost/cert/
```
