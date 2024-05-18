---
layout: post
title: Home Assistant + ESPHome 入门
date: 2024-05-18 16:45:00 +0800
categories: iot
tags: homeassistant esphome iot
---
![Home Assistant Logo](/assets/img/ha-esphome/ha-logo.png)

## 简介

Home Assistant 是一款开源的家庭自动化平台，它可以让你通过简单的配置文件来控制和监控家中的各种设备。ESPHome 是一个 Home Assistant 的集成组件，它可以让你通过简单的配置文件来创建和管理 ESP8266/ESP32 设备，让它们变成 Home Assistant 的一部分。

> Home Assistant 官网：[https://www.home-assistant.io/](https://www.home-assistant.io/)

> ESPHome 官网：[https://esphome.io/](https://esphome.io/)

## 准备工作

在开始之前，你需要准备以下工具和材料：

- 一台运行 Home Assistant 的设备
- 一个 ESP8266 或 ESP32 开发板

## 安装 Home Assistant

Home Assistant 的安装支持多种方式，包括 Docker、Python 虚拟环境、操作系统安装等，这里使用 Docker 安装。

创建 Home Assistant 的 compose.yml 文件：

```yaml
name: homeassistant
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - ./config:/config
      - /etc/localtime:/etc/localtime:ro
      - /run/dbus:/run/dbus:ro
    restart: unless-stopped
    privileged: true
    network_mode: host
```

运行 Home Assistant 容器：

```bash
docker-compose up -d
```

执行之后，访问 [http://localhost:8123](http://localhost:8123) ，按照提示完成 Home Assistant 的初始化设置。

![Home Assistant](/assets/img/ha-esphome/ha1.jpg)

设置完成后，你会看到 Home Assistant 的主界面。

![Home Assistant](/assets/img/ha-esphome/ha2.jpg)

## 安装 ESPHome

使用 Python 虚拟环境安装 ESPHome：

```bash
mkdir ~/esphome # 创建目录
cd ~/esphome # 进入目录
python3 -m venv venv # 创建虚拟环境
. venv/bin/activate # 激活虚拟环境
pip install esphome # 安装 esphome
```

测试安装是否成功：

```bash
$ esphome version
Version: 2024.5.0
```

## 创建 ESPHome 项目

给开发板第一次烧录固件，需要通过 USB 转 TTL 串口连接开发板和电脑，之后可以通过 OTA 方式更新固件。

使用 `esphome -h` 查看帮助信息。

创建 ESPHome 项目：

```bash
esphome wizard nodemcu-esp8266.yaml
```

根据提示输入 WiFi SSID 和密码，生成配置文件。

```yaml
esphome:
  name: nodemcu-esp8266

esp8266:
  board: nodemcuv2

# Enable logging
logger:

# Enable Home Assistant API
api:
  password: "otapass"

ota:
  password: "otapass"

wifi:
  ssid: "ly1_iot"
  password: "songwifi"

  # Enable fallback hotspot (captive portal) in case wifi connection fails
  ap:
    ssid: "Nodemcu-Esp8266 Fallback Hotspot"
    password: "KCDrBKcKN360"

captive_portal:
```

编译和上传固件：

```bash
esphome run nodemcu-esp8266.yaml
```

## 添加设备到 Home Assistant

左侧菜单栏点击“配置” - “设备与服务” - “集成”，会自动发现新设备。

点击“配置”，点击“提交”。

![Home Assistant](/assets/img/ha-esphome/ha3.jpg)

填入刚刚配置文件中的 OTA 密码，点击“提交”，完成设备添加。

![Home Assistant](/assets/img/ha-esphome/ha5.jpg)

点击 ESPHome 可以看到刚刚添加的设备。

![Home Assistant](/assets/img/ha-esphome/ha6.jpg)
