---
layout: post
title: WSL开启Systemd支持
categories: windows WSL
---

9月份的时候网上看新闻，说WSL（Linux子系统）已经支持Systemd。

按照网上的介绍WSL需要 0.67.6 或更高版本。

查看 WSL 版本 `wsl --version`，返回了wsl的使用帮助

```ruby
PS C:\Users\001> wsl --version
命令行选项无效: --version
版权所有(c) Microsoft Corporation。保留所有权利。

用法: wsl.exe [Argument] [Options...][CommandLine]

运行 Linux 二进制文件的参数:

    如果未提供命令行，wsl.exe 将启动默认 shell。

    --exec、-e <CommandLine>
        不使用默认 Linux shell 执行指定命令。

    --
        按原样传递剩余命令行。

选项:
    --cd <Directory>
        将指定目录设置为当前工作目录。
        如果使用 ~，则将使用 Linux 用户的主路径。如果路径以 / 字符开头，
        它将被解释为绝对 Linux 路径。
        否则，该值必须是绝对 Windows 路径。

    --distribution、-d <Distro>
        运行指定的分发。

    --user、-u <UserName>
        以指定用户身份运行。

    --system
        为系统分发启动 shell。
```

估计版本差异太大。

然后升级wsl `wsl --update`

```sh
PS C:\Users\001> wsl --update
正在安装: 适用于 Linux 的 Windows 子系统
已安装 适用于 Linux 的 Windows 子系统。
PS C:\Users\001> wsl --version
WSL 版本： 0.70.4.0
内核版本： 5.15.68.1
WSLg 版本： 1.0.45
MSRDC 版本： 1.2.3575
Direct3D 版本： 1.606.4
DXCore 版本： 10.0.25131.1002-220531-1700.rs-onecore-base2-hyp
Windows版本： 10.0.22623.870
```

OK，然后编辑 `/etc/wsl.conf` ，加入：

```conf
[boot]
systemd=true
```

最后重启wsl实例。

```sh
root@rmi-win11:~# systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2022-10-25 08:58:44 CST; 5min ago
     Docs: man:nginx(8)
  Process: 999 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
  Process: 908 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
 Main PID: 1009 (nginx)
    Tasks: 9 (limit: 4915)
   CGroup: /system.slice/nginx.service
           ├─1009 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           ├─1010 nginx: worker process
           ├─1011 nginx: worker process
           ├─1013 nginx: worker process
           ├─1014 nginx: worker process
           ├─1015 nginx: worker process
           ├─1017 nginx: worker process
           ├─1018 nginx: worker process
           └─1020 nginx: worker process

Oct 25 08:58:43 rmi-win11 systemd[1]: Starting A high performance web server and a reverse proxy server...
Oct 25 08:58:44 rmi-win11 systemd[1]: Started A high performance web server and a reverse proxy server.
```
