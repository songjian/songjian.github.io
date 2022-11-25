---
layout: post
title: Nginx基础身份认证
categories: Nginx
---
```
curl http://localhost:8090/ -I --user root:123456                                                                                                04:05:53
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
Date: Tue, 09 Nov 2021 20:06:06 GMT
Content-Type: text/html
Content-Length: 10918
Last-Modified: Fri, 16 Jul 2021 06:40:53 GMT
Connection: keep-alive
ETag: "60f129f5-2aa6"
Accept-Ranges: bytes

curl http://localhost:8090/ -I -H "Authorization: Basic cm9vdDoxMjM0NTY="                                                                        04:06:55
HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
Date: Tue, 09 Nov 2021 20:07:09 GMT
Content-Type: text/html
Content-Length: 10918
Last-Modified: Fri, 16 Jul 2021 06:40:53 GMT
Connection: keep-alive
ETag: "60f129f5-2aa6"
Accept-Ranges: bytes

curl http://localhost:8090/ -I                                                                                                                   04:07:09
HTTP/1.1 401 Unauthorized
Server: nginx/1.18.0 (Ubuntu)
Date: Tue, 09 Nov 2021 20:09:57 GMT
Content-Type: text/html
Content-Length: 188
Connection: keep-alive
WWW-Authenticate: Basic realm="Restricted"
```
