---
layout: post
title: Ubuntu 下 Neovim 的配置和使用指南
tags: [Neovim, nvim, vi, vim, Ubuntu, Linux, 配置, 插件, 教程, 使用指南]
categories: [Neovim]
date: 2023-07-25 10:02:15 +0800
---
## 安装

我参考的这个[UP主](https://space.bilibili.com/327247876)的[视频教程](https://www.bilibili.com/video/BV1Td4y1578E/?share_source=copy_web&vd_source=9ac42cf3f70b167e73c61a9cf1563e1e)。

UP主配置文件 Github 仓库地址：[https://github.com/eggtoopain/Neovim-Configuration-Tutorial](https://github.com/eggtoopain/Neovim-Configuration-Tutorial)

### 安装插件

在 `~/.config/nvim/lua/plugins/plugins-setup.lua` 文件中写上需要用的插件，保存文件的时候会自动安装插件。

## 方便日常使用的设置

### .bashrc 中添加 nvim 别名

```bash
# Neovim
alias vi='nvim'
alias vim='nvim'
```

### 修改系统的默认编辑器（可选）

如果你想把 Neovim 设置为系统的默认编辑器，可以按照下面的步骤操作。

```bash
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 100
sudo update-alternatives --config editor
```

### 安装终端图标字体

一些插件需要终端图标字体的支持，比如 nvim-tree 插件。

#### 安装 Hack Nerd Font

下载 GitHub 上的 Nerd Fonts 仓库 Releases 中的 Hack.zip ，解压后把 Hack 开头的 ttf 文件复制到 `~/.local/share/fonts/` 目录下。

```bash
# 复制字体文件到 ~/.local/share/fonts/ 目录下
cp /path/to/your/Hack*.ttf ~/.local/share/fonts/

# 更新字体缓存
fc-cache -f -v
```

最后在终端里选择Hack Nerd Font作为终端字体。

![Hack Nerd Font](/assets/img/2023-7-7-neovim-user-guide/hack-nerd-font.jpg)
