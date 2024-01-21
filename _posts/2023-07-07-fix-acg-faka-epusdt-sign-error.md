---
layout: post
title: 修复acg-faka用epusdt收款验签失败的错误
date: 2023-07-07 09:29:15 +0800
categories: [PHP]
tags: [PHP, acg-faka]
---
## 问题描述

acg-faka用epusdt收款会验签失败，有人已经给官方提交[issue](https://github.com/lizhipay/acg-faka/issues/22)，官方暂时没有回应，我自己修复了一下，修复后可以正常收款了。并且我已经给官方提交了[PR](https://github.com/lizhipay/acg-faka/pull/63)。

<!-- more -->

## 修复方法

修改文件`app/Controller/User/Api/Order.php`和`app/Controller/User/Api/RechargeNotification.php`，在`public function callback(): string`方法中，添加以下代码：

```php
if (empty($data) && isset($_SERVER['CONTENT_TYPE']) && $_SERVER['CONTENT_TYPE'] == 'application/json') {
  $json_string = file_get_contents('php://input');
  $data = json_decode($json_string, true);
}
```

修改后`callback`方法完整代码如下：

```php
public function callback(): string
{
  $handle = $_GET['_PARAMETER'][0];
  $data = $_POST;
  if (empty($data)) {
      $data = $_REQUEST;
      unset($data['s']);
  }
  if (empty($data) && isset($_SERVER['CONTENT_TYPE']) && $_SERVER['CONTENT_TYPE'] == 'application/json') {
      $json_string = file_get_contents('php://input');
      $data = json_decode($json_string, true);
  }
  return $this->order->callback($handle, $data);
}
```

还需要修改acg-faka的epusdt插件：

路径：app/Pay/Epusdt/Impl/Signature.php

```php
public static function generateSignature(array $data, string $key): string
{
  ksort($data);
  reset($data);
  $sign = '';
  foreach ($data as $k => $v) {
      if ($v == '') continue;
      $sign .= $k . '=' . $v . '&';
  }
  $sign = trim($sign, '&');
  return md5($sign . $key);
}
```

我的修改已经提交到[github](https://github.com/songjian/acg-faka/commit/a57f6c02deca0c4b108bec70d8044ec4b19ab351)，可以直接下载使用。
