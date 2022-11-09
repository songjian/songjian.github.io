---
layout: post
title: 安装和配置OpenVPN
categories: OpenVPN
---
## 安装OpenVPN和EasyRSA

1. 安装`OpenVPN`
```sh
apt install openvpn
```
2. 安装`EasyRSA`
  * [https://github.com/OpenVPN/easy-rsa](https://github.com/OpenVPN/easy-rsa)

3. gnome 任务栏通知
```sh
apt install network-manager-openvpn-gnome
```

## 笔记

* 服务器配置文件在 `/etc/openvpn/server`
* 客户端配置文件在 `/etc/openvpn/client`
* 并且每种模式都有自己的systemd单元，即 `openvpn@client.service` 和 `openvpn@server.service`

## 制作证书

```sh
./easyrsa init-pki
./easyrsa build-ca
./easyrsa gen-req xx-server nopass
./easyrsa sign server xx-server
./easyrsa gen-dh
openvpn --genkey --secret ta.key
```

### 制作客户端证书

```sh
./easyrsa gen-req a-client
./easyrsa gen-req b-client
./easyrsa sign client a-client
./easyrsa sign client b-client
```

### 客户端证书文件打包

```sh
cd /etc/openvpn
tar cvf client.tar ta.key easy-rsa/pki/ca.crt easy-rsa/pki/private/client.key easy-rsa/pki/issued/client.crt
```

## 配置

* [客户端配置文件示例](https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/client.conf)
* [服务端配置文件示例](https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/server.conf)

## 启动OpenVPN服务器

```sh
# 启动
systemctl start openvpn@server
# 检查状态
systemctl status openvpn@server
```


## 问题

Ubuntu开机提示输入"Enter Private Key Password:"

### Ubuntu客户端配置

systemd启动时需要密码，可以使用下面命令输入

```sh
sudo  systemd-tty-ask-password-agent
```



## 参考

* [使用 OpenVPN 实现远程访问](https://shaocheng.li/posts/2019/07/02/)
* [利用OpenVPN搭建简单VPN](https://james-yip.github.io/2017/11/23/construct-VPN/)
* [openvpn2.3.12安装与easy-rsa3的使用](https://blog.51cto.com/icenycmh/1867641)
* [2x HOW TO](https://openvpn.net/community-resources/how-to/)
* [Easy-RSA 3 Quickstart README](https://github.com/OpenVPN/easy-rsa/blob/master/README.quickstart.md)
* [Setting up a VPN client IBM Cloud Docs](https://cloud.ibm.com/docs/vpc?topic=vpc-setting-up-vpn-client)
* [How To Set Up an OpenVPN Server on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-14-04)
