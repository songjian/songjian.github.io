---
layout: post
title: 尝试Cockpit、Podman
tags: cockpit podman kvm qeum
categories: cockpit
---
## Foreword

Cockpit是一个免费的开源的基于web的Linux服务器管理工具。Podman是RedHat公司开发的容器管理工具，用于取代Docker。Podman的好处是不需要守护进程和root身份运行。

## 安装

卸载本机的Docker

```sh
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```
 
安装Podman

```sh
sudo apt install podman
```
 
安装podman-compose

```sh
pip3 install podman-compose
```
 
发现podman读取镜像标签的格式和docker不同，jekyll/jekyll:4.2.2可以执行，podman 必须加上v4.2.2 
 
安装Cockpit

```sh
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit
```
 
访问 http://localhost:9090 


![Cockpit](/assets/images/Cockpit/cockpit.jpg)

## 安装Cockpit应用

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