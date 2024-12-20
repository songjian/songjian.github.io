---
layout: post
title: "Rails引擎使用RSpec测试"
date: 2024-07-13
categories: [Ruby]
tags: [Rails, RSpec]
---

Rails引擎默认使用MiniTest做测试。会在test目录下创建一个测试用的最小运行环境dummy。如果使用Rspec测试，dummy路径一般放在spec/dummy。

创建一个不使用测试，dummy路径指定为spec/dummy的引擎

```bash
rails plugin new engines/my_engine --mountable --skip-test --dummy_path=spec/dummy
```

gemspec中添加rspec-rails

```ruby
spec.add_development_dependency "rspec-rails"
```

引擎目录下安装gem

```bash
bundle install
```

安装rspec

```bash
rails g rspec:install
```

修改engines/my_engine/spec/rails_helper.rb

```ruby
# require File.expand_path('../../config/environment', __FILE__)
require File.expand_path('dummy/config/environment', __FILE__)
```

测试rspec运行

```bash
rspec spec/
```

配置使用rspec作为测试框架，更新 `/engines/my_engine/lib/my_feature/engine.rb`

```ruby
module MyEngine
  class Engine < ::Rails::Engine
    isolate_namespace MyFeature

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
```

设置migrate查找路径

把rails引擎的db/migrate和dummy/db/migrate添加进migrations_paths

```ruby
begin
  ActiveRecord::Migrator.migrations_paths = [File.expand_path('dummy/db/migrate', __dir__)]
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
```

添加Factory Bot

gemspec中添加 factory_bot_rails

```ruby
spec.add_development_dependency "factory_bot_rails"
```

修改 `engine.rb` 文件

```ruby
config.generators do |g|
  g.test_framework :rspec
  g.fixture_replacement :factory_bot
  g.factory_bot dir: 'spec/factories'
end
```

修改 `engines/my_engine/spec/rails_helper.rb`

```ruby
require 'factory_bot_rails'

FactoryBot.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryBot.factories.clear
FactoryBot.find_definitions
RSpec.configure do |config|
  ...
  config.include FactoryBot::Syntax::Methods
  ...
```

rails g生成的factory命名空间不对，需要自己改一下

```ruby
factory :car, class: MyEngine::Car
```

把主应用中的migration文件复制到dummy/db/migrate下

```bash
cp main_app/db/migrate/* ../engines/my_engine/spec/dummy/db/migrate/
```

执行数据库迁移

```bash
rails db:migrate
```

参考

- [https://www.hocnest.com/blog/testing-an-engine-with-rspec](https://www.hocnest.com/blog/testing-an-engine-with-rspec)