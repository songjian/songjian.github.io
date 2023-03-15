---
layout: post
title: Let’s Encrypt和Certbot的使用
categories: ssl certbot 'Let's Encrypt'
---
[Let’s Encrypt](https://letsencrypt.org/)是免费颁发TLS证书的机构（CA）。支持使用 [ACME 协议](https://www.rfc-editor.org/rfc/rfc8555) 的软件获取证书。

[Certbot](https://certbot.eff.org/)是Let’s Encrypt推荐的ACME客户端。

## 安装Certbot

#### 安装Python

```sh
# Debian,Ubuntu
apt update
apt install python3 python3-venv libaugeas0

# Fedora,CentOS
dnf install python3 augeas-libs
```

#### 设置Python虚拟环境

```sh
python3 -m venv /opt/certbot/
/opt/certbot/bin/pip install --upgrade pip
```

#### 安装Certbot

```sh
/opt/certbot/bin/pip install certbot certbot-nginx
ln -s /opt/certbot/bin/certbot /usr/bin/certbot
```

## 配置Nginx

```sh
certbot --nginx
```

#### 设置自动更新

```sh
echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null
```

#### 测试

```sh
certbot renew --dry-run
```

#### 手动更新

```sh
certbot certonly --manual
```

#### 添加域名

```sh
certbot --expand -d baidu.com,www.baidu.com
```

## 参考：

* [https://certbot.eff.org/lets-encrypt/pip-nginx](https://certbot.eff.org/lets-encrypt/pip-nginx)
