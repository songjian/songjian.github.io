---
layout: post
title: "实验项目：Go+Rails远程文件管理"
---
## 思路

Go语言编写客户端来监控客户机指定目录的文件变化，并通过Websocket把文件的实时变化信息提交到服务端。

Ruby on Rails开发后端管理，实时查看客户机上指定文件夹中的文件信息，可以远程对文件改名和删除等操作。

## 项目开源地址

GitHub仓库地址：[songjian/go-rails-file-hub](https://github.com/songjian/go-rails-file-hub)

## 架构

### 客户端和服务端通信

客户端和服务端通信选择Websocket协议。

Go用github.com/gorilla/websocket这个第三方库，Rails用Action Cable。

### 客户端

客户端用Go语言开发，主要用到的第三方库：

- github.com/fsnotify/fsnotify
- github.com/gorilla/websocket

fsnotify用来监控文件变化；websocket是Go的Websocket通信库。

有一点需要注意，fsnotify的文件事件，Windows和Linux系统下表现不一致。Linux rm命令删除文件，文件事件是fsnotify.Remove；Linux GUI删除文件到回收站，文件事件是fsnotify.Rename；Windows上删除文件到回收站的文件事件是fsnotify.Remove。

## 服务端

创建Rails应用

```bash
rails new hub
```

解除Gemfile中redis gem注释

```ruby
gem "redis", ">= 4.0.1"
```

添加下面gem

```ruby
# Active Admin
gem 'activeadmin'
gem 'devise'
gem 'sassc-rails'

# WebSocket通信
gem 'actioncable'
```

执行bundle，安装gem

```bash
bundle
```

初始化Active Admin

```bash
rails generate active_admin:install
```

config/routes.rb添加actioncable路由设置

```ruby
mount ActionCable.server => '/cable'
```

执行数据迁移和seed

```bash
rails db:migrate && rails db:seed
```

启动Rails服务

```bash
rails s
```

浏览器访问：http://localhost:3000/admin。Active Admin默认登录用户：admin@example.com，密码：password

创建Client和RemoteFile模型

```bash
# Client
rails generate model Client name:string api_key:string active:boolean description:text

# RemoteFile
rails generate model RemoteFile filename:string path:string file_type:string file_created_at:datetime file_size:integer last_modified:datetime client:references
```

执行数据迁移

```bash
rails db:migrate
```

创建Client和RemoteFile的Active Admin资源

```bash
rails generate active_admin:resource Client
rails generate active_admin:resource RemoteFile
```

创建交换文件信息的频道

```bash
rails g channel File
```

验证客户端身份

```ruby
# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_client


    def connect
      self.current_client = find_verified_client
    end

    private
      def find_verified_client
        bearer_token = request.headers['Authorization']
        if bearer_token.present? && bearer_token.start_with?('Bearer ')
          api_key = bearer_token.split(' ').last
          if verified_client = Client.find_by(api_key: api_key)
            verified_client
          else
            reject_unauthorized_connection
          end
        else
          reject_unauthorized_connection
        end
      end

  end
end
```

identified_by是一个宏，用于指定连接实例的标识符。

允许Action Cable接受来自任何源的请求，解除下面这行注释：

```ruby
# config/environments/development.rb
config.action_cable.disable_request_forgery_protection = true
```
