---
layout: post
title: 网络安全、加密、数字签名、SSH、SSL
categories: 网络
---
## 参考

### 入门

* [数字签名是什么？](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
* [图解SSL/TLS协议](http://www.ruanyifeng.com/blog/2014/09/illustration-ssl.html)
* [SSL/TLS协议运行机制的概述](https://www.ruanyifeng.com/blog/2014/02/ssl_tls.html)
* [密码学笔记](http://www.ruanyifeng.com/blog/2006/12/notes_on_cryptography.html)
* [RSA算法原理（一）](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)
* [RSA算法原理（二）](http://www.ruanyifeng.com/blog/2013/07/rsa_algorithm_part_two.html)

### 进阶

* [SSH、SSL与HTTPS](https://www.jianshu.com/p/5e3f9dfd2cb4)
* [openssl制作免费SSL证书](https://www.jianshu.com/p/1448fb8ff0ad)
* [自己制作SSL证书的方法](https://zhuanlan.zhihu.com/p/371804469)
* [rfc5246](https://datatracker.ietf.org/doc/html/rfc5246)

## 涉及概念

* 非对称加密
* 对称加密
* 数字证书
* SSH
* SSL

## 加密算法

### 要点

* 加密/解密分为：
  * 对称加密
  * 非对称加密
* AES、DES、3DES 都是对称的块加密算法。
* 1976年以前，所有的加密都采用对称加密，既A使用某种加密规则对信息加密，B收到信息后逆向加密规则解密数据。
* 目前，通用的单钥加密算法为DES（Data Encryption Standard），通用的双钥加密算法为RSA（ Rivest-Shamir-Adleman），都产生于上个世纪70年代。
* 在双钥体系中，公钥用来加密信息，私钥用来数字签名。

## SSL/TLS协议

### 要点

* （1） 所有信息都是加密传播，第三方无法窃听。
* （2） 具有校验机制，一旦被篡改，通信双方会立刻发现。
* （3） 配备身份证书，防止身份被冒充。
* 握手阶段使用非对称加密，使用握手过程的3个随机数生成对称加密的“会话密钥”，之后的会话过程只只用“会话密钥”

## x509证书链

* x509证书一般会用到三类文件，key, csr, crt。
* key 私用密钥，openssl格式，通常是rsa算法。
* csr 是证书请求文件，用于申请证书。制作csr文件的时候，必须使用自己的私钥来签署申请，还可以设定一个密钥。
* crt 是CA认证后的证书文件（windows下面的csr，其实是crt），签署人用自己的key给你签署的凭证。

## OpenSSL 中有如下后缀名的文件

* `.key` 私有的密钥。
* `.csr` 证书签名请求（证书请求文件），含有公钥信息，certificate signing request 的缩写。
* `.crt` 证书文件，certificate 的缩写。
* `.crl` 证书吊销列表，Certificate Revocation List 的缩写。
* `.pem` 用于导出，导入证书时候的证书的格式，有证书开头，结尾的格式。
