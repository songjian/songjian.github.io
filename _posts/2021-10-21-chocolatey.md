---
layout: post
title: Chocolatey
tags: chocolatey
categories: [windows]
date: 2021-10-21
---
Chocolatey是Windows统一开发环境的基础。

Powershell下安装，以管理员身份运行

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
