# Python

## 参考

* [怎样将Python项目发布到PyPI](https://zhuanlan.zhihu.com/p/37987613)

## 常用工具的文档

* [matplotlib](https://matplotlib.org/stable/index.html)
* [pandas](https://pandas.pydata.org/docs/)
* [ipython](https://ipython.org/documentation.html)

## 安装python3和pip
```sh
sudo apt install python3 python3-pip
```

## Pip3更换国内源

```sh
pip3 install -i [https://mirrors.ustc.edu.cn/pypi/web/simple](https://mirrors.ustc.edu.cn/pypi/web/simple) pip -U
pip3 config set **global**.index-url [https://mirrors.ustc.edu.cn/pypi/web/simple](https://mirrors.ustc.edu.cn/pypi/web/simple)
```
 
## 更新Pip3

`pip3 install --upgrade pip `

## 使用Pip3安装软件包的方法

`pip3 install [软件包名]`

`pip3 install jupyter`

##### 设置Shebang从环境变量中指定python3解释器

```bash
#!/usr/bin/env python3
```

## 断言assert

* Python assert（断言）用于判断一个表达式，在表达式条件为 false 的时候触发异常。
* 断言可以在条件不满足程序运行的情况下直接返回错误，而不必等待程序运行后出现崩溃的情况。

[Python3 assert（断言）](                                                      https://www.runoob.com/python3/python3-assert.html)

## 异常Exception

* 异常即是一个事件，该事件会在程序执行过程中发生，影响了程序的正常执行。
* 一般情况下，在Python无法正常处理程序时就会发生一个异常。
* 异常是Python对象，表示一个错误。
* 当Python脚本发生异常时我们需要捕获处理它，否则程序会终止执行。

[Python 异常处理](https://www.runoob.com/python/python-exceptions.html)
[8. 错误和异常](https://docs.python.org/zh-cn/3/tutorial/errors.html)

## 类Class

[类](https://docs.python.org/zh-cn/3/tutorial/classes.html)
