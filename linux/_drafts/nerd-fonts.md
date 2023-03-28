---
layout: post
title: 安装Nerd Fonts
tags: ["Nerd Fonts", "Neovim", "Linux", "icon"]
categories: neovim nerdfonts
---
## Foreword
Nerd Fonts是一个字体聚合存储的仓库。Github仓库: [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

## 安装

创建fonts目录

```sh
mkdir -p ~/.local/share/fonts
```

下载字体

```sh
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```
