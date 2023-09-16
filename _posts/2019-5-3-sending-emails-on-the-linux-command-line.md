---
layout: post
title: 配置Linux命令行下发送邮件
categories: Linux email
---
### 安装

```sh
sudo apt install -y mailutils ssmtp
```

编辑 `/etc/ssmtp/ssmtp.conf`

```conf
root=no-reply@codeorder.cn
mailhub=smtp.qiye.aliyun.com:465
hostname=s2
TLS_CA_FILE=/etc/ssl/certs/ca-certificates.crt
UseTLS=Yes
UseSTARTTLS=Yes
AuthUser=no-reply@codeorder.cn
AuthPass=******************************
AuthMethod=LOGIN
FromLineOverride=yes
```

为本地用户名创建别名（可选）

编辑 `/etc/ssmtp/revaliases`

```conf
root:no-reply@codeorder.cn:smtp.qiye.aliyun.com:25
```

### 测试邮件发送

```sh
echo -e 'Subject: test\n\nTesting ssmtp' | sendmail -v 001@codeorder.cn
```
