---
layout: post
title: 打开或关闭代理设置的脚本
tags: Linux proxy
categories: Linux 
---

```bash
# 打开 Proxy
toggle_proxy on

# 关闭 proxy
toggle_proxy off
```

在`.bashrc`中添加下面代码：

```bash
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

