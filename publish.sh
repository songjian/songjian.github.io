#!/bin/bash
git clone git@github.com:songjian/songjian.github.io.git /tmp/songjian.github.io.git
jekyll build -d /tmp/songjian.github.io.git
cd /tmp/songjian.github.io.git
git add .
git commit -m Publish
git push
