---
layout: post
title: "WebDAV"
date: 2021-10-28 12:00:00 +0800
categories: programming
---
WebDAV 基于 HTTP 协议的通信协议，在GET、POST、HEAD等几个HTTP标准方法以外添加了一些新的方法，使应用程序可对Web Server直接读写，并支持写文件锁定(Locking)及解锁(Unlock)，还可以支持文件的版本控制。 

Linux挂载WebDAV网盘 

```sh
sudo apt install davfs2 
sudo mount -t davfs http://dav.engr-z/ ./webdav/ 
```


WebDAV Server 

https://github.com/hacdias/webdav 


windows软件 

RaiDrive 


已知问题 

Windows映射WebDav做驱动器，需要WebDav开启HTTPS 