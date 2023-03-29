# AWS 云主机

* AWS 云主机默认不允许密码登录
```sh
cat /etc/ssh/sshd_config | grep PasswordAuthentication
PasswordAuthentication no
```