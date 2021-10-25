---
layout: post
title: 使用docker作为Jekyll的开发环境
---

Jekyll是一个静态网站生成器，使用ruby语言编写，可以把Markdown文件转换成静态网页。Linux和MacOS系统可以比较简单的在命令行搭建ruby的运行环境，Windows系统上运行比较麻烦，可用的方案有Wsl或者虚拟机，现在还可以Docker作为开发环境。

docker hub上有jekyll的镜像

新建Jekyll网站
{% highlight bash %}
docker run --rm -v $PWD:/srv/jekyll -it jekyll/minimal jekyll new blog
{% endhighlight %}

开发
{% highlight bash %}
cd blog
docker run --rm -v $PWD:/srv/jekyll -p 4000:4000 -it jekyll/minimal jekyll s -wD
{% endhighlight %}

编译
{% highlight bash %}
docker run --rm -v $PWD:/srv/jekyll -it jekyll/minimal jekyll new blog
docker run --rm -v $PWD:/srv/jekyll -it jekyll/minimal jekyll b
{% endhighlight %}