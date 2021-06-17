#!/bin/bash
git clone git@github.com:songjian/songjian.github.io.git /tmp/songjian.github.io.git
docker-compose run app /bin/bash -c "gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/ && gem install bundler:2.1.4 && bundle _2.1.4_ i && jekyll b"
rsync -av _site/ /tmp/songjian.github.io.git
cd /tmp/songjian.github.io.git
git add .
git commit -m Publish
git push
