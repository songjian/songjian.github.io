---
layout: post
title: 搭建ESP32开发环境
categories: ESP32
---
[ESP-IDF 软件编程指南](https://docs.espressif.com/projects/esp-idf/zh_CN/release-v4.1/index.html)

#### 安装软件包

```sh
sudo apt-get install git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util
```

#### 获取 ESP-IDF

```sh
git clone -b release/v4.1 --recursive https://github.com/espressif/esp-idf.git
```


