---
layout: post
title: 使用docker安装gitea
categories: [docker]
tags: [docker, gitea]
---
## 拉取gitea镜像

{% highlight bash %}
docker pull gitea/gitea:latest
{% endhighlight %}

## 数据持久化
{% highlight bash %}
# 本地环境
mkdir ~/gitea_data

# 服务器环境
sudo mkdir -p /var/lib/gitea
{% endhighlight %}

## 运行gitea

{% highlight bash %}
docker run -d --name=gitea -p 10022:22 -p 10080:3000 -v ~/gitea_data:/data gitea/gitea:latest
{% endhighlight %}
