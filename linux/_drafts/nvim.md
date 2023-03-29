---
layout: post
title: Neovim
---
## 安装

下载最新稳定版 0.8.3

[https://github.com/neovim/neovim/releases/tag/stable](https://github.com/neovim/neovim/releases/tag/stable)

安装

```sh
sudo apt install ./nvim-linux64.deb
```

## 目录文件结构

```sh
$ tree .config/nvim
.config/nvim
├── init.lua
├── lua
│   ├── core
│   │   ├── keymaps.lua
│   │   └── options.lua
│   └── plugins
│       ├── autopairs.lua
│       ├── bufferline.lua
│       ├── cmp.lua
│       ├── comment.lua
│       ├── gitsigns.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── nvim-tree.lua
│       ├── plugins-setup.lua
│       ├── telescope.lua
│       └── treesitter.lua
└── plugin
    └── packer_compiled.lua

4 directories, 15 files
```

## 配置

创建配置文件目录

```sh
mkdir -p ~/.config/nvim
```

创建配置文件

```sh
touch ~/.config/nvim/init.lua
```

:so 重新载入配置

## 插件

[https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

## 依赖

Nerd Fonts 下载安装Symbols Nerd Font

https://www.nerdfonts.com/

## 参考

> * [【全程讲解】Neovim从零配置成属于你的个人编辑器](https://www.bilibili.com/video/BV1Td4y1578E/?share_source=copy_web&vd_source=9ac42cf3f70b167e73c61a9cf1563e1e)
