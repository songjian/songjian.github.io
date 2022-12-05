---
layout: post
title: R3P
categories: OpenWrt
---
### 安装OpenWrt

#### 问题: no matching key exchange method found. Their offer: diffie-hellman-group1-sha1,diffie-hellman-group14-sha1

`~/.ssh/config`添加

```sh
KexAlgorithms +diffie-hellman-group1-sha1
HostkeyAlgorithms +ssh-rsa
PubkeyAcceptedAlgorithms +ssh-rsa
```

#### 下载固件

[下载固件](https://firmware-selector.openwrt.org/?version=22.03.2&target=ramips%2Fmt7621&id=xiaomi_mi-router-3-pro)

第一次安装选择Factory
