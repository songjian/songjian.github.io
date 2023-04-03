---
layout: post
title: Newifi Mini刷OpenWrt
tags: ["Lenovo Y1", "Newifi Mini", "openwrt"]
categories: openwrt
date: 2021-10-8
---
## 刷机

1. 官网下载对应固件，设备实际型号为 [Lenove Newifi Y1](https://firmware-selector.openwrt.org/?version=22.03.0&target=ramips%2Fmt7620&id=lenovo_newifi-y1)，选择下载`sysupgrade`。
2. 通过有线连接设备，并将 PC 端设备 IP 设定为 192.168.1.11，子网掩码 255.255.255.0，网关 192.168.1.1 。
3. 拔下路由器后面的电源，拿在手里，然后再次通电，之后迅速按下 RESET 按钮，若是设备上出现两个蓝灯连续闪烁，代表已经进入 U-boot 恢复模式。
4. 在浏览器中输入 192.168.1.1 进入恢复模式页面，选择之前下载的 bin 文件即可开始刷机
5. 将 PC 端设备 IP 重置为自动获取模式，即可开始常规 OpenWrt 配置了

## 常用操作

更新软件包

```sh
opkg update
```

## 参考

> https://linuxtoy.org/archives/install-openwrt-on-newifi-mini.html
>
> https://blog.lbinin.com/interest/Newifi-Padavan.html
>
> https://post.smzdm.com/p/506414/
