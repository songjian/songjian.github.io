---
layout: post
title: 使用nmap查找局域网主机
tags: rdesktop win11
catetories: rdesktop
---
## Foreword

局域网内有台win主机用来跑服务，但是办公室没有显示器，所以只能通过远程桌面连接主机，因为没有显示器也没有路由器的管理密码，没法查看主机DHCP获取到的IP地址，所以只能通过扫码局域网，找到主机IP地址。这时可以用nmap命令找到主机IP地址。

## 使用nmap查找局域网主机

主机先不插网线扫描 

nmap -sP 192.168.1.0/24 

然后插上网线再扫描一次，多出来的IP地址就是win主机的。 

然后使用rdesktop命令连接 

rdesktop -u sj 192.168.1.212 

成功！ 
