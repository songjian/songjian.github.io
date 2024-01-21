---
layout: post
title: 使用clip.exe将wsl的输出重定向到Windows剪贴板
categories: [wsl]
tags: [wsl, clip.exe]
---
`Windows` 有个 `clip` 命令，可以把命令行的输出重定向到 `Windows` 剪贴板。

下面是命令的帮助信息：
```
CLIP

Description:
    Redirects output of command line tools to the Windows clipboard.
    This text output can then be pasted into other programs.

Parameter List:
    /?                  Displays this help message.

Examples:
    DIR | CLIP          Places a copy of the current directory
                        listing into the Windows clipboard.

    CLIP < README.TXT   Places a copy of the text from readme.txt
                        on to the Windows clipboard.

```

在 wsl 下使用需要加上命令的后缀名，比如把 `clip.exe` 的帮助信息重定向到剪贴板。

```
clip.exe /? | clip.exe
```
