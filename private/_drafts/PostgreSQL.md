# PostgreSQL

官网：[https://www.postgresql.org/](https://www.postgresql.org/)

## 常用操作

### 启动 PostgreSQL

```sh
systemctl start postgresql
```

### 登录 Postgres

```sh
su - postgres
psql
```

### 创建用户

```Postgres
# 创建用户 密码用单引号引起来
postgres=# CREATE USER dbuser WITH PASSWORD '*****';

# 创建用户数据库
postgres=# CREATE DATABASE exampledb OWNER dbuser;
```

### 修改用户密码

```postgres
alter user [user_name] with password '123';
```

### 问题

#### Peer authentication failed for user "postgres"

编辑 pg_hba.conf
