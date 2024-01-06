---
layout: post
title: Linux中如何使用脚本切换代理设置
tags: [Linux, Proxy]
categories: [Linux] 
---

在Linux中，我们经常需要切换代理设置，例如，当我们安装pypi、gem的时候，我们需要打开代理；当我们安装完之后，我们需要关闭代理。为了简化这个过程，我创建了一个名为`toggle_proxy`的函数，你可以在`.bashrc`文件中添加这个函数。

以下是`toggle_proxy`函数的代码：

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

可以通过以下命令来使用这个函数：

```bash
# 打开 Proxy
toggle_proxy on

# 关闭 proxy
toggle_proxy off
```
