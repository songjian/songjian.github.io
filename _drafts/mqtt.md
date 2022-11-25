---
layout: post
title: MQTT
categories: MQTT
---
## 软件
* 服务器: [EMQX](https://www.emqx.io/)

## 视频
* [物联网之mqtt(emqx)树莓派无脑安装使用教程](https://www.bilibili.com/video/BV1aV411h7Y2)

## 安装mqtt服务器emqx
* [emqx网站](https://www.emqx.io/)
* 得到镜像 `docker pull emqx/emqx:4.2.10`
* 运行emqx `docker run -d --name emqx -p 1883:1883 -p 8081:8081 -p 8083:8083 -p 8084:8084 -p 8883:8883 -p 18083:18083 emqx/emqx:4.2.10`
