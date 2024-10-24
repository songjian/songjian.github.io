---
layout: post
title: 搭建flutter-webrtc记录
date: 2021-12-13 10:00:00 -0500
categories: webrtc
tags: webrtc flutter
---
GitHub地址：

> https://github.com/flutter-webrtc/flutter-webrtc-server
>
> https://github.com/flutter-webrtc/flutter-webrtc-demo
>
> https://github.com/FiloSottile/mkcert

1、部署服务端 

```sh
git clone https://github.com/cloudwebrtc/flutter-webrtc-server.git
cd flutter-webrtc-server
```
 

2、安装mkcert 

```sh
sudo apt install libnss3-tools
git clone https://github.com/FiloSottile/mkcert && cd mkcert
go build -ldflags "-X main.Version=$(git describe --tags)"
```

3、制作本机证书 

```sh
mkcert -key-file configs/certs/key.pem -cert-file configs/certs/cert.pem  localhost 127.0.0.1 ::1 0.0.0.0
```


4、运行服务端

```sh
go run cmd/server/main.go
```

 

5、部署 flutter-webrtc-demo

```sh
git clone https://github.com/cloudwebrtc/flutter-webrtc-demo
cd flutter-webrtc-demo
flutter packages get
flutter run
```