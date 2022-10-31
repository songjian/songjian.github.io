# My Blog
#### Docker运行

```sh
docker run --rm  -e TZ=Asia/Shanghai  --volume="$PWD:/srv/jekyll:Z"   --publish [::1]:4000:4000   jekyll/jekyll jekyll s -wD
```
