# 我如何使用shell

开始比较全面的接触shell是在2015年，公司给配了MBP，之前主要使用的系统是windows，所以对类Unix工具非常陌生，只会使用简单的cd\cp\mv命令，直到有一次看到同事使用scp命令把本机的文件拷贝到远程主机，打开了我新世界的大门，原来不光有cd\cp\mv命令，还有scp\rsync，后来又学习了Vim。

shell对我来说是很好的工具。

大纲

1. bash/zsh/fish
2. dotfile管理





常用的shell有，bash、zsh和fish，我个人最常用的shell是fish，

fish新手可以作为bash的子进程运行，

fish使用方法

1. 作为bash的子进程
2. 设置为默认shell

我推荐新手选择将fish作为bash的子进程，这样以前配置的

管理dotfiles

linux使用"."开头的文件作为配置文件，比如：.profile\\.bashrc\\.bash_profile\\.vimrc等等，如果你平时要在几台电脑上工作，电脑间配置不一致造成的运行环境不统一，

个人home目录下.开头的文件，可能是电脑最重要的文件，如果管理好他们

使用git管理dotfiles

1. 建立git仓库，把需要管理的dotfile加入仓库
2. 写脚本把仓库里的dotfile文件链接到用户主目录下


