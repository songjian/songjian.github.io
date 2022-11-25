---
layout: post
title: Orangepi Lite TF卡数据迁移到新TF卡
categories: orangepi
---
1. 使用win32diskimager迁移数据
2. 调整新tf卡分区表
    * sudo fdisk /dev/mmcblk0 操作tf卡
    * 删除/dev/mmcblk0p1分区，记住分区start（起始位置）
    * 重建分区，使用之前的起始位置，结束位置到最大空闲空间
    * 输入w写入分区表
3. 执行 sudo resize2fs /dev/mmcblk0p1 扩容
