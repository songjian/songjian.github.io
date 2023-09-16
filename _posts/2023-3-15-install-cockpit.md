---
layout: post
title: 尝试Cockpit
tags: cockpit podman kvm qeum machines
categories: Linux cockpit
date: 2023-3-15 12:00:00 +0800
---
## Foreword

Cockpit是一个免费的开源的基于web的Linux服务器管理工具。Podman是RedHat公司开发的容器管理工具，用于取代Docker。Podman的好处是不需要守护进程和root身份运行。
 
## 安装Cockpit

```sh
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit
```
 
访问 http://localhost:9090 


![Cockpit](/assets/images/Cockpit/cockpit.jpg)

Cockpit支持安装应用，可以使用命令搜索应用

```sh
sudo apt search cockpit
```

安装Podman和machines管理应用

```sh
sudo apt install cockpit-{podman,machines}
```

Podman管理

![Podman管理](/assets/images/Cockpit/cockpit-podman.png)

虚拟机管理

![虚拟机管理](/assets/images/Cockpit/cockpit-machines.png)
