---
layout: post
title: 使用dd命令迁移磁盘数据
categories: linux 数据
image: /assets/img/dd-command.png
---
``` bash

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

## 总结

* 使用dd命令迁移硬盘数据速度较慢，250g硬盘制作镜像加恢复用时10小时
* Windows的磁盘工具不能把空白空间划到现有分区里，需要使用第三方工具