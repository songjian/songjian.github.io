---
layout: post
title: Nginx路径重写
categories: [nginx]
tags: [nginx]
---
{% highlight nginx %}
server {
    listen       80;
    server_name  www.nginx.org  nginx.org;
    if ($http_host = nginx.org) {
        rewrite  (.*)  http://www.nginx.org$1;
    }
}
{% endhighlight %}