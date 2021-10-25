---
layout: post
title: 多docker compose文件使用
categories: Docker
---

docker-compose允许使用多个compose文件，使用`-f`参数指定多个compose.yml文件，后指定的compose文件会去覆盖先指定的compose文件中的值。本地开发环境compose文件命名为`docker-compose.override.yml`，执行`docker-compose up`时会自动读取，生产环境的compose覆盖文件命名为`docker-compose.prod.yml`，执行`docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d`

参考:

* [https://docs.docker.com/compose/extends/#multiple-compose-files](https://docs.docker.com/compose/extends/#multiple-compose-files)
* [https://docs.docker.com/compose/extends/#adding-and-overriding-configuration](https://docs.docker.com/compose/extends/#adding-and-overriding-configuration)