---
layout: post
title: OpenVPN设置
tags: openvpn
categories: openvpn
---
## 安装

#### 安装OpenVPN

```sh
sudo apt install openvpn
```
#### 安装easy-rsa

[https://github.com/OpenVPN/easy-rsa](https://github.com/OpenVPN/easy-rsa)

#### 安装Gnome任务栏通知（可选）
```sh
sudo apt install network-manager-openvpn-gnome
```

## Systemd

#### Server端开机启动
```sh
sudo systemctl enable openvpn@server
```
#### Client端开机启动
```sh
sudo systemctl enable openvpn@client
```

### 启动停止
```sh
# 启动
sudo systemctl start openvpn@server
# 停止
sudo systemctl stop openvpn@server
```

## 配置文件

* 服务器配置文件在 `/etc/openvpn/server`
* 客户端配置文件在 `/etc/openvpn/client`
* 并且每种模式都有自己的systemd单元，即 `openvpn@client.service` 和 `openvpn@server.service`

## easy-rsa

### 生成和签名服务器ca证书
```sh
./easyrsa init-pki
./easyrsa build-ca
./easyrsa gen-req xx-server nopass
./easyrsa sign server xx-server
./easyrsa gen-dh
openvpn --genkey --secret ta.key
```

### 生成和签名客户端证书
有密码证书
```sh
./easyrsa gen-req a-client
./easyrsa sign client a-client
```
无密码证书
```sh
./easyrsa gen-req b-client nopass
./easyrsa sign client b-client
```

### 打包证书文件

```sh
cd /etc/openvpn
tar cvf client.tar ta.key easy-rsa/pki/ca.crt \
    easy-rsa/pki/private/client.key \
    easy-rsa/pki/issued/client.crt
```

## 配置文件示例

* [客户端配置文件示例](https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/client.conf)
* [服务端配置文件示例](https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/server.conf)

## 问题

#### Ubuntu开机提示: `Enter Private Key Password:`

系统启动时需要输入证书密码

```sh
sudo systemd-tty-ask-password-agent
```

## 参考

* [UbuntuHelp:OpenVPN/zh](https://wiki.ubuntu.com.cn/UbuntuHelp:OpenVPN/zh)
* [使用 OpenVPN 实现远程访问](https://shaocheng.li/posts/2019/07/02/)
* [利用OpenVPN搭建简单VPN](https://james-yip.github.io/2017/11/23/construct-VPN/)
* [openvpn2.3.12安装与easy-rsa3的使用](https://blog.51cto.com/icenycmh/1867641)
* [2x HOW TO](https://openvpn.net/community-resources/how-to/)
* [Easy-RSA 3 Quickstart README](https://github.com/OpenVPN/easy-rsa/blob/master/README.quickstart.md)
* [Setting up a VPN client IBM Cloud Docs](https://cloud.ibm.com/docs/vpc?topic=vpc-setting-up-vpn-client)
* [How To Set Up an OpenVPN Server on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-14-04)
