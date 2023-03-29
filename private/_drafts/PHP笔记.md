# PHP笔记

* PHP7新增`$c = $a ?? $b`语法，`??`前变量非空返回返回`??`前变量，`??`前变量为空返回`??`后变量
* 函数 `nl2br()` 在字符串中的新行（\n）之前插入换行符：
```PHP
echo nl2br("One line.\nAnother line.");
```