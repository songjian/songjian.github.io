---
layout: post
title: 使用Podman Compose运行Rails 5.1
categories: [Docker]
tags: [Docker, Rails, Podman]
date: 2023-03-19 10:12:21 +0800
---

手上有个老的Rails 5.1项目需要修改功能，clone代码到本地后，发现代码运行在ruby3.0下问题很多，懒得折腾ruby环境了，最后用Podman来运行。

我工作的电脑上已经用Podman替换了Docker，Docker内置compose（容器编排工具），Podman没有，需要单独安装一个[podman-compose](https://github.com/containers/podman-compose)，podman-compose可以兼容docker-compose.yml配置文件，只是podman因为没有root权限的守护进程，所以 `restart: always` 这项用不了。

编写Dockerfile：

```dockerfile
FROM ruby:2.3

WORKDIR /app
VOLUME ["/app/log", "/app/public/images", "/app/public/uploads"]

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y --no-install-recommends \
        nodejs \
    && apt-get install -y ghostscript fonts-freefont-otf \
    && rm -rf /var/lib/apt/lists/* \
    && npm i -g yarn \
    && gem install bundler -v 1.16.6


COPY Gemfile* ./
RUN bundle install
COPY . .
RUN bundle exec rake assets:precompile
```

docker-compose.yml

```yml
version: '3'
services:
  app:
    image: songjiancodeorder/teletop.org:latest
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    env_file: .env
    depends_on:
      - redis
      - db
    ports:
      - 3000:3000
    volumes:
      - ./log:/app/log
      - ./public/images:/app/public/images
      - ./public/uploads:/app/public/uploads
  sidekiq:
    image: songjian/testimage:latest
    command: bundle exec sidekiq
    depends_on:
      - redis
    env_file: .env
    volumes:
      - ./public/images:/app/public/images
  db:
    image: postgres
    env_file: .env
    volumes:
      - pg-data:/var/lib/postgresql/data
  adminer:
    image: adminer
    ports:
      - 8080:8080
  redis:
    image: redis:6.2.6
    command: redis-server /usr/local/redis/redis.conf
    volumes:
      - ./docker/redis/redis.conf:/usr/local/redis/redis.conf
      - redis-data:/data

volumes:
  pg-data:
  redis-data:
```

docker-compose.override.yml

```yml
version: '3'
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/app
  sidekiq:
    build: 
      context: .
      dockerfile: Dockerfile
```

为了日常调试项目方便，写一个配置环境的脚本，调试项目前先执行这个脚本 `. localenv`

```bash
# localenv
export http_proxy=http://192.168.1.202:19180
export https_proxy=http://192.168.1.202:19180
alias rake='podman-compose run app rake'
alias rails='podman-compose run app rails'
alias bundle='podman-compose run app bundle'
alias bash='podman-compose run app bash'
```

