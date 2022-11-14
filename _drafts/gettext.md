---
layout: post
title: gettext国际化
categories: gettext
---
[gettext](https://www.gnu.org/software/gettext/)是自由软件常用的国际化方案。

## 安装

```sh
# Ubuntu
apt install gettext
```

## 使用

#### 从 pot 制作 po

```sh
msginit -i file.pot
```

## 编程

```sh
printf(gettext("My name is %s.\n"), my_name);
printf(_("My name is %s.\n"), my_name); // same, but shorter
```

## GUI编辑工具

* [Poedit](https://poedit.net/)

## 参考

* [gettext - Wikipedia](https://en.wikipedia.org/wiki/Gettext)
* [GNU gettext工具简介](https://www.atjiang.com/gnu-gettext-intro/)

