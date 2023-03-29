# mooc配置记录

慕课网、亿木课堂

Github 仓库：https://github.com/songjian/mooc

ruby 版本：2.6

设置 2.6 为 Ruby 默认版本

```sh
rvm 2.6 --default
```

```sh
mkdir -p /wwwruby/
git clone git@github.com:songjian/mooc.git
cd /wwwruby/mooc
gem install bundler:1.16.1
bundle install
```

修改配置

```sh
cp config/database.yml.example config/database.yml
```

创建数据库

```sh
rake db:create
```

执行 Migrate 和 Seed

```sh
rake db:migrate && rake db:seed
```

生产环境

```sh
rails s --environment production
```

## 启动 Puma

```sh
puma -dC config/puma.rb
```

重启 Puma

```sh
touch tmp/restart.txt
```

## 问题记录

图片验证码不显示：安装 ImageMagick

```sh
apt install -y imagemagick redis-server
```

## 账号

<pre>
http://mooc.icoin123.com/

管理后台：http://mooc.icoin123.com/admin/login
用户：admin
密码：admin!

财务后台：http://mooc.icoin123.com/finance/login
用户：finance
密码：111111
</pre>