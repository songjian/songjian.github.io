---
layout: post
title: 使用dd命令迁移Windows系统盘
tags: dd linux命令行
categories: linux 命令行
image: /assets/img/dd-command.png
---
## Foreword

国产固态价格便宜、量大管饱，于是买了块1T的固体盘升级笔记本电脑。

## 操作

``` sh
# 查看分区
sudo fdisk -l

# 挂载分区
sudo mount /dev/sdb1 ~/data

# 挂载后通过df命令查看是否挂载成功
df -l

# 使用dd命令制作镜像
sudo dd if=/dev/sda of=~/data/ssd.img

# 使用dd命令恢复镜像
sudo dd if=~/data/ssd.img of=/dev/sda
```

## 感受

1. 使用dd命令迁移硬盘数据速度较慢，250g硬盘制作镜像和恢复用时10小时；
2. Windows的磁盘工具不能把空白空间划到现有分区里，还需要使用第三方工具。