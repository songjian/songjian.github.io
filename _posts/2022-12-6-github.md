---
layout: post
title: 记一个Github仓库连接问题
categories: Git
---
### 问题：ssh无法连接到仓库

```sh
kex_exchange_identification: Connection closed by remote host
Connection closed by 20.205.243.166 port 22
fatal: 无法读取远程仓库。

请确认您有正确的访问权限并且仓库存在。
```

### 解决方法：使用https端口访问ssh

```sh
$ ssh -T -p 443 git@ssh.github.com
```

或者 `~/.ssh/config` 添加：

```config
Host github.com
  Hostname ssh.github.com
  Port 443
  User git
```

### 参考

[Using SSH over the HTTPS port](https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port)
