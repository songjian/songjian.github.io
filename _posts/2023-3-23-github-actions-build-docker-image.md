---
layout: post
title: 使用Github Actions构建\缓存layer\发布\部署Docker镜像
tags: ["Github Actions", "docker", "Actions Cache"]
categories: Linux github docker
---
```yml
name: Docker Image CI

on:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Cache Docker layers
        uses: actions/cache@v3
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-buildx-
          
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and push
        uses: docker/build-push-action@v4
        with:
          push: true
          file: Dockerfile
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/IMAGENAME:latest
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache-new

      - name: Move cache
        run: |
          rm -rf /tmp/.buildx-cache
          mv /tmp/.buildx-cache-new /tmp/.buildx-cache
      - name: SSH deploy
        uses: appleboy/ssh-action@v0.1.7
        with:
          host: ${{ secrets.AWS_HOST }}
          username: ${{ secrets.AWS_HOST_USERNAME }}
          key: ${{ secrets.AWS_HOST_KEY }}
          port: ${{ secrets.AWS_HOST_PORT }}
          script: |
            docker system prune --all -f
            cd /var/www/rails_app/
            docker compose -f docker-compose.yml -f docker-compose.prod.yml pull
            docker compose -f docker-compose.yml -f docker-compose.prod.yml run app rake db:migrate
            docker compose -f docker-compose.yml -f docker-compose.prod.yml down
            docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

## 参考

> https://evilmartians.com/chronicles/build-images-on-github-actions-with-docker-layer-caching
