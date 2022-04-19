---
layout: post
title: 使用docker镜像制作wsl发行版
categories: docker wsl
---
使用的发行版：从Docker导出的Debian 9

```bash
sudo service docker start
docker run -t debian:9.13 bash ls /
dockerContainerID=$(docker container ls -a | grep -i debian:9.13 | awk '{print $1}')
docker export $dockerContainerID > /mnt/c/temp/debian.tar
```

PowerShell中导入发行版
```PowerShell
wsl --import Debian C:\wslDistroStorage\Debian C:\temp\debian.tar
```

创建日常操作的用户
```bash
useradd username -m
usermod -s /bin/bash username
```

拉取常用的dotfiles文件
* [https://github.com/songjian/dotfiles](https://github.com/songjian/dotfiles)
