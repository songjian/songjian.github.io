## 安装python3和pip
`sudo apt install python3 python3-pip`
` `
## Pip3更换国内源
pip3 install -i [https://mirrors.ustc.edu.cn/pypi/web/simple](https://mirrors.ustc.edu.cn/pypi/web/simple) pip -U
pip3 config set **global**.index-url [https://mirrors.ustc.edu.cn/pypi/web/simple](https://mirrors.ustc.edu.cn/pypi/web/simple)
 
来自 <[http://mirrors.ustc.edu.cn/help/pypi.html](http://mirrors.ustc.edu.cn/help/pypi.html)> 
 
## 更新Pip3
`pip3 install --upgrade pip `
## 使用Pip3安装软件包的方法
`pip3 install [软件包名]`
#### _例如：_`
`
`pip3 install jupyter`
##### 设置Shebang从环境变量中指定python3解释器
```bash
#!/usr/bin/env python3
```

