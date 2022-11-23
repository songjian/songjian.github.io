---
layout: post
title: Linux知识整理
categories: Linux
---
## 知识
* Code Review
* 系统调用，英语：`system call`

## 技巧
<pre>
noremap是不会递归的映射 (大概是no recursion)例如noremap Y ynoremap y Y不会出现问题前缀代表生效范围inoremap就只在插入(insert)模式下生效vnoremap只在visual模式下生效nnoremap就在normal模式下(狂按esc后的模式)生效这样可以减少快捷键所用到的键位组合的个数一个组合可以有多种用途 就不用费劲心思思考 该映射哪个没被绑定过的键了
</pre>
* Debian 安装 ctags `apt install ctags`;
* 把ctag映射到vim的`<F5>`键: `:nnoremap <f5> :!ctags -R<CR>`
* vim每次保存时制作ctags: `:autocmd BufWritePost * call system("ctags -R")`
* Windows Terminal保留了`<ctrl+c>`和`<ctrl+v>`快捷键，可以修改为别的，避免和vim快捷键冲突

## Linux
* [rsync 用法教程](http://www.ruanyifeng.com/blog/2020/08/rsync.html)
* [Linux 连续执行多条命令的方法](https://blog.csdn.net/freedom2028/article/details/7104131)
* [如何在 Linux 系统里查找并删除重复相片](https://linux.cn/article-13661-1.html)
* [Bash教程](https://wangdoc.com/bash/intro.html)
* CST 中国标准时间

### 基础
* `/dev/null`表示一个黑洞，通用用于丢弃不需要的数据，或用用于输入流的空文件
* `Linux` / `Unix` 文件的 `atime` `ctime` `mtime` 属性
  * `atime` (last Access time) 最近一次访问文件的时间，访问指的是 读取或者执行文件/文件夹的时间
  * `ctime` (last Change time) 最近一次 metadata 修改的时间，这里修改有两层意思：
    * 修改文件/文件夹的 metadata，比如 user/group 或者访问权限（比如 chmod)
    * 修改文件内容
  * `mtime`  (last Modify time) 最近一次修改的时间，这里的修改 专指文件的内容修改

### 输入输出重定向
* 标准输入STDIN，文件描述符`0`；标准输出STDOUT，文件描述符`1`；标准错误STDERR，文件描述符`2`。
* 对于重定向中的标准输出模式，可以省略文件描述符`1`不写，而错误输出模式的文件描述符`2`是必须要写的。
* `&`是等同于的意思，`2>&1`
* `command > file 2>file`和`command > file 2>&1`，两条命令，第一条file被打开两次，第二条stderr继承了FD1管道，再被送到file，file只被打开一次
* `command &>> file`等同于`command >> file 2>&1`

### strace - 一个可用于诊断、调试和教学的Linux用户空间跟踪器
* linux syscall tracer
* [强大的strace命令用法详解](https://www.linuxidc.com/Linux/2018-01/150654.htm)
* https://strace.io/

### SSH
* [使用https端口访问ssh](https://docs.github.com/en/github/authenticating-to-github/troubleshooting-ssh/using-ssh-over-the-https-port)

## Linux 获取公网 IP

```sh
curl ipinfo.io/ip
```

## Linux消息队列

- msgget函数用来创建和访问一个消息队列，它的原型为:`int msgget(key_t, key, int msgflg);`
- msgsnd函数用来把消息添加到消息队列中，它的原型为：`int msgsend(int msgid, const void *msg_ptr, size_t msg_sz, int msgflg);`
- msgrcv函数用来从一个消息队列获取消息，它的原型为: `int msgrcv(int msgid, void *msg_ptr, size_t msg_st, long int msgtype, int msgfly);`
- msgctl函数用来控制消息队列，它与共享内存的shmctl函数相似，它的原型为: `int msgctl(int msgid, int command, struct msgid_ds *buf);
  * command是将要采取的动作，它可以取3个值，
    * IPC_STAT：把msgid_ds结构中的数据设置为消息队列的当前关联值，即用消息队列的当前关联值覆盖msgid_ds的值。
    * IPC_SET：如果进程有足够的权限，就把消息列队的当前关联值设置为msgid_ds结构中给出的值
    * IPC_RMID：删除消息队列
  * buf是指向msgid_ds结构的指针，它指向消息队列模式和访问权限的结构。msgid_ds结构至少包括以下成员：
  ```c
  struct msgid_ds
  {
    uid_t shm_perm.uid;
    uid_t shm_perm.gid;
    mode_t shm_perm.mode;
  }
  ```

## Linux工具

### Make

- 代码变成可执行文件，叫做编译（compile）；先编译这个，还是先编译那个（即编译的安排），叫做构建（build）。
- Make是最常用的构建工具，诞生于1977年，主要用于C语言的项目。但是实际上 ，任何只要某个文件有变化，就要重新构建的项目，都可以用Make构建。
- Make命令依赖Makefile文件进行构建，Makefile文件也可以写为makefile， 或者用命令行参数指定为其他文件名。`make -f rules.txt`或`make --file=rules.txt`
- 如果Make命令运行时没有指定目标，默认会执行Makefile文件的第一个目标
- 声明伪目标：.PHONY，避免一个操作在目录中有对应的文件，例如：操作名`clean`
- 前置条件（prerequisites）通常是一组文件名，之间用空格分隔。它指定了"目标"是否重新构建的判断标准：只要有一个前置文件不存在，或者有过更新（前置文件的last-modification时间戳比目标的时间戳新），"目标"就需要重新构建。
- 命令（commands）
  - 命令（commands）表示如何更新目标文件，由一行或多行的Shell命令组成
  - 每行命令之前必须有一个tab键。如果想用其他键，可以用内置变量.RECIPEPREFIX声明
  ```sh
  .RECIPEPREFIX = >
  all:
  > echo Hello, world
  ```
  - 每行命令在一个单独的shell中执行。
  - 解决多行命令在一个进程中执行的方法
    - 命令写在一行用`;`隔开
    - 在换行前使用反斜杠`\`转义
    - 使用`.ONESHELL:`命令
    ```sh
    .ONESHELL:
    var-kept:
    export foo=bar;
    echo "foo=[$$foo]"
    ```

### read

- 它将用户的输入存入变量，方便后面的代码使用。用户按下回车键，表示输入结束
- read格式`read [-options] [variable...]`
- 如果没有提供变量名，环境变量REPLY会包含用户输入的一整行数据
- read可以接收多个变量，如果用户的输入项少于read命令给出的变量数目，额外的变量值为空，如果用户输入项多于定义的变量，多余的输入项会包含到最后一个变量中
- IFS变量
  - `read`命令读取的值，默认是以空格分隔。可以通过自定义环境变量IFS（内部字段分隔符，Internal Field Separator 的缩写），修改分隔标志
  - IFS的默认值是空格、Tab 符号、换行符号，通常取第一个（即空格）
  ```sh
  #!/bin/bash
  # read-ifs: read fields from a file

  FILE=/etc/passwd

  read -p "Enter a username > " user_name
  file_info="$(grep "^$user_name:" $FILE)"

  if [ -n "$file_info" ]; then
    IFS=":" read user pw uid gid name home shell <<< "$file_info"
    echo "User = '$user'"
    echo "UID = '$uid'"
    echo "GID = '$gid'"
    echo "Full Name = '$name'"
    echo "Home Dir. = '$home'"
    echo "Shell = '$shell'"
  else
    echo "No such user '$user_name'" >&2
    exit 1
  fi
  ```

### chroot

- chroot，即 change root directory (更改 root 目录)。在 linux 系统中，系统默认的目录结构都是以 /，即以根 (root) 开始的。而在使用 chroot 之后，系统的目录结构将以指定的位置作为 / 位置。

### Suckless

## Linux 发邮件

* `mail` 命令是 Linux 终端发送邮件用的最多的命令。
* `mailx` 是 `mail` 命令的更新版本，基于 Berkeley Mail 8.1，意在提供 POSIX `mailx` 命令的功能，并支持 MIME、IMAP、POP3、SMTP 和 S/MIME 扩展。
* `mailx` 在某些交互特性上更加强大，如缓冲邮件消息、垃圾邮件评分和过滤等。
* 在 Linux 发行版上， `mail` 命令是 `mailx` 命令的软链接。

### 参考

* [在 Linux 命令行发送邮件的 5 种方法](https://linux.cn/article-11663-1.html)
* [sSMTP - ArchWiki](https://wiki.archlinux.org/title/SSMTP)

## Sudo 和 Wheel 组

* Debian 系统默认没有安装 `sudo`，需要安装使用
```sh
su -
apt install sudo
adduser [username] sudo
```
* 设置 sudo 用户的默认编辑器
```sh
sudo update-alternatives --config editor
```
* 编辑 `sudoer` 配置文件使用命令 `visudo`， 加入 `%sudo   ALL=(ALL:ALL) NOPASSWD: ALL` ，可免密码使用 `sudo` 命令。
* `sudoer` 配置中加入 `username   ALL=(ALL:ALL) NOPASSWD: ALL`，可让指定用户免密码使用 `sudo` 命令。
* Ubuntu/Debian 的超级用户组是 `sudo`。
* CentOS/MacOS/ArchLinux 的超级用户组是 `wheel`。
* Unix 中没有 root 组，root 组就是 `wheel`，id 0
* 参考
  * [关于 root 和 wheel：在 Linux 中创建管理员账号（root 权限）的正确方式](https://sysin.org/blog/linux-root/)
  * [sudo命令免密码 sudo免密码](https://blog.csdn.net/qq_45704640/article/details/113703872)

## 学习

https://docs.github.com/cn/developers/overview/managing-deploy-keys

## 值得关注的人

* [dog250](https://blog.csdn.net/dog250)
* [Tylor](https://tylorliu.github.io/)

## 免费电子书

* [本书是 The Linux Command Line 的中文版](https://billie66.github.io/TLCL/index.html)

## 稍后学习

* [https://docs.victoriametrics.com/](https://docs.victoriametrics.com/)
* [[推荐]你还在手撕微服务？快试试 go-zero 的微服务自动生成神器，这可能是我见过最简单好用的微服务框架](https://github.com/ruanyf/weekly/issues/1397)

### 设置静态IP

例如设置ip地址为 192.168.31.6

sudo vim /etc/netplan/00-installer-config.yaml

```
# This is the network config written by 'subiquity'
network:
  ethernets:
    eno1:
      dhcp4: false
      addresses: [192.168.31.6/24]
      optional: true
      gateway4: 192.168.31.1
      nameservers:
              addresses: [223.5.5.5,223.6.6.6]
  version: 2
```

### 其他

[Linux自动挂载（配置/etc/fatab）详解](http://c.biancheng.net/view/900.html)

[新建分区](https://blog.csdn.net/arenn/article/details/78866251)

## Linux 终端快捷键

```sh
Ctrl+p # shell 中上一个命令，或者文本中移动到上一行
Ctrl+n # shell 中下一个命令，或者文本中移动到下一行
Ctrl+r # 往后搜索历史命令
Ctrl+s # 往前搜索历史命令
Ctrl+f # 光标前移
Ctrl+b # 光标后退
Ctrl+a # 到行首
Ctrl+e # 到行尾
Ctrl+d # 删除一个字符，删除一个字符，相当于通常的 Delete 键
Ctrl+h # 退格删除一个字符，相当于通常的 Backspace 键
Ctrl+u # 删除到行首
Ctrl+k # 删除到行尾
Ctrl+l # 类似 clear 命令效果
Ctrl+y # 粘贴
```

## History 历史记录

### 查看历史命令

```sh
history
```

### 前后查找命令

```sh
history | less
```

### 过滤命令

```sh
history | grep command
```

### 快速执行历史命令

```sh
!1991
```

