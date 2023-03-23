---
layout: post
title: 从头到尾，手把手教你配置一台新Linux服务器和在上面部署WordPress
tags: php wordpress
categories: wordpress
---
服务器配置记录：8.218.143.243

### 操作系统信息

```sh
lsb_release -a
LSB Version:    core-11.1.0ubuntu2-noarch:security-11.1.0ubuntu2-noarch
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.1 LTS
Release:        20.04
Codename:       focal
```

### 创建 www 用户

```sh
useradd -m -s /bin/bash www

# 加入 sudo 组
usermod -a -G sudo www
```

### 安装 ruby 环境

国外
```sh
./scripts/Debian_Ubuntu/install_rvm.sh
```

国内

```sh
./scripts/Debian_Ubuntu/install_rvm-cn.sh
```

### 安装 PostgreSQL

```sh
./scripts/Debian_Ubuntu/install_postgresql.sh
```

#### 设置 PostgreSQL 密码

```sh
su postgres -c psql
```

```sql
ALTER USER postgres WITH PASSWORD 'root';
```

## 创建 ruby 工作目录

```sh
mkdir /wwwruby
chown -R www:www /wwwruby/
```

## PHP

### 安装PHPENV和PHP

```sh
cd gnu-linux-scripts/
./scripts/Debian_Ubuntu/install_phpenv_php-build.sh
```

#### 安装依赖

```sh
apt install -y libxml2-dev libbz2-dev libcurl4-openssl-dev libpng-dev libjpeg-dev libonig-dev libtidy-dev libxslt-dev libzip-dev imagemagick redis-server libpq-dev pkg-config libsqlite3-dev libedit-dev libreadline-dev openssl libssl-dev gnupg2 nginx nodejs npm

apt install libxml2-dev libbz2-dev libpcre3-dev libssl-dev zlib1g-dev libmcrypt-dev libmhash-dev libmhash2 libcurl4-openssl-dev libpq-dev libpq5 libncurses5-dev  libglib2.0-dev lsb-release ca-certificates apt-transport-https libpng-dev libjpeg-dev libxml2 libxml2-dev openssl bison autoconf sqlite bzip2 libicu-dev libxslt1-dev libzip-dev libtidy-dev libtool
```

#### 安装常用 PHP 版本

```sh
phpenv install -s 7.4.29
phpenv install -s 8.1.6
phpenv global 8.1.6

# OpenSSL 报错可以试一下这条语句、
phpenv install -s 7.4.29 --with-openssl=/usr/local/opt/openssl@1.0/lib64
```

问题：

7.4.29 需要 OpenSSL1.1，Ubuntu2204 自带 OpenSSL3.0，无法编译成功。

#### 修改 PHP 上传文件大小

修改 `php.ini`
```INI
upload_max_filesize = 50M
post_max_size = 50M
```

#### 创建PHP工作目录

```sh
mkdir /wwwphp
chown -R www:www /wwwphp/
```

#### 运行 PHP-FPM

找到PHP-FPM配置文件

```sh
find / -name php-fpm.conf  
```

启动PHP-FPM

```sh
php-fpm
```

### 安装数据库MySQL

```sh
sudo apt install mysql-server
```

创建管理用户

```sh
mysql
```

```SQL
create user 'admin'@'localhost' identified by '6ubUY,fccowch';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
create database mydomain;
```

### 安装WordPress站点

下载 WordPress 程序

```sh
wget https://cn.wordpress.org/latest-zh_CN.tar.gz
tar -xzvf latest-zh_CN.tar.gz
```

新建 WordPress 站点

```sh
su - www
cd /wwwphp
tar -xzvf latest-zh_CN.tar.gz
mv wordpress [PROJECT_NAME]
cd [PROJECT_NAME]
phpenv local 7.4.29
```

#### 新建 Nginx 配置文件

`root` 身份执行

```sh
cd /etc/nginx/site-available/
cp mydomain.com teleworld.app
```

```nginx
server {
        listen 80;
        listen [::]:80;

        server_name [域名];

        root /wwwphp/[目录];
        index index.php index.html;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;

                # With php-fpm (or other unix sockets):
                # fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
                # With php-cgi (or other tcp sockets):
                fastcgi_pass 127.0.0.1:9000;
        }

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #       deny all;
        #}

}
```

`root` 身份执行

```sh
ln -s /etc/nginx/sites-available/teleworld.app /etc/nginx/sites-enabled/
nginx -t && nginx -s reload
```

### 备份

tar完整备份服务器重要目录

```sh
tar -czvf /backup/backup.tar.gz /root/ /home/ /var/spool/mail/ /etc/
```
tar 完整备份整个服务器（排除不需要备份的目录）

```sh
tar -czvf /backup/full-backup.tar.gz --exclude=/backup \
--exclude=/proc --exclude=/lost+found \
--exclude=/sys --exclude=/mnt --exclude=/media --exclude=/dev \
--exclude=/tmp --exclude=/swapfile /
```

tar 增量备份整个服务器

#### 完整

```sh
tar -g /backup/snapshot.snar -czvf /backup/backup_`date +%Y%m%d`_full.tar.gz --exclude=/backup \
--exclude=/proc --exclude=/lost+found \
--exclude=/sys --exclude=/mnt --exclude=/media --exclude=/dev \
--exclude=/tmp --exclude=/swapfile --exclude=/swap.img /
```

#### 增量

```sh
tar -g /backup/snapshot.snar -czvf /backup/backup_`date +%Y%m%d`_incr.tar.gz --exclude=/backup \
--exclude=/proc --exclude=/lost+found \
--exclude=/sys --exclude=/mnt --exclude=/media --exclude=/dev \
--exclude=/tmp --exclude=/swapfile --exclude=/swap.img /
```

#### crontab 设置

```crontab
* 1 * * * root tar -g /backup/snapshot.snar -czvf /backup/backup_`date +\%Y\%m\%d`_incr.tar.gz --exclude=/backup --exclude=/proc --exclude=/lost+found --exclude=/sys --exclude=/mnt --exclude=/media --exclude=/dev --exclude=/tmp --exclude=/swapfile /
```

### rsync 同步备份目录

```sh
rsync -av a:/backup/ /mnt/c/backups/8.218.143.243/
```

## 其他

### 设置 PHP 文件上传大小

添加 /etc/nginx/nginx.conf 的 `http` or `server` or `location` 中
```nginx
client_max_body_size 100g;
```

修改 php.ini ，添加：

```ini
post_max_size = 50M
upload_max_filesize = 50M
```

## CHANGELOG

### 2022年7月7日

* 配置 Python 运行环境
* 安装 Jupyter
* [http://jupyter.mydomain.com/](http://jupyter.mydomain.com/)

```sh
# root 用户
apt install -y python3 python3-pip

# www 用户
pip3 install jupyter

# 设置密码
jupyter notebook password # 密码：E1vch%PpLX%iohND

# 后台运行 Jupyter
nohup /wwwpython/jupyter-liuapi/venv/bin/jupyter notebook --ip=0.0.0.0 --notebook-dir=/wwwpython/jupyter-liuapi > jupyter.log 2>&1 &
```

Nginx Conf
```Nginx
upstream jupyter {
        server 127.0.0.1:8888;
}
server {
        listen 80;
        listen [::]:80;

        server_name jupyter.mydomain.com;

        location / {
                proxy_pass http://jupyter;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-Proto https;
                proxy_redirect off;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
        }
}
```
