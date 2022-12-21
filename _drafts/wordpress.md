---
layout: post
title: WordPress
categories: WordPress
---
### 架构

WordPress是Core/Plugin架构。类似Vim，由程序和插件组成。

#### 插件


要实现的功能应该放在一个新的Plugin里面。如果修改Core代码，你新作的功能就没有可移植性。

为什么代码要有可移植性？一是因为WordPress Core和新代码升级的时候会覆盖你的代码；另一个是因为可移植你就可以单独出售新功能的代码。

#### 主题

WordPress支持Block和Classic主题，Block主题是WordPress5.9版开始支持的。

#### 实践

WordPress官方给出的参考代码是在PHP文件中通过`?> <?php`方式写HTML代码，插件可维护性不太好。

#### 其他

WordPress使用GPLv2许可证。意味着它是自由软件。但是它与你在Github上看到其他开源软件有很大的不同。你的主要功能环境是Plugin的开发环境，Core代码你一般不需要关心。就像是Vim一样，

### 创建主题

#### 创建空主题

WordPress官方Github账号下有一个theme-experiments仓库，里面有一个新建空主题的脚本 new-empty-theme.php。

```sh
git clone git@github.com:WordPress/theme-experiments.git
cd theme-experiments
php new-empty-theme.php
```

#### 基于现有主题修改
