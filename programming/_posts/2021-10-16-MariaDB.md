---
layout: post
title: MariaDB
categories: DB
---
### 安装

```sh
sudo apt install mariadb-server
```

### 常用命令

```sql
-- 创建用户
CREATE USER 'username'@'host' IDENTIFIED BY 'password';

-- 创建数据库
CREATE DATABASE db_name DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE db_name DEFAULT character set UTF8mb4 collate utf8mb4_bin;

-- 授权
grant all on dscmall.* to 'dscmall'@'localhost' identified by 'dscmall';

-- 修改密码
set password for betterhr_dev@'localhost'=password('bTNWrxfdkNyGCatz');
```

#### 导入 sql 文件

```sh
mysql -ubetterhr_dev -pbTNWrxfdkNyGCatz --database=betterhr_dev < /mnt/c/Users/001/Downloads/betterhr_dev_20220706_155038.sql
```
