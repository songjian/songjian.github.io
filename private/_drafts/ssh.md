# ssh

* 关闭密码登录
    具体方法就是打开服务器 sshd 的配置文件`/etc/ssh/sshd_config`，将`PasswordAuthentication`这一项设为`no`
    ```bash
    PasswordAuthentication no
    ```
* 如果sshd没有启动可以使用下面的命令启动
```bash
sshd
```
