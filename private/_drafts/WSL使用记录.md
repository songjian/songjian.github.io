---
layout: post
categories: [技术文章]
---
Windows Subsystem for Linux 简称 wsl

## wsl使用中遇到的问题

wsl还不完全兼容linux，使用中有如下问题：

* Systemd不可用
* docker引擎不可用
* wsl挂载的windows磁盘，内容修改后不能及时反应，解决办法：文件保存到wsl的linux文件系统下

## wsl重启

以管理员身份运行cmd，执行：

```cmd
net stop LxssManager
net start LxssManager
```

## 卸载

开始菜单找到标签，右键卸载

## 开发环境

## ruby

### rvm

```bash
# Install GPG keys
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable
```

## python

```bash
sudo apt install python3
```

## 参考

* [wsl faq](https://docs.microsoft.com/zh-cn/windows/wsl/faq)
* [Troubleshooting Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting)


