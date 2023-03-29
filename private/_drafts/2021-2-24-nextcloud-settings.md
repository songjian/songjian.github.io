---
layout: post
title: Nextcloud
categories: [技术文章, nas]
---

nextcloud使用ubuntu的snap安装。

## Snap Nextcloud 的配置

#### 修改https端口

```sh
sudo snap set nextcloud ports.http=81 ports.https=444
```

#### 文件存储目录

* /var/snap/nextcloud/common/nextcloud/data

#### 配置文件路径

* /var/snap/nextcloud/current/nextcloud/config/config.php

## 参考

* [Snappy Nextcloud](https://github.com/nextcloud/nextcloud-snap)
* [备份](https://docs.nextcloud.com/server/20/admin_manual/maintenance/backup.html)
