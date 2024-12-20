---
layout: post
title:  "最近学到的3个命令：gh、ansible和borg"
date:   2024-09-26 09:54:09 +0800
# categories: jekyll update
---
## gh

gh是GitHub的CLI，作为一个重度GitHub的使用者，我居然不知道有这个工具，真是相见太晚。

### 安装

```bash
sudo apt install gh
```

使用之前需要先用命令登录一下。

```bash
# 登录
gh auth login
```

命令行会返回一个验证码，复制，然后打开浏览器输入验证码，并授权登录。

gh覆盖了GitHub网站上几乎所有的功能，可以在git仓库中打开GitHub仓库网页，还可以管理gist、issue、pr、project、workflow等等。

## ansible

ansible是一个IT自动化工具，可以批量管理服务器，通过编写yml格式playbook（剧本）来执行服务器操作。

ansible分为控制节点和被管理节点，只需要在控制节点上安装ansible软件包，被控制节点通过SSH管理，因此被控制节点上不需要安装ansible相关包。

安装必要软件包的playbook

```yaml
---
- hosts: homelab
  tasks:
    - name: 安装更新
      apt:
        update_cache: yes
        name: "{{ item }}"
        state: present
      with_items:
        - build-essential     # 基础构建工具
        - git                 # Git 版本控制
        - curl                # 数据传输工具
        - wget
        - vim                 # 文本编辑器
        - tmux
        - python3             # Python 3
        - python3-pip         # Python 包管理工具
        - python3-venv        # Python 虚拟环境
        - openjdk-11-jdk      # Java 开发工具包
        - gcc                 # C 编译器
        - g++                 # C++ 编译器
        - cmake               # CMake 构建系统
        - libssl-dev          # SSL 库
        - libffi-dev          # FFI 库
        - postgresql-client   # PostgreSQL 客户端
        - gh                 # GitHub CLI
        - tk-dev              # Tkinter 开发库
        - libncurses5-dev     # ncurses 开发库
        - libncursesw5-dev    # ncurses 开发库
        - libreadline-dev     # readline 开发库
        - libsqlite3-dev      # SQLite 开发库
        - libgdbm-dev         # GDBM 开发库
        - libssl-dev          # SSL 开发库
        - libbz2-dev          # Bzip2 开发库
        - libffi-dev          # FFI 开发库
        - zlib1g-dev          # zlib 开发库
        - openssh-server      # SSH 服务
      become: yes
```

执行playbook

```bash
ansible-playbook -i hosts playbook.yml
```

## borg

borg是一个命令行备份工具。和tar和rsync命令相比，borg自带去重、加密和压缩，更适合生产环境使用。

### 安装

Ubuntu 24.04发行版中apt包是1.2.8版本，需要更高版本可以使用pipx安装1.4.0版本。

```bash
pipx install borgbackup
```

使用前需要先初始化一个备份数据的仓库

```bash
borg init --encryption=repokey /path/to/repo
```

创建一个归档

```bash
borg create /path/to/repo::Monday ~/src ~/Documents
```

Monday是归档名称，后面跟着要备份的路径，可以有多个备份路径。
