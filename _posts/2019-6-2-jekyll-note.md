---
layout: post
title: Jekyll使用笔记
categories: ruby jekyll
---

```sh
gem install bundler jekyll
```

### 国内镜像源

#### 修改 Rubygems 默认源

```sh
gem sources  #列出默认源
gem sources --remove https://rubygems.org/  #移除默认源
gem sources -a https://mirrors.ustc.edu.cn/rubygems/  #添加科大源
```

#### 针对使用 Gemfile 和 Bundle 的项目

```sh
bundle config mirror.https://rubygems.org https://mirrors.ustc.edu.cn/rubygems/
```

## 命令

```sh
# 后台运行
nohup jekyll s --host=0.0.0.0 > jekyll.log 2>&1 &

# 启动服务
jekyll s

# 修改立即可见
jekyll s --watch

# 新建项目
jekyll new new_project_name
```

## 文章

* [Migrate from WordPress to Jekyll in 3 Steps](https://talk.hyvor.com/blog/migrate-from-wordpress-to-jekyll/)