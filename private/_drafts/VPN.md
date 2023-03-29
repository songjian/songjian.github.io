# VPN

## 知识

* [代理自动配置文件（PAC）文件](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file)

## 服务

* [极光](https://arr003.network/download/)
* [Pigcha](http://www.pigcha.com/)

## 分析极光 VPN

```powershell
netstat -ano | findstr "19180"
  TCP    127.0.0.1:19180        0.0.0.0:0              LISTENING       20312
  TCP    127.0.0.1:19180        127.0.0.1:51087        FIN_WAIT_2      20312
  TCP    127.0.0.1:19180        127.0.0.1:51136        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:51261        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64442        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64458        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64460        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64464        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64470        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64494        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64498        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64499        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64503        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64626        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64718        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64720        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64721        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64727        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64729        TIME_WAIT       0
  TCP    127.0.0.1:19180        127.0.0.1:64738        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64742        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64744        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64746        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64749        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64755        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64757        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64761        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64769        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64771        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64773        FIN_WAIT_2      20312
  TCP    127.0.0.1:19180        127.0.0.1:64774        FIN_WAIT_2      20312
  TCP    127.0.0.1:19180        127.0.0.1:64777        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64778        FIN_WAIT_2      20312
  TCP    127.0.0.1:19180        127.0.0.1:64781        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64783        ESTABLISHED     20312
  TCP    127.0.0.1:19180        127.0.0.1:64789        TIME_WAIT       0
  TCP    127.0.0.1:51087        127.0.0.1:19180        CLOSE_WAIT      23556
  TCP    127.0.0.1:51136        127.0.0.1:19180        ESTABLISHED     11164
  TCP    127.0.0.1:64442        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64470        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64472        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64475        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64476        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64496        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64502        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64506        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64508        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64526        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64626        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64718        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64721        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64724        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64727        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64738        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64742        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64744        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64746        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64749        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64755        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64757        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64761        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64769        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64771        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64773        127.0.0.1:19180        CLOSE_WAIT      16048
  TCP    127.0.0.1:64774        127.0.0.1:19180        CLOSE_WAIT      16048
  TCP    127.0.0.1:64777        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64778        127.0.0.1:19180        CLOSE_WAIT      16048
  TCP    127.0.0.1:64781        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64783        127.0.0.1:19180        ESTABLISHED     16048
  TCP    127.0.0.1:64806        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64812        127.0.0.1:19180        TIME_WAIT       0
  TCP    127.0.0.1:64818        127.0.0.1:19180        TIME_WAIT       0
```

```powershell
tasklist | findstr "20312"
aurora.exe                   20312 Console                    2     55,896 K
```