# Gogs

## 知识

* [Share port 22 between Gogs inside Docker & the local system](http://www.ateijelo.com/blog/2016/07/09/share-port-22-between-docker-gogs-ssh-and-local-system)
* [Drone配合Gogs实现持续集成](https://blog.csdn.net/Wisimer/article/details/116203786)

## 其他

在容器 `/app/gogs/docker/start.sh` 文件中有 `setids()` 方法，用于运行容器的时候指定git用户的uid和pid
```sh
setids() {
    export USER=git
    PUID=${PUID:-1000}
    PGID=${PGID:-1000}
    groupmod -o -g "$PGID" $USER
    usermod -o -u "$PUID" $USER
}
```