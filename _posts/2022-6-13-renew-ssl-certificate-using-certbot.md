---
layout: post
title: 使用Certbot更新SSL证书
categories: ssl certbot 'Let's Encrypt'
---

## Certbot

### 自动更新

1. 安装 Certbot 环境

    ```sh
    # Debian,Ubuntu
    apt update
    apt install python3 python3-venv libaugeas0

    # Fedora,CentOS
    dnf install python3 augeas-libs
    ```

1. 设置Python虚拟环境

    ```sh
    python3 -m venv /opt/certbot/
    /opt/certbot/bin/pip install --upgrade pip
    ```

1. 安装certbot

    ```sh
    /opt/certbot/bin/pip install certbot certbot-nginx
    ```

1. 准备

    ```sh
    ln -s /opt/certbot/bin/certbot /usr/bin/certbot
    ```

1. 配置

    ```sh
    certbot --nginx
    ```

1. 设置自动更新

    ```sh
    echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null
    ```

1. 测试

    ```sh
    certbot renew --dry-run
    ```

### 手动更新

```sh
certbot certonly --manual
```

### 添加域名

```sh
certbot --expand -d baidu.com,www.baidu.com
```

#### 参考：

* [https://certbot.eff.org/lets-encrypt/pip-nginx](https://certbot.eff.org/lets-encrypt/pip-nginx)
