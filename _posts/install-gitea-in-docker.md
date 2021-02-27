# 使用docker安装gitea

## 拉取gitea镜像

```bash
docker pull gitea/gitea:latest
```

## 数据持久化

```bash
# 本地环境
mkdir ~/gitea_data

# 服务器环境
sudo mkdir -p /var/lib/gitea
```

## 运行gitea

```bash
docker run -d --name=gitea -p 10022:22 -p 10080:3000 -v ~/gitea_data:/data gitea/gitea:latest
```


