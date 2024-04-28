---
layout: post
title: 自己搭建DNS服务器
categories: [dns]
tags: [dns, bind9, godaddy]
date: 2024-02-27 14:45:00 +0800
---
## 背景

一般域名注册商都会提供DNS解析服务，但是有时候我们需要自己搭建DNS服务器，比如自己的服务器上有很多域名，或者是自己的服务器上有很多子域名，这时候就需要自己搭建DNS服务器。

## 搭建DNS服务器

我使用的DNS服务器软件是BIND9，操作系统使用的是Ubuntu22.04。

> The Berkeley Internet Name Domain (BIND 9) 是互联网域名服务器的实现。BIND 9是互联网上最广泛使用的域名服务器软件，且由互联网系统协会 <www.isc.org> 提供支持。

### 安装Bind9

```sh
sudo apt install bind
```

## 以Godaddy作为演示

1. 登录Godaddy的域名控制台。
2. 设置DNS服务器的记录，然后在Nameserver填上DNS服务器的IP地址，不然其他域名使用这个DNS服务器时不会生效。

### 设置NS的DNS记录

用于提供DNS的域名中添加二级域名，一般是ns开头数字结尾ns1..ns5

![设置NS的DNS记录](/assets/images/bind9/1.jpg)

### 设置Nameserver

![设置Nameserver](/assets/images/bind9/2.jpg)

## 配置自己的域名使用自己搭建的DNS服务器

设置域名的DNS服务器为自己搭建的DNS地址（ns1.exampledns.cc ns2.exampledns.cc），然后在自己搭建的DNS服务器上修改区域文件。

![设置域名的DNS服务器](/assets/images/bind9/3.jpg)

### 修改区域文件

```sh
sudo vim /etc/bind/named.conf.local
```

```sh
zone "exampledomain.cc" {
    type master;
    file "/etc/bind/zones/db.exampledomain.cc";
};
```

```sh
sudo vim /etc/bind/zones/db.exampledomain.cc
```

```sh
$TTL    300
@       IN      SOA     ns1.exampledns.cc. admin.exampledns.cc. (
                                                        2024022008     ; Serial
                                                        300         ; Refresh
                                                        86400          ; Retry
                                                        2419200        ; Expire
                                                        300 )       ; Negative Cache TTL

@       IN      NS      ns1.exampledns.cc.
@       IN      NS      ns2.exampledns.cc.

@       IN      A       47.28.123.189
www     IN      CNAME   @

```

### 重启Bind9

```sh
sudo systemctl restart bind9
```

## 测试

```sh
dig exampledomain.cc
```
