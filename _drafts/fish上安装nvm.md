---
layout: post
categories: fish shell linux wsl nvm
---
# fish上安装nvm

第1步 安装fish

```sh
sudo apt install -y fish
```

第2步 安装oh-my-fish

git方式安装
```sh
git clone https://github.com/oh-my-fish/oh-my-fish /tmp/omf
$ cd /tmp/omf
$ bin/install --offline
```

第3步 安装bass

```sh
omf install bass
```

第4步 安装nvm

按照nvm的README.md文件介绍，使用手动安装

```sh
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```

第5步 配置nvm

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

## 完成
