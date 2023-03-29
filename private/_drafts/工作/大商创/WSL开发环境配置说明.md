# Dscmall WSL 开发环境配置说明

## 0. 指引

1. 需要先获取wsl的tar文件
2. 按照说明导入到本机wsl中

## 1. 获取WSL开发环境tar文件

联系 `songjian@codeorder.cn` 获取。

## 2.1、导入wsl的tar文件

以管理员身份运行PowerShell，
在本地磁盘创建WSL的存储目录，安装在哪个磁盘分区都可
```
mkdir c:\wslDistroStorage
```
导入tar文件
```PowerShell
wsl --import Dsc C:\wslDistroStorage\Dsc C:\dsc.tar
```
## 2.2、启动nginx、mysql、php-fpm

wsl中执行
```sh
sudo nginx
sudo service mysql start
php-fpm
autossh shop-tunnel -Nf
```

## 2.3、配置windows中访问

1. 在wsl中执行`ip a`，获得wsl ip地址
2. 修改windows的hosts文件，路径：`C:\Windows\System32\drivers\etc\hosts`，注：管理员角色使用记事本修改

添加2条
```
172.25.135.232 dev.yunfanshuzi.com   # 礼才商城
172.25.135.232 hongteng.dev.yunfanshuzi.com  # 鸿腾商城
```

## 其他

默认操作用户
* uid: yy
* pwd: yy

代码目录
```
/home/yy/workspace_yy/shop_betterhr_cn
```

数据库连接

* 数据库：dscmall
* 用户：dscmall
* 密码：dscmall

## 创建数据库和用户

```sql
-- 创建用户
CREATE USER 'betterhr_dev'@'host' IDENTIFIED BY 'bTNWrxfdkNyGCatz';

-- 创建数据库
CREATE DATABASE betterhr_dev DEFAULT character set UTF8mb4 collate utf8mb4_bin;

-- 授权
grant all on betterhr_dev.* to 'betterhr_dev'@'localhost' identified by 'betterhr_dev';
```

```sh
# 导入 sql 文件
mysql -ubetterhr_dev -pbTNWrxfdkNyGCatz --database=betterhr_dev < /mnt/c/Users/001/Downloads/betterhr_dev_20220706_155038.sql
```