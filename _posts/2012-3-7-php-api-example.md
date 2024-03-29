---
layout: post
title:  PHP调用接口示例
date:   2012-03-07 11:25:07 +0800
categories: [php] 
tags: [php, api, example]
---

两个程序之间交换数据一般需要一个程序给另一个程序提供接口，以获取或者更新第一个程序中的数据。如何安全的开放数据的访问与更新？这就需要在开放的接口上做一些安全处理，如限制ip和访问次数、检查接口访问时间的有效范围和程序之间约定密钥对交换数据进行摘要和加密。

## 上栗子

有两台服务器a和b，a服务器中保存有会员记录，b服务器现在想要请求这些记录，处理如下：

### b 服务器请求数据代码

```php
$server_name = 'http://localhost/a.php';

$time = time(); //请求时间
$key = 'weqwesfxvcvxs'; //主机间约定的密钥
$index = 1; //请求记录的起始记录
$row = 10; //请求返回记录条数
//加密
$flag = md5($index . $row . $time . $key); //变量连接顺序由 a 和 b 服务器约定
echo file_get_contents($server_name . "?time={$time}&index={$index}&row={$row}&flag={$flag}");
```

### 处理主机 b 的接口访问请求

```php
//允许访问接口的ip地址
$ips = array('127.0.0.1');
//请求时间
$time = isset($_GET['time']) && intval($_GET['time']) ? intval($_GET['time']) : exit('-1'); // -1 代表程序终止，这里的消息代码需要与借口访问方约定
//请求记录的起始记录
$index = isset($_GET['index']) && trim($_GET['index']) ? trim($_GET['index']) : exit('-1');
//请求返回记录条数
$row = isset($_GET['row']) && trim($_GET['row']) ? trim($_GET['row']) : 10;
//得到flag
$flag = isset($_GET['flag']) && trim($_GET['flag']) ? trim($_GET['flag']) : exit('-1');
//发出请求ip
$ip = $_SERVER["REMOTE_ADDR"];
//exit($ip);
//主机间约定的密钥
$key = 'weqwesfxvcvxs';

//检查请求ip是否在允许访问接口的ip地址中，不允许终止程序
if (!in_array($ip, $ips)) {
    exit('-1');
}

//检查请求时间
if (($_SERVER['REQUEST_TIME'] - $time) > 60) {
    exit('-1'); // 请求超过 60 秒终止程序
}

//验证请求
if ($flag === md5($index . $row . $time . $key)) {
    $member_arr = array(1, 2, 3, 4, 5); //演示数据
    //返回json格式会员数据
    echo json_encode($member_arr);
} else {
    exit('-1');
}
```
