---
layout: post
title: Neovim使用指南
tags: [Neovim, nvim, vi, vim]
categories: [Neovim]
date: 2023-07-25 10:02:15 +0800
---
## 视频教程

【【全程讲解】Neovim从零配置成属于你的个人编辑器】 [https://www.bilibili.com/video/BV1Td4y1578E/?share_source=copy_web&vd_source=9ac42cf3f70b167e73c61a9cf1563e1e](https://www.bilibili.com/video/BV1Td4y1578E/?share_source=copy_web&vd_source=9ac42cf3f70b167e73c61a9cf1563e1e)

## 使用技术蛋老师的配置

[https://github.com/eggtoopain/Neovim-Configuration-Tutorial](https://github.com/eggtoopain/Neovim-Configuration-Tutorial)
仓库clone下来之后，把nvim目录移动到~/.config/下。

## 使用

### 把vi和vim命令设为neovim

用`which nvim`查看nvim程序路径，一般是/usr/bin/nvim，
然后把nvim链接到vi和vim

```bash
sudo ln -sf /usr/bin/nvim /usr/bin/vi
sudo ln -sf /usr/bin/nvim /usr/bin/vim
```

### 修改系统的默认编辑器

一般Neovim安装好后不在update-alternatives的选项列表中，先把Neovim加入选项列表，再设为默认编辑器

```bash
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 100
sudo update-alternatives --config editor
```

### 安装Hack Nerd Font

在[https://github.com/ryanoasis/nerd-fonts/releases](https://github.com/ryanoasis/nerd-fonts/releases)下载Hack.zip字体，解压后把Hack开头的ttf文件复制到~/.local/share/fonts/

```bash
cp /path/to/your/Hack*.ttf ~/.local/share/fonts/
```

然后，更新字体缓存

```bash
sudo fc-cache -f -v
```

最后，在终端里选择Hack Nerd Font作为终端字体。

### 安装插件

打开`lua/plugins/plugins-setup.lua`文件自动安装插件。
