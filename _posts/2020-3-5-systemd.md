---
layout: post
title: Systemd使用
categories: Linux Systemd
---
## 参考

### 入门

* [阮一峰 Systemd 入门教程：命令篇](https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)
* [阮一峰 Systemd 入门教程：实战篇](https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)

### 进阶

* [Unit 配置文件的完整字段清单官方文档](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)
* [官方 Target 依赖关系图](https://www.freedesktop.org/software/systemd/man/bootup.html#System%20Manager%20Bootup)
* [systemd (简体中文)/User (简体中文)](https://wiki.archlinux.org/title/Systemd_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)/User_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

## 笔记

* 历史上，Linux 的启动一直采用init进程。
* 根据 Linux 惯例，字母 `d` 是守护进程（daemon）的缩写。
* 使用了 Systemd，就不需要再用init了。
* Systemd 取代了initd，成为系统的第一个进程（PID 等于 1），其他进程都是它的子进程。
* Systemd 默认从目录`/etc/systemd/system/`读取配置文件。但是，里面存放的大部分文件都是符号链接，指向目录`/usr/lib/systemd/system/`，真正的配置文件存放在那个目录。
* 改配置文件，就要让 SystemD 重新加载配置文件，然后重新启动，否则修改不会生效。
* 注意，配置文件的区块名和字段名，都是大小写敏感的。
* Wants字段：表示sshd.service与sshd-keygen.service之间存在"弱依赖"关系，即如果"sshd-keygen.service"启动失败或停止运行，不影响sshd.service继续执行。
* Requires字段则表示"强依赖"关系，即如果该服务启动失败或异常退出，那么sshd.service也必须退出。
* Wants字段与Requires字段只涉及依赖关系，与启动顺序无关，默认情况下是同时启动的。
* 所有的启动设置之前，都可以加上一个连词号（-），表示"抑制错误"，即发生错误的时候，不影响其他命令的执行。比如，`EnvironmentFile=-/etc/sysconfig/sshd`（注意等号后面的那个连词号），就表示即使`/etc/sysconfig/sshd`文件不存在，也不会抛出错误。
* `RemainAfterExit` 字段设为 `yes` ，表示进程退出以后，服务仍然保持执行。
* `Restart` 字段，对于守护进程，推荐设为`on-failure`。对于那些允许发生错误退出的服务，可以设为`on-abnormal`。
* 常用的 Target 有两个：一个是 `multi-user.target` ，表示多用户命令行状态；另一个是 `graphical.target` ，表示图形用户状态，它依赖于 `multi-user.target` 。
* 查看启动时的默认 Target : `systemctl get-default` 。

## 常用命令

```sh
# 启动服务
systemctl start httpd

# 查看服务状态
systemctl status httpd

# 杀进程
systemctl kill httpd.service

# 重启服务
systemctl restart httpd.service

# 命令可以查看配置文件的内容
systemctl cat atd.service

# 修改配置文件后重启
systemctl daemon-reload
systemctl restart httpd.service
```
