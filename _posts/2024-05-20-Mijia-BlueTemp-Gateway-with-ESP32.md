---
layout: post
title: ESP32 米家蓝牙网关
date: 2024-05-20 21:35:00
categories: iot
tags: [ESP32, ESPHome, Xiaomi, Bluetooth, BLE, NodeMCU ESP32S, LYWSD03MMC, Home Assistant]
---
![LYWSD03MMC](/assets/img/ESP32-Bluetooth-gateway/LYWSD03MMC.jpg)

## 原理

米家温湿度计 LYWSD03MMC 是一个低功耗蓝牙设备，可以通过蓝牙网关连接到 Home Assistant。ESP32 开发板可以作为蓝牙网关，通过 ESPHome 固件实现。

## 硬件和软件

| 开发板 | 温湿度传感器 | 固件 |
| --- | --- |
| NodeMCU ESP32S | LYWSD03MMC | ESPHome |

## 开发板刷入 ESPHome 固件

![nodemcu esp32s](/assets/img/ESP32-Bluetooth-gateway/1.jpg)

创建 ESPHome 项目：

```bash
esphome wizard esp32-mijia-bluetemp-gateway.yml
```

`esp32-mijia-bluetemp-gateway.yml` 配置文件：

```yaml
esphome:
  name: esp32-mijia-bluetemp-gateway

esp32:
  board: nodemcu-32s
  framework:
    type: arduino

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
    ssid: "ESP32-Mijia-Bluetemp-Gateway"
    password: "xMhAXAPWNbmV"

captive_portal:
```

## 通过 Xiaomi Cloud Tokens Extractor 获得米家温湿度计的 MAC 地址和绑定密钥

> Xiaomi Cloud Tokens Extractor GitHub仓库：[https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor](https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor)

按照官网说明执行：

```bash
bash <(curl -L https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor/raw/master/run.sh)
```

然后需要输入小米的帐号和密码，就可以看见你的智能硬件列表，找到你的设备：

```txt
---------
NAME:     温湿度计
ID:       blt.3.1hn2d****c400
BLE KEY:  3dd4f3685158b********a8555cb3eb3
MAC:      A4:C1:38:75:20:47
TOKEN:    547c8beda1****84aa9b4701
MODEL:    miaomiaoce.sensor_ht.t2
---------
```

## 配置 ESPHome

在 ESPHome 的 yml 配置文件中增加 `esp32_ble_tracker` 和 `sensor` 部分：

```yaml

esp32_ble_tracker:

sensor:
  - platform: xiaomi_lywsd03mmc
    mac_address: "A4:C1:38:75:20:47"
    bindkey: "3dd4f3685158b********a8555cb3eb3"
    temperature:
      name: "LYWSD03MMC Temperature"
    humidity:
      name: "LYWSD03MMC Humidity"
    battery_level:
      name: "LYWSD03MMC Battery Level"
```

`bindkey` 使用 `BLE KEY` 。

## 上传固件

编辑好 ESPHome 的 yml 配置文件，上传固件到 ESP32 开发板。

```bash
esphome run esp32-mijia-bluetemp-gateway.yml
```

## 在 Home Assistant 中添加设备后可查看温度和湿度

![Home Assistant](/assets/img/ESP32-Bluetooth-gateway/2.jpg)
