---
layout: post
title: 安装Cockpit
tags: cockpit
categories: cockpit
---
## 安装

```sh
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit
```

## 访问

[http://localhost:9090](http://localhost:9090)

![Cockpit](/assets/images/Cockpit/cockpit.jpg)

## 安装应用

搜索应用

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