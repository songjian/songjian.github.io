---
layout: post
title: 使用Docker镜像制作wsl发行版
categories: docker wsl
---

## 从Docker镜像导出发行版tar文件

```sh
sudo service docker start
docker run -t debian:9.13 bash ls /
dockerContainerID=$(docker container ls -a | grep -i debian:9.13 | awk '{print $1}')
docker export $dockerContainerID > /mnt/c/temp/debian.tar
```

## 导入发行版的tar文件

```cmd
mkdir c:\wslDistroStorage
wsl --import Dsc C:\wslDistroStorage\Dsc C:\temp\debian.tar
```
