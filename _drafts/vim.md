---
layout: post
title: Vim
categories: Vim
---
### 插件管理

[vim-plug](https://github.com/junegunn/vim-plug)

#### 安装插件
```vim
:PlugInstall
```

### 要点

* Vim 的全局配置一般在/etc/vim/vimrc或者/etc/vimrc，对所有用户生效。用户个人的配置在~/.vimrc
* 配置项一般都有"打开"和"关闭"两个设置。"关闭"就是在"打开"前面加上前缀"no"。
* 查询某个配置项是打开还是关闭，可以在命令模式下，输入该配置，并在后面加上问号。例：:set number?
* 如果想查看帮助，可以使用help命令。例：:help number

### 其他

### 使用Win终端+Vim作为开发环境

#### 修改Win快捷键避免和Vim键位冲突

将`copy`的键位改为<alt+c>，`paste`的键位改为<alt+v>

## 参考

* [阮一峰 Vim 配置入门](http://www.ruanyifeng.com/blog/2018/09/vimrc.html)
