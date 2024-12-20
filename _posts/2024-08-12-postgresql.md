---
layout: page
title: "Docker运行PostgreSQL容器设置最大连接数无效的问题"
date: 2024-08-12 00:00:00 -0000
categories: Docker
tags: Docker PostgreSQL
---
部署项目的时候图省事，直接用GitHub Copilot生成了一份PostgreSQL的docker-compose文件，docker-compose中设置最大连接数使用环境变量POSTGRES_MAX_CONNECTIONS，最近程序总是报PostgreSQL连接数不足的错误，设置POSTGRES_MAX_CONNECTIONS=200，依然报错。

连接容器检查问题

查看总的连接数：

```sql
select count(*) from pg_stat_activity;

select * from pg_stat_activity;
```

结果是100，而不是200，查看PostgreSQL最大连接数：

```bash
docker compose exec db psql -Upostgres
postgres=# show max_connections;
 max_connections 
-----------------
 100
(1 row)
```

最大连接数是100，而不是设置的200，查看PostgreSQL的官方镜像页，发现没有POSTGRES_MAX_CONNECTIONS这个环境变量，原来是AI幻觉产生的问题。

解决方案：

```sql
ALTER SYSTEM SET max_connections = '200';
SELECT pg_reload_conf();
```

重启数据库，再查看最大连接数

```sql
postgres=# show max_connections;
 max_connections 
-----------------
 200
(1 row)
```
