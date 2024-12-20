---
layout: post
title: "Ubuntu通过FreeRDP连接Windows远程桌面"
---
xfreerdp 是 FreeRDP 的一个命令行工具，它是一个开源的远程桌面协议（RDP）客户端。

```bash
xfreerdp /v:192.168.2.117 /u:001 /p:password /f /sound +clipboard /cert-ignore /log-level:DEBUG +home-drive
```

常用参数

* /v：服务器地址
* /u：登录用户
* /p：登录密码
* /f：全屏
* /sound：这个选项启用了音频重定向，这意味着你可以在本地机器上听到远程桌面的声音。
* +clipboard：这个选项启用了剪贴板共享，这意味着你可以在本地机器和远程桌面之间复制和粘贴文本。
* /cert-ignore：这个选项让 xfreerdp 忽略远程服务器的证书错误。这可能会降低安全性，因为它允许 xfreerdp 连接到使用无效或自签名证书的服务器。
* /log-level:DEBUG：这个选项设置了日志级别为 DEBUG，这意味着 xfreerdp 会输出详细的调试信息。这对于解决问题很有帮助，但可能会产生大量的输出。
* +home-drive：这个选项启用了主目录驱动器的重定向，这意味着你可以在远程桌面上访问你的本地主目录。
* /scale:180：这个选项设置了远程桌面的缩放比例为180%。这对于高分辨率的显示器很有用，因为它可以使远程桌面的内容更大，更易于阅读。
* /sec:tls：这个选项设置了 xfreerdp 使用 TLS 安全协议进行连接。TLS 是一种加密协议，它可以保护你的连接免受窃听和篡改。这个选项可以提高安全性，但可能需要远程服务器的支持。
