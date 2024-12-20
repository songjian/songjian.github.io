---
layout: post
title: "Rails Spring在生产环境启动的问题"
---
有一个奇怪的问题，本来只在开发环境安装gem ‘spring’，但是使用Docker打包镜像的时候，生产环境也会运行spring，最后发现 COPY . . 的时候吧 bin/spring 也拷贝到镜像中，执行拷贝后添加 RUN rm -f bin/spring，生产环境中就没有spring了。
