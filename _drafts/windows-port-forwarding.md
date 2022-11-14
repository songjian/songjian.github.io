---
layout: post
title: Windows端口转发
categories: Windows端口转发
---
### 查看规则

```sh
netsh interface portproxy show all
```

### 添加规则

```sh
# 使用管理员权限添加端口转发
# gtl
netsh interface portproxy add v4tov4 listenport=29180 listenaddress=192.168.28.219 connectport=19180 connectaddress=127.0.0.1

netsh interface portproxy add v4tov4 listenport=29181 listenaddress=192.168.28.219 connectport=19181 connectaddress=127.0.0.1

# Office
netsh interface portproxy add v4tov4  listenaddress=192.168.1.82 listenport=29180 connectaddress=127.0.0.1 connectport=19180

netsh interface portproxy add v4tov4  listenaddress=192.168.1.82 listenport=29181 connectaddress=127.0.0.1 connectport=19181

# OpenVPN
netsh interface portproxy add v4tov4  listenaddress=10.8.0.18 listenport=19180 connectaddress=127.0.0.1 connectport=19180

netsh interface portproxy add v4tov4  listenaddress=10.8.9.18 listenport=19181 connectaddress=127.0.0.1 connectport=19181
```

### 删除规则

```sh
netsh interface  portproxy delete v4tov4 listenaddress=192.168.1.82 listenport=29180
```

### Windows防火墙

可以关闭防火墙或者添加【`入站规则`】->【`VPN端口转发`】，`TCP` 允许`19180,19181`端口访问。

### 测试代理能否使用

```sh
curl ipinfo.io -x http://192.168.28.219:29180
curl ipinfo.io -x socks5://192.168.28.219:29181
```

