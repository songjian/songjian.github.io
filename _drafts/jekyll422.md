---
layout: post
title: 配置Jekyll 4.2.2
categories: ruby jekyll
---
太久没搞Jekyll的环境，构建的时候报错：

```sh
/usr/gem/gems/jekyll-4.2.2/lib/jekyll/commands/serve/servlet.rb:3:in `require': cannot load such fil/usr/gem/gems/jekyll-4.2.2/lib/jekyll/commands/serve/servlet.rb:3:in `require': cannot load such file -- webrick (LoadError)
```

原因是Webrick已从Ruby 3.0.0中删除，需要单独安装webrick:

```sh
bundle add webrick
```
