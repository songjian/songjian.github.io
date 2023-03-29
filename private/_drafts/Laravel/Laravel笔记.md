# Laravel 笔记

## 参考

* [Laravel 自动发现扩展包是怎样实现的](https://learnku.com/articles/31036)

## 要点

* Laravel 框架的所有配置文件都保存在 config 目录中
* Laravel 利用 Vance Lucas 的 PHP 库 DotEnv，管理环境配置，新安装的laravel会包含.env.example文件
* .env 文件中列出的所有变量将被加载到 PHP 的超级全局变量 `$_ENV` 中。你可以使用 `env` 函数检索这些变量的值。
* 确定当前的环境变量`$environment = App::environment();`
* 给`environment`方法传入参数，检查环境变量是否与给定值匹配
```php
if (App::environment(['local', 'staging'])) {
    // 当前的环境是 local 或 staging...
}
```
* 为了给你的应用程序提升速度，你应该使用 `php artisan config:cache` 将所有的配置文件缓存到单个文件中
* 开启维护模式
```sh
# 启用维护模式
php artisan down

# 带有信息和HTTP请求中Retry-After
php artisan down --message="Upgrading Database" --retry=60

# 允许特定的 IP 地址或网络访问应用程序
php artisan down --allow=127.0.0.1 --allow=192.168.0.0/16
```
* 关闭维护模式
```sh
php artisan up
```
* 应用程序处于维护模式时，不会处理 队列任务。而这些任务会在应用程序退出维护模式后再继续处理。
* 维护模式会导致应用程序有数秒的停机（不响应）时间，因此你可以考虑使用像 Envoyer 这样的替代方案，以便与 Laravel 完成零停机时间部署。
* 目录结构
  * app 目录包含应用程序核心代码
  * bootstrap 包含引导框架`app.php`文件，该目录还包含一个`cache`目录，`cache`目录下存放着框架生成的用来提升性能的文件
  * database 目录包含数据填充和迁移文件以及模型工厂类。你还可以把它作为 SQLite 数据库存放目录。
  * public 目录包含了入口文件 index.php
  * resources 包含视图和未编译的资源文件（LESS、SASS、JavaScript）和语言文件
  * routes 目录包含了应用的所有路由定义，Laravel 默认包含了几个路由文件：web.php、api.php、 console.php 和 channels.php，
  * storage 目录包含编译后的 Blade 模板、session 会话生成的文件、缓存文件以及框架生成的其他文件。这个目录被细分成 app 、 framework 和 logs 三个子目录
  * storage/app/public 可以用来存储用户生成的文件，比如需要公开访问的用户头像。你应该创建一个 public/storage 的软链接指向这个目录。你可以直接通过 php artisan storage:link 命令来创建此链接
  * tests 目录包含自动化测试文件
  * vendor 目录包含你所有的 Composer 依赖包
* app 目录的命名空间为 App，并通过 Composer 使用 PSR-4 自动加载标准 自动加载
  * Console 目录包含所有的 Artisan 命令，而 Http 目录包含你的控制器，中间件和请求
