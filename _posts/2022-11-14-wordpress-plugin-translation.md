---
layout: post
title: 制作WordPress的语言文件
categories: WordPress
---
`WordPress` 有很多插件和主题可以下载使用，但有时候插件或者主题中没有提供你需要的语言，这个时候我们就需要自己动手制作语言文件。

`WordPress` 做国际化使用开源软件中常用的 [gettext](https://www.gnu.org/software/gettext/) 工具。

#### gettext 用到三类文件：pot、po、mo

* pot：语言模板文件。
* po：翻译人员能看懂的文本文档。
* mo：给程序读取的二进制文件。

### 安装gettext

```sh
sudo apt install gettext
```

### 获得pot

`pot` 是语言的模板文件，用于制作不同语言的语言文件。一般存放在下载的插件或者主题的 `languages` 目录下。如果没有，可以用xgettext命令生成:

```sh
xgettext -k__ -p languages/ -o tgchannels.pot --from-code=UTF-8 tgchannels.php
```

### 制作po

`po` 文件是人类能看懂的文本格式文档。

使用 `msginit` 命令和 `pot` 文件制作语言文件 `po`，例如，制作中文语言文件:

```sh
msginit -i plugin.pot -l zh_CN -o plugin-zh_CN.po 
```

### 合并po

如果翻译文件有新版本，可以合并新旧版po文件。

```sh
msgcat -o plugin-zh_CN.po old.po new.po
```

### 翻译语言文件

可以使用文本编辑器或者GUI编辑工具编辑 `po` 文件，常用GUI编辑工具有：[Poedit](https://poedit.net/) 。

### 制作mo

语言文件翻译完，把 `po` 转成 `mo` 文件，`mo` 是给程序读取的二进制文件。

```sh
msgfmt plugin-zh_CN.po -o plugin-zh_CN.mo
```

### 上传mo

最后上传制作好的语言文件。

#### 路径

插件的语言文件路径：

```sh
wp-content/languages/plugins/
```

主题的语言文件路径：

```sh
wp-content/languages/themes/
```

