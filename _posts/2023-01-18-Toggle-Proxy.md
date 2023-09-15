---
layout: post
title: 开关代理的工具脚本
tags: Linux proxy
categories: Linux 
---
在`.bashrc`中添加一段开关代理的代码，方便日常在命令行中操作。

```shell
# 打开或关闭代理设置
# 参数:
#   $1: 操作类型，"on"表示打开，"off"表示关闭
function toggle_proxy() {
    if [ "$1" = "on" ]; then
        export http_proxy=http://localhost:20171
        export https_proxy=http://localhost:20171
        export no_proxy=localhost,127.0.0.1,example.com,subdomain.example.com
        echo "Proxy已打开"
    elif [ "$1" = "off" ]; then
        unset http_proxy
        unset https_proxy
        unset no_proxy
        echo "Proxy已关闭"
    else
        echo "无效的操作类型。请使用'on'或'off'。"
    fi
}
```

```bash
# 打开proxy
toggle_proxy on

# 关闭proxy
toggle_proxy off
```
