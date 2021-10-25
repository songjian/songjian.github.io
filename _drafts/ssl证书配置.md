# ssl证书配置

## certbot

### 自动

1. 安装certbot环境

```bash
# Debian,Ubuntu
sudo apt update
sudo apt install python3 python3-venv libaugeas0

# Fedora,CentOS
sudo dnf install python3 augeas-libs
```

4. 设置Python虚拟环境

```bash
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
```

5. 安装certbot

```bash
sudo /opt/certbot/bin/pip install certbot certbot-nginx
```

6. 准备

```bash
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
```

7. 配置

```bash
sudo certbot --nginx
```

8. 设置自动更新

```bash
echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
```

9. 测试

```bash
certbot renew --dry-run
```

### 手动

```bash
certbot certonly --manual
```

参考：

* https://certbot.eff.org/lets-encrypt/pip-nginx
