---
layout: post
---

![](/assets/img/gitbook.png)

## 坑
* 安装gitbook需要nodejs的版本是10.21.0

## 设置nodejs环境

```bash
nvm install 10.21.0
nvm use 10.21.0
```

## 通过npm安装gitbook
```bash
npm install gitbook-cli -g
gitbook -V
```

## 创建一本书
### 初始化
```bash
gitbook init ./newbook
```

### 构建
```bash
gitbook build 
```

### Debugging
```bash
gitbook build ./ --log=debug --debug
```

### 启动服务
```bash
gitbook serve
```

## 参考
* [使用 Gitbook 打造你的电子书](https://zhuanlan.zhihu.com/p/34946169)
