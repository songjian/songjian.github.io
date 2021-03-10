---
layout: post
title: wsl安装指南
categories: [技术文章]
---

## 安装

1. 以管理员身份打开PowerShell并运行：
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
更新系统，内部版本号必须是18362.1049+或18363.1049+

2. 启动虚拟机功能：以管理员身份打开PowerShell并运行 
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

3. 重启电脑

4. 下载Linux内核更新包：https://wslstorestorage.blob.core.windows.net/wslblob/wslupdatex64.msi

5. 将WSL2设置为默认版本：以管理员的身份打开PowerShell并运行
```
wsl --set-default-version 2
```

6. 安装Linux分发：https://aka.ms/wslstore，设置新分发：首次启动设置用户名和密码

## 管理

* wsl发行版设置默认用户
  * [发行版] config --default-user <USERNAME>

## 参考：

* [适用于 Linux 的 Windows 子系统安装指南 (Windows 10)](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10)
