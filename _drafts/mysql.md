---
layout: post
title: MySQL
categories: MySQL
---
#### 查看数据库连接

```sql
show processlist;
```

#### 查看最大连接数

```sql
show variables like '%max_connections%';
```

#### 修改最大连接数

```sql
set GLOBAL max_connections = 200;
```

或者修改 `/etc/my.cnf`，`[mysqld]` 中添加：

```cnf
max_connections=1000
```
