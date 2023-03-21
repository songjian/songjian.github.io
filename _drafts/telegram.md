---
layout: post
title: Telegram自动化注册程序开发总结
categories: Telegram
---
记录项目开始时间

2022年8月23日

问题分析

想实现自动化注册无非是找到注册的接口或者通过自动化方法操作客户端自动完成注册流程。先在[Telegram](https://telegram.org/)官网上查询官方文档。

遇到的问题

2022年10月26日
15:12
 
Telegram官网MTProto协议介绍的`Creating an Authorization Key`部分有提到用户注册时按键的间隔时间会作为生成`Authorization Key`的随机数。

解决方案

1. 使用tg官方接口注册
2. tportable(tg pc客户端) + PyAutoGUI(操作鼠标键盘的Python包)
3. Android客户端 + uiautomator2(Android应用自动化测试工具)

### 尝试过的方案

* PyAutoGUI + tportable （PC客户端）;
* uiautomator2 + Telegram Android App + telethon;

#### 方案: PyAutoGUI + tportable

可以操作Telegram的PC客户端，但是新版的PC客户端把注册功能去掉了，需要使用手机App扫码登录，所以这个方案没有成功。


1. tportable软件加上鼠标自动点击；
2. TDLib+Golang或者Python；
3. tg android版加android模拟器加鼠标自动点击；
4. telethon注册
5. android版注册成功后授权telethon登录；

 
第一种方案，tg desktop加鼠标自动点击我已经尝试，新版desktop去掉了注册功能；
 
最近在为Telegram自动注册用户项目研究解决方案。查了tg的官方资料和google一些相关文章。实现自动注册用户有下面几种方案
 
我尝试了使用windows版telegram desktop软件加上PyAutoGUI，发现新版desktop软件去掉了注册功能。注册新用户需要先在手机上使用手机号注册。
 
之后，选择使用模拟器运行Telegram Android App加上PyAutoGUI的方案。开发中也遇到了些问题：
一、无法调整模拟器窗口大小和位置；
二、无法得到鼠标和键盘操作App后的反馈。
 
之后，我又尝试使用Android的自动化测试工具方案。Android的自动化测试工具很多：Android SDK中有monkeyrunner、uiautomator等，开源的有：uiautomator2、Appium、Robotium
 
monkeyrunner 资料比较少，Android Sutdio官网的介绍没看明白。
 
 
问题分析
 
Telegram只能用手机接收验证码注册。
 
根据分析到的情况，我想到几个处理思路：
 
* 可以控制系统的鼠标和键盘操作Telegram的PC端软件进行注册；
* 使用Telegram官方提供的接口进行注册。
 
Telegram要求新用户需要通过手机App用短信验证码注册。也就是说注册流程需要先获取一个手机号，然后在Telegram的手机App填写注册信息，然后输入获取的短信验证码。然后授权其他设备登录。
 
有一个办法可以提前验证一个手机号码是否注册了Telegram账号，就是用一个Telegram用户添加这个手机号为联系人，能加上的话说明号码已经注册了，添加不上说明号码没有注册。但是，这个方法有一个问题，就是每个Telegram注册用户添加联系人是有上限的，超过上限之后Telegram不会提醒你已达上限，而是给你返回该号码不是Telegram用户，这样就没法准确检测一个号码是否已经注册Telegram账号。我还尝试了很多其他方法，都没法解突破这个限制。
 
并且写了两种联系人检测的方法，telethon调用接口和通过向Android真机导入联系人然后通过telegram的App来检测。
 
根据拥有的协议号的数量可以估算出可用于联系人检测的调用次数。
 
因为联系人检测有调用数量限制，所以手机号状态检测应优先于联系人检测。
 
从接码平台获取的号码写入数据库有一个优势，可以在检测号码之前先在以有的号码中查重。
 
号码状态检测结果类型：PASSED,FLOOD,BANND,已注册
 
注册的WEB管理网页端，数据需要实时展示，不需要刷新页面。

 
### 问题

拿到手机号然后注册这个流程是可以的。但是如果拿到的手机号质量不佳，已经被注册、被禁用、被尝试注册次数太多，这样的号码需要先过滤掉。

#### 检测手机号的思路

可以调用 `send_code_request` 接口，对 `banned`、`flood`和已注册的账号进行初步筛选。通过检测的手机号再调用 `import_contacts` 接口，进行二次检测。但是 `import_contacts` 接口调用有限制，而且需要一个用于检测的账号。