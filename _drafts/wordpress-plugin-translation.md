---
layout: post
title: 制作WordPress语言文件
categories: WordPress
---
`WordPress` 有很多插件和主题可以下载使用，但有时候插件或者主题中没有提供你需要的语言，这个时候我们就需要自己动手制作语言文件。

`WordPress` 使用开源软件中常用的 [gettext](https://www.gnu.org/software/gettext/) 做国际化。

gettext 中有三种文件：

* pot 语言文件模板
* po 翻译人员能看懂的文本文档
* mo 给程序读取的二进制文件

## 制作

###  

官网或者网上下载的插件和主题包解压后，一般在 `languages` 目录里有 `.pot` 后缀的文件，这是插件或主题的语言模板文件，用命令使用 `pot` 制作 `po` 文件：

```sh
msginit -i plugin.pot -l zh_CN -o plugin-zh_CN.po 
```

`po` 文件是人类能看懂的文本格式文档。

可以使用文本编辑器或者GUI编辑工具编辑 `po` 文件，常用GUI编辑工具有：[Poedit](https://poedit.net/) 。

语言文件翻译完，把 `po` 转成 `mo` 文件：

```sh
msgfmt plugin-zh_CN.po -o plugin-zh_CN.mo
```

最后上传制作好的语言文件

插件语言文件上传路径：

```sh
wp-content/languages/plugins/
```

主题语言文件上传路径：

```sh
wp-content/languages/themes/
```

