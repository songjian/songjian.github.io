---
layout: post
title: Linux备份数据的方法
tags: 系统备份 工具
categories: Linux
date: Mon Apr 3 11:01:45 2023 +0800
---

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

## 参考

> [Linux数据备份与恢复](https://www.cnblogs.com/lizhouwei/p/10145783.html)
> 
> [Linux数据备份与恢复 dump、restore、dd命令](https://www.cnblogs.com/lizhouwei/p/10146092.html)
