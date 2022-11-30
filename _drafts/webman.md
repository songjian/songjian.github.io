---
layout: post
title: webman
categories: PHP
---
### 加载文件

[自动加载-webman手册](https://www.workerman.net/doc/webman/others/autoload.html)

### created_at、updated_at返回时间戳

Model文件中加入
```php
protected $casts = [
    'created_at' => 'timestamp',
    'updated_at' => 'timestamp',
];
```

### created_at、updated_at存储时间戳

Model文件中加入
```php
protected $dateFormat = 'U';
```
数据库字段类型选择`int`或`bigint`
