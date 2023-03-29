---
layout: post
title: 我的.vimrc
tags: vim
categories: vim
---
~/.vimrc

```vim
set nu

call plug#begin('~/.vim/plugged')
Plug 'git@github.com:junegunn/vim-easy-align'
Plug 'git@github.com:shawncplus/phpcomplete.vim'
Plug 'git@github.com:scrooloose/nerdtree'
Plug 'git@github.com:kien/ctrlp.vim'
Plug 'git@github.com:bling/vim-airline'
Plug 'git@github.com:scrooloose/syntastic'
Plug 'git@github.com:vim-scripts/DoxygenToolkit.vim'
Plug 'git@github.com:scrooloose/nerdcommenter'
Plug 'git@github.com:MarcWeber/vim-addon-mw-utils'
Plug 'git@github.com:tomtom/tlib_vim'
Plug 'git@github.com:garbas/vim-snipmate'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-ruby/vim-ruby'
if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
call plug#end()

let g:snipMate = { 'snippet_version' : 1 }

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set syntax=on
"set mouse=a
set autochdir
set autoread

nnoremap <F5> :! ctags -R<CR>
nnoremap <F6> :! ./gendoc.sh<CR>

nnoremap <F7> :! ssh -p 37565 root@18rich.net deploy-scripts/18rich.net/deploy.sh<CR>
nnoremap <F8> :! ./money_supply.py sj 202201<CR>

map <F2> :NERDTreeToggle<CR>
```

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
