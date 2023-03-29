# rails 学习

## 原则

* mimemagic因为错选了GPL协议，强制删除了0.3.6版，导致bundle install报错，临时解决改用：
  * https://ruby-china.org/topics/41077
  ```ruby
  gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'
  ```
