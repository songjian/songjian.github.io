#!/bin/bash
docker-compose down
docker-compose run --rm app jekyll b
git clone git@github.com:songjian/songjian.github.io.git /tmp/songjian.github.io
rsync -av _site/ /tmp/songjian.github.io
cd /tmp/songjian.github.io.git
git add .
git commit -m Publish
git push
