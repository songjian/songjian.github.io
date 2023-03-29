# 记 Laravel 的 Package 包开发

## 参考

* [新手掌握 Laravel 扩展包开发
](https://learnku.com/articles/21831)
* [Laravel 搭建 Composer 包，实现配置 Config、门面 Facade、服务 Service、发布到 Packagist](https://learnku.com/articles/29669)

## Package 包开发

### 要点

* `migrate` 文件放在和 `src` 同级的 `database/migrations`；生成的 `migrate` 文件删除时间戳保存为 `.stub` 文件。