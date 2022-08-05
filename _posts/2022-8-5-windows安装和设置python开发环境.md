---
layout: post
title: Windows安装和设置Python开发环境.md
categories: python
---

## 安装Python

```PowerShell
winget install -e --id Python.Python.3
```

## Python虚拟环境

Python 3 内置了用于创建虚拟环境的 venv 模块。

### 创建虚拟环境

```PowerShell
mkdir myproject
cd myproject
python -m venv venv
```

### 激活虚拟环境

```PowerShell
venv\Scripts\activate
```

### 退出虚拟环境

```PowerShell
deactivate
```

## requirements文件生成与使用

### 创建requirements.txt

```PowerShell
pip freeze > requirements.txt
```

### 新环境中安装环境

```PowerShell
pip install -r requirements.txt
```
