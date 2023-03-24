---
layout: post
title: 使用Netsh命令做Windows端口转发
categories: Windows端口转发
---
### Foreword

有时候软件提供了访问端口，可能受网络限制或者提供的端口是回送地址，无法让运行软件的机器之外访问，这个时候可以通过端口转发，把原本只能在本机访问的端口转发到局域网或者公网上。

### 使用Netsh命令做端口转发

Windows系统上提供了[Netsh](https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-contexts)命令，可以实现端口转发功能。

#### 查看已有转发规则

```sh
netsh interface portproxy show all
```

#### 添加和删除规则

添加或删除规则操作需要管理员权限

添加规则
```sh
# 适用所有ip
netsh interface portproxy add v4tov4  listenaddress=0.0.0.0 listenport=19180 connectaddress=127.0.0.1 connectport=19180
netsh interface portproxy add v4tov4  listenaddress=0.0.0.0 listenport=19181 connectaddress=127.0.0.1 connectport=19181

# 限制ip
netsh interface portproxy add v4tov4  listenaddress=10.8.0.18 listenport=19180 connectaddress=127.0.0.1 connectport=19180
netsh interface portproxy add v4tov4  listenaddress=10.8.0.18 listenport=19181 connectaddress=127.0.0.1 connectport=19181
```

删除规则
```sh
netsh interface  portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=19180
```

#### 测试转发能否使用

http或https
```sh
curl ipinfo.io -x http://10.8.0.18:19180
```

socks5
```sh
curl ipinfo.io -x socks5://10.8.0.18:19181
```

### 防火墙设置

设置防火墙：添加【`入站规则`】->【`VPN端口转发`】，`TCP` 允许`19180,19181`端口访问。

为了转发的端口在局域网正常方法，可能需要更改防火墙设置。如果局域网是家庭环境，直接关闭防火墙更简单一些。