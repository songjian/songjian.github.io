---
layout: post
title: python虚拟环境和requirements文件生成与使用
categories: python
---

## Python虚拟环境

Python 3 内置了用于创建虚拟环境的 venv 模块。

### 创建虚拟环境

```bash
mkdir myproject
cd myproject
python3 -m venv venv
```

### 激活虚拟环境

```bash
. venv/bin/activate
```

### 退出虚拟环境

```bash
deactivate
```

## requirements文件生成与使用

### 创建requirements.txt

```bash
pip freeze > requirements.txt
```

### 新环境中安装环境

```bash
pip install -r requirements.txt
```
