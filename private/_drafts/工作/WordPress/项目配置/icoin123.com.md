# icoin123.com

## CHANGELOG

### 2022 年 6 月 6 日

#### icoin123.com

* PHP 版本 7.4.29
* 服务器 `8.218.143.243`
* 安装目录 `/wwwphp/icoin123.com/`

### 2022 年 6 月 10 日

* 开启 WordPress 多站支持
  * `wp-config.php` 文件添加：
    ```php
    define('WP_ALLOW_MULTISITE', true);
    define( 'MULTISITE', true );
    define( 'SUBDOMAIN_INSTALL', true );
    define( 'DOMAIN_CURRENT_SITE', 'biquan.cc' );
    define( 'PATH_CURRENT_SITE', '/' );
    define( 'SITE_ID_CURRENT_SITE', 1 );
    define( 'BLOG_ID_CURRENT_SITE', 1 );
    ```

### 2022 年 6 月 27 日

* 主域名更换为 `biquan.cc` ；
* 取消强制跳转 `https`；

#### 修改多站点的域名：

修改数据库：

```SQL
-- 修改 wp_site
update wp_site set domain='biquan.cc';
-- 修改 wp_blogs
update wp_blogs set domain = 'biquan.cc';
-- 修改 wp_sitemeta
update wp_sitemeta set meta_value = 'https://biquan.cc' where meta_key = 'siteurl';
-- 修改 wp_options
update wp_options set option_value = 'https://biquan.cc' where option_name in ('siteurl','home');
```

修改 `wp-config.php` 文件：

```php
define( 'DOMAIN_CURRENT_SITE', 'biquan.cc' );
```

#### JustNews 更新文章内图片连接

```SQL
update wp_posts set post_content = REPLACE(post_content, 'icoin123.com', 'biquan.cc');
```

#### OneNav 主题修改网址图标地址

```SQL
update wp_2_posts set guid = REPLACE(guid, 'icoin123.com', 'biquan.cc');
update wp_2_postmeta set meta_value = REPLACE(meta_value, 'icoin123.com', 'biquan.cc');
```

### 2022 年 6 月 29 日

* members 页面（优秀作者）增加根据文章发布数排序和过滤只展示有发文章的用户。
  * `wpcom-member type="userlist"` 短代码增加 `published` 字段，设为真值，只展示发文章的用户；
  ```SHORTCODE
  [wpcom-member type="userlist" per_page="12" cols="3" orderby="post_count" published="1"]
  ```
  * `wp-content/themes/justnews/themer/member/init.php` 1989 行附近增加：
  ```PHP
  $published = isset($atts['published']) && $atts['published'] ? true : false;

  $args = array('number' => $number, 'offset' => $offset, 'paged' => $paged, 'orderby' => $orderby, 'order' => $order, 'has_published_posts' => $published);
  ```

* 参考：[WP_User_Query 文档](https://developer.wordpress.org/reference/classes/wp_user_query/#has-published-posts-parameter)

### 2022 年 7 月 4 日

* 使用 Nginx + GeoIP 禁止国内IP访问网站。

### 2022年7月7日

* 隐藏【生成海报】按钮
  * `./wp-content/themes/justnews/single-kuaixun.php` 36行 和 `./wp-content/themes/justnews/single.php` 142行

### 2022年7月8日

* 快讯改为从非小号网站爬取
  * [https://github.com/songjian/crawler-fxh](https://github.com/songjian/crawler-fxh)
  * crontab
  ```crontab
  */5 *    * * *   www    . /wwwpython/crawler-fxh/venv/bin/activate && python /wwwpython/crawler-fxh/crawler-fxh-kuaixun.py
  ```