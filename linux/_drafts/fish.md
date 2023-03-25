---
layout: post
title: fish shell
tags: fish shell linux
categories: shell fish
---
## 安装fish

```sh
sudo apt install -y fish
```

安装oh-my-fish

```sh
git clone https://github.com/oh-my-fish/oh-my-fish /tmp/omf
$ cd /tmp/omf
$ bin/install --offline
```

安装bass

```sh
omf install bass
```

安装nvm

按照nvm的README.md文件介绍，使用手动安装

```sh
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```

配置nvm

创建fish配置文件

```sh
touch ~/.config/fish/config.fish
```

在config.fish添加

```sh
function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end
```

## 引用

> [fish (简体中文)](https://wiki.archlinux.org/title/Fish_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
