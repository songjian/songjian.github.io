---
layout: post
title: Pandoc使用
---

Pandoc 是一个文档格式转换工具，可以将 Markdown 文档转成 Epub 和 PDF 文档。
### 最小示例

```bash
pandoc sample_1.md -f gfm -o sample_1.pdf
```

### 转换中文文档

```bash
pandoc sample_cn.md -f gfm -o sample_cn.pdf --pdf-engine=xelatex -V CJKmainfont="SimSun"
```

### 参考

* [Pandoc 电子书生成教程（英文）](https://learnbyexample.github.io/customizing-pandoc/)
* [pandoc 安装与使用](https://zhuanlan.zhihu.com/p/258912543)
* [linux安装中文字体](https://yq.aliyun.com/articles/91153)
