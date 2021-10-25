---
layout: post
title:  "《Ruby基础教程v4》 学习笔记"
categories: 笔记本 ruby
---

## 第5章 条件判断

### ruby的三种主要条件判断语句
* if
* unless
* case

### Ruby真假值
|真|假|
|--|--|
|真|false、nil以外的所有对象|
|假|false、nil|

#### if语句

```ruby
if 条件 then 
end
```

then 可以省略

#### unless语句

条件为假时执行

```ruby
unless 条件 then
end
```
then 可以省略

#### case语句

```ruby
case 比较对象
when 值1 then
  处理1
when 值2 then
  处理2
when 值3 then
  处理3
else
  处理4
end
```

then 可以省略

### === 与 case
在case语句中，when判断值是否相等时，实际是使用===运算符来判断。左边是数值或字符串时，===与==意义一样，除此之外，===还可以与=~一样用来判断正则表达式是否匹配，或者判断右边的对象是否属于左边的类，等等。对比单纯的判断两边的值是否相等，===能表达更加广义的"相等"。

### eql? 判断值相等比 == 严谨
例如：0 与 0.0 和 1.0 与 1 eql? 返回 false  ==返回 true

## 第6章 循环

### 实现循环的方法

* times 方法
* while 语句
* each 方法
* for 语句
* until 语句
* loop 方法

#### times方法

```ruby
# 满地油菜花输出7遍
7.times do
  puts "满地油菜花"
end
```

得到当前的循环次数
```ruby
10.times do |i|
  puts i
end
```

#### for语句

for语句与times方法不一样，循环的开始值和结束值可以任意指定。

```ruby
sum = 0
for i in 1..5 do
  sum = sum + i
end
puts sum
```
do可以省略

计算变量from到变量to累加的总数
```ruby
from = 10
to = 20
sum = 0
for i in from..to
  sum = sum + i
end
puts sum
```

#### 普通for语句

```ruby
names = ["awk", "Perl", "Python", "Ruby"]
for name in names
  puts name
end
```

#### while语句

```ruby
i = 1
while i < 3
  puts i
  i += 1
end
```
#### until语句

until语句的结构与white完全一样，只是条件判断刚好相反，不满足条件时才执行循环处理

#### each方法

each方法将对象集合里的对象逐条取出

```ruby
names = ["awk", "Perl", "Python", "Ruby"]
names.each do |name|
  puts name
end
```

```ruby
sum = 0
(1..5).each do |i|
  sum = sum + i
end
puts sum
```

#### loop方法

loop方法没有终止条件，只是不断的执行循环

### 循环控制

* break 终止程序，跳出循环
* next 跳到下一次循环
* redo 在相同的条件下重复刚才的处理

#### break

break会终止全体循环程序

#### next

next会忽略next后面的部分，跳到下一个循环开始的部分

#### redo

redo和next非常像，与next不同之处是，redo会再执行一次相同的循环
break和next比较常用，redo在ruby默认提供的程序库里也很难找到踪影

### do ~ end 与 { ~ }

一般的约定

* 程序是跨行写的时候使用 do ~ end
* 程序写在1行的时候用 { ~}

## 第7章 方法

### 方法调用

```ruby
对象.方法名(参数1, 参数2, … ,参数n)
```

对象被称为接收者(receiver)。在面向对象的世界中，调用方法被称为『向对象发送消息（message）』，调用的结果就是『对象接收(receive)了消息』，也就是说，方法的调用就是把几个参数连同消息一起发送给对象的过程。

### 带块的方法调用

each 和 loop 等方法都属于带块的方法

使用do ~ end是，可以省略参数列表括起来的()。使用{~}时，只有在没有参数的时候才可以省略()。

### 运算符形式的方法调用

Ruby中有些方法看起来很像运算符。四则运算等的二元运算符、-（负号）等的一元运算符、指定数组、散列的元素下标的[]等，实际都是方法。

* obj + arg1
* obj =~ arg1
* -obj
* !obj
* obj[arg1]
* obj[arg1] = arg2

实际上可以将obj理解为接收者，将arg1、arg2理解为参数。

### 方法的分类

Ruby的方法分为3类：
* 实例方法
* 类方法
* 函数式方法

#### 实例方法

如果有一个对象的实例，那么以这个对象为接收者的方法就是实例方法。

```ruby
p "10, 20, 30, 40".split(",")
p [1, 2, 3, 4].index(2)
p 1000.to_s
```

#### 类方法

接收者不是对象而是类本身时的方法，是类方法。

```ruby
Array.new
File.open("some_file")
Time.now
```

调用类方法时，可以使用::代替.。Ruby语法中 :: 和 . 代表的意思是一样的。

#### 函数式方法

没有接收者的方法是函数式方法。

```ruby
print "hello!"
sleep(10)
```

函数式方法的执行结果，不会根据接收者的状态而发生变化。程序运行print方法以及sleep方法的时候，不需要知道接收者是谁。反过来说，不需要接收者的方法就是函数式方法。

#### Ruby帮助文档里实例方法的标记法

Ruby帮助文档里标记类的实例方法用Array#each、Array#inject写法。

### 方法的定义

定义方法的一般语法：
```ruby
def 方法名 (参数1， 参数2)
  希望执行的代码
end
```
方法名可以由英文字母、数字、下划线组成，但不能以数字开头。

方法有多个参数时，从参数列表右边开始依次指定默认值。

```ruby
def func(a, b=1, c=3)
end
```

#### 方法的返回值

可以用return指定方法的返回值

可以省略return语句，方法的最后一个表达式的结果作为方法的返回值

return语句可以马上终止程序

#### 定义带块的方法

```ruby
def myloop
  while true
    yield # 执行块
  end
end

num = 1   # 初始化num
myloop do
  puts "num is #{num}"
  break if num > 100     # num超过100时跳出循环
  num * 2
end
```

yield是定义块的关键字

#### 参数个数不确定的方法

通过 『\*变量名』 的形式来定义参数个数不确定的方法

```ruby
def foo(*args)
  args
end

p foo(1, 2, 3)   #=> [1, 2, 3]

def meth(arg, *args)
  [arg, args]
end

p meth(1)         #=> [1, []]
p meth(1, 2, 3)   #=>[1, [2, 3]]
```

#### 关键字参数

Ruby 2.0加入的新特性

```ruby
def 方法名(参数1:值, 参数2:值)
  代码逻辑
end
```

可以使用 『\*\*变量名』这种形式来接收未定义的参数

关键字参数可以与普通参数搭配使用

可以使用散列传递参数

#### 关于方法调用的一些补充

* 把数组分解为参数
* 把散列作为参数传递

### 如何书写简明易懂的程序

* 换行和;
  * 多使用换行作为语句的间隔
  * 除非必要，不使用;作为语句的间隔
* 缩进(indent)
  * 两个空白表示一个缩进
  * 需要使用缩进的情况：
    * 条件分支
    * 循环
    * 块
    * 方法、类等定义
  * 不要突然使用缩进
  * 确保缩进整齐
* 空白
  * 好的写法
    * a+b
    * a + b
  * 不好的写法
    * a +b
    * a+ b
* 良好的编码风格需要大量阅读其他人写的程序

## 第8章 类和模块

### 8.1 类是什么

#### 8.1.1

想知道某个对象属于哪个类，可以使用class方法

```ruby
ary = []
str = 'Hello World.'
p ary.class   #=> Array
p str.class   #=> String
```

判断某个对象是否属于某个类时，使用instance_of?方法

```ruby
ary = []
str = 'Hello World'
p ary.instance_of?(Array)   #=> true
p str.instance_of?(String)  #=> true
p ary.instance_of?(String)  #=> false
p str.instance_of?(Array)   #=> false
```

#### 8.1.2 继承

* 通过扩展已定义的类来创建新类称为继承
* 继承后创建创建的新类称为子类(subclass)
* 被继承的类称为父类(superclass)，也称超类
* 通过继承可以实现以下事情：
  * 在不影响原有功能的前提下追加新功能
  * 重新定义原有功能，使名称相同的方法产生不同的效果
  * 在已有功能的基础上追加处理，扩展已有功能
* BasicObject类是Ruby中所有类的父类，它定义了作为Ruby对象的最基本功能

### 8.2 类的创建

使用class关键字定义类

```ruby
class 类名
  类的定义
end
```
#### 8.2.2 initialize 方法

使用new方法生成新对象时，initialize方法会被调用，new方法的参数会原封不动的传给initialize方法

```ruby
 # initialize方法
def initialize(myname='Ruby')  
  @name=myname                  # 初始化实例变量
end
```

#### 8.2.3 实例变量与实例方法

实例方法在实例内可用

#### 8.2.4 存取器

```ruby
class HelloWorld

  # 获取name
  def name
    @name
  end

  # 修改name
  def name=(value)
    @name = value
  end
```

Ruby提供了简便的定义方法
* attr_reader 只读
* attr_writer 只写
* attr_accessor 读写

#### 8.2.5 特殊变量 self

self是引用对象本身的保留字，对它赋值，不会对本身的值有任何影响

#### 8.2.6 类方法

```ruby
class << HelloWorld
  def hello(name)
    puts "#{name} said hello."
  end
end

HelloWorld.hello('John')  #=> John said hello.

class HelloWorld
  class << self
    def hello(name)
      puts "#{name} said hello."
    end
  end
end

HelloWorld.hello('John')  #=> John said hello.

def HelloWorld.hello(name)
  puts "#{name} said hello."
end

HelloWorld.hello('John')  #=> John said hello.

class HelloWorld
  def self.hello(name)
    puts "#{name} said hello."
  end
end

HelloWorld.hello('John')  #=> John said hello.
```

#### 8.2.7 常量

```ruby
class HelloWorld
  Version = "1.0"
end
```

使用类常量

```ruby
p HelloWorld::Version    #=> "1.0"
```

#### 8.2.8 类变量

@@开头的变量称作类变量，类变量是该类所有实例的共享变量

```ruby
class HelloCount
  @@count = 0

  def HelloWorld.count
    @@count
  end

  def initialize(myname="Ruby")
    @name = myname
  end

  def hello
    @@count += 1
    puts "Hello, World. I am #{@name}.\n"
  end
end

bob = HelloCount.new("Bob")
alice = HelloCount.new("Alice")
ruby = HelloCount.new

p HelloCount.count  #=> 0
bob.hello
alice.hello
ruby.hello
p HelloCount.count  #=> 3
```

#### 8.2.9 限制方法的调用

限制方法的调用

* public 实例方法，对外部公开
* private 无法从实例外部访问
* protected 在同一个类中使用时，可做实例方法调用

### 8.3 扩展类

#### 8.3.1 在原有类基础上添加方法

给String类添加统计单词数实例方法

```ruby
class String
  def count_word
    ary = self.split(/\s+/) # 使用空格分割
    return ary.size         # 返回分割后数组元素总数
  end
end

str = "Just Another Ruby Newbie"
p str.count_word            #=> 4
```

#### 8.3.2 继承

定义继承时，在使用class关键字指定类名的同时指定父类名

```ruby
class 类名 < 父类名
  类定义
end
```

```ruby
class RingArray < Array
  def [](i)
    idx = i % size
    super(idx)
  end
end

wday = RingArray['日', '火', '水', '木', '金', '土']
p wday[6]   #=> '土'
p wday[11]  #=> '木'
p wday[15]  #=> '月'
p wday[-1]  #=> '土'
```

### 8.4 alias 与 undef

#### 8.4.1 alias

```ruby
alias 别名 原名     # 直接使用方法名
alias :别名 :原名   # 使用符号名
```

同一种功能设置多个名称时，我们使用alias

```ruby
class C1
  def hello
    "Hello"
  end
end

class C2 < C1
  alias old_hello hello

  def hello
    "#{old_hello}, again"
  end
end

obj = C2.new
p obj.old_hello
p obj.hello
```

#### 8.4.2 undef

undef用于删除已有方法的定义。

```ruby
undef 方法名    # 只用使用方法名
undef :方法名   # 使用符号名
```

## 8.5 模块

模块是Ruby的特色功能之一。如果说类变现的是事物的实体（数据）和行为（处理），那模块表现的就只是事物的行为部分。模块和类有两点不同：

* 模块不能拥有实例
* 模块不能被继承

## 8.6 模块的使用方法

### 8.6.1 提供命名空间

调用方法

```ruby
模块名.方法名
```

### 8.6.2 利用Mix-in扩展功能

Mix-in就是将模块混合到类中

Mix-in可以灵活的解决下面问题：

* 两个类拥有相似功能，但不希望作为相同种类（Class）考虑
* Ruby不支持父类多重继承，因此无法对已经继承的类添加共通的功能的时候

```ruby
module MyModule
  # 共通的方法
end

class MyClass1
  include MyModule
  # MyClass1独有方法
end

class MyClass2
  include MyModule
  # MyClass2独有方法
end
```

## 8.7 创建模块

```ruby
module 模块名
  模块定义
end
```

```ruby
module HelloModule
  Version = "1.0"

  def hello(name)
    puts "Hello, #{name}"
  end

  module_function :hello
end
```

### 8.7.1 常量

```ruby
p HelloModule::Version    #=> "1.0"
```

### 8.7.2 方法的定义

## 8.8 Mix-in

* 想知道类是否包含某个模块，可以使用include?方法
* 用ancestors方法和superclass方法调查类的继承关系

```ruby
module M
  def meth
    "meth"
  end
end

class C
  include M
end

c = C.new
p c.meth

C.include?(M)   #=> true
p C.ancestors   #=> [C, M, Object, BasicObject]
p C.superclass  #=> Object
```

### 8.8.1 查找方法的规则

* 同继承关系一样，原类中已经定义了同名的方法时，优先使用该方法
* 在同一类中包含多个模块时，优先使用最后一个包含模块
* 嵌套include时，查找顺序也是线性的
* 相同的模块被包含两次以上时，第2次以后的会被省略

### 8.8.2 extend方法

```ruby
module Edition
  def edition(n)
    "#{self} 第#{n}版"
  end
end

str = "Ruby基础教程"

str.extend(Edition)

p str.edition(4)    #=> "Ruby基础教程第4版"
```
include可以帮助我们突破继承的限制，通过模块扩展类的功能；而extend则可以帮助我们跨过类，直接通过模块扩展对象的功能。

### 8.8.3 类与Mix-in

我们可以把类方法理解为：
* Class类的实例方法
* 类对象的单例方法

## 8.9 面向对象程序设计

### 8.9.1 对象是什么

面向对象语言的「对象」是指数据及操作数据方法的组合

### 8.9.2 面向对象的特征

* 封装
* 多态

## 第9章 运算符

### 9.1 赋值运算符

### 9.2 逻辑运算符的应用

* 表达式的执行顺序是从左到右
* 如果逻辑表达式真假已经可以确定，则不会判断剩余表达式
* 最后一个表达式的值为整理逻辑表达式的值

### 9.3 条件运算符

```ruby
条件 ？ 表达式1 : 表达式2
```

### 9.4 范围运算符

范围对象range

```ruby
Range.new(1, 10)
```

```ruby
1..10
```

x..y是从x到y
x...y是从x到y的前一个

### 9.5 运算符优先级

从高到低排序

* ::
* []
* + ! ~
* **
* -
* * / %
* + -
* << >>
* &
* | ^
* > >= < <=
* <=> == === != =~ !~
* &&
* ||
* ?:
* .. ...
* = （包含+= -= /=）
* not
* and or

如果不想按照优先顺序计算，可以使用()起来

### 9.6 定义运算符

不允许修改的运算符

* ::
* &&
* ||
* ..
* ...
* ?:
* not
* =
* and
* or

#### 9.6.1 二元运算符

## 第10章 错误处理与异常

#### 10.3 异常处理的写法

```ruby
begin
  可能发生错误的处理
rescue
  发生错误时的处理
end
```

rescue后指定变量名，可获得异常对象

```ruby
begin
  可能发生错误的处理
rescue => 引用异常对象的变量
  发生错误时的处理
end
```

异常发生时被自动赋值的变量：

* $! —— 最后发生的异常（异常对象）
* $@ —— 最后发生异常的位置信息

异常对象的方法：

* class 异常的种类
* message 异常信息
* backtrace 异常发生的位置

## 第11章 块

### 11.1 块是什么

块就是在调用方法时，能与参数一起传递的多个处理的集合

```ruby
[1, 2, 3, 4, 5].each do |i|
  puts i ** 2
end
```
do和end之间的就是块

## 第13章 数组类

### 13.5 作为列的数组

* 队列是一种按照元素被追加顺序来获取元素的数据结构。这样的做法称为FIFO（First-in First-out）,也就是先进先出。
* 而栈则是一种按照与元素被追加时顺序相反的顺序来获取元素的数据结构。这样的做法叫做LIFO（Last-in First-out），是一种『先进后出』的数据结构。
      ## 13.6 主要的数组方法

#### 13.6.1 为数组添加元素

* a.unshift(item) 将item元素添加到数组开头
* a<<item 和 a.push(item) << 与 push 等价，是在数组a末尾添加新元素item
* a.conact(b) 和 a+b 连接数组a和b。concat是具有破坏性的方法，而+则会返回新数组
* a[n]=item; a[n..m]=item; a[n,len]=item  将a数组指定部分的元素替换为item

#### 13.6.2 从数组中删除元素

a.compact
a.compact!

从数组a中删除nil元素。
compact方法返回新数组，compact!则直接替换原来的数组

a.delete(x)
从数组a删除x元素

```ruby
a = [1, 2, 3, 2, 1]
a.delete(2)
p a   #=> [1, 3, 1]
```

a.delete_at(n)
从数组a中删除a[n]元素
```ruby
a = [1, 2, 3, 4, 5]
a.delete_atl(2)
p a   #=> [1, 2, 4, 5]
```

a.delete_if{|item| … }
a.reject{|item| … }
a.reject!{|item| … }

判断数组a中个元素item，如果块的执行结果为真，则从数组a中删除item。delete_if和reject!方法都是具有破坏性的方法。

a.slice!(n)
a.slice!(n..m)
a.slice!(n, len)
删除数组a中指定的部分，并返回删除部分的值。slice!是具有破坏性的方法。

```ruby
a = [1, 2, 3, 4, 5]
p a.slice!(1, 2)    #=> [2, 3]
p a                 #=> [1, 4, 5]
```

a.uniq
a.uniq!

删除数组a中重复的元素，uniq!是具有破坏性的方法

```ruby
a = [1, 2, 3, 4, 3, 2, 1]
a.uniq!
p a   #=> [1, 2, 3, 4]
```

a.shift
删除数组a开头的元素

a.pop
删除数组a末尾的元素

#### 13.6.3 替换数组元素

### 13.7 数组与迭代器

迭代器是实现循环处理的方法，而数组则是多个对象的集合

### 13.8 处理数组中的元素

#### 13.8.1 使用循环与索引

```ruby
list = ["a", "b", "c", "d"]
for i in 0..3
  print "第", i+1,"个元素是",list[i],".\n"
end
```

#### 13.8.2 使用each方法逐个获取元素

```ruby
list = [1, 3, 5, 7, 9]
sum = 0
list.each do |elem|
  sum += elem
end
print "合计：",sum,"\n"
```

指定元素索引值 each_with_index

```ruby
list = ["a", "b", "c", "d"]
list.each_with_index do |elem, i|
  print "第", i+1, "个元素是", elem,".\n"
end
```

#### 13.8.3 使用具有破坏性的方法实现循环

```ruby
while item = a.pop
  ## 对item进行处理
end
```

#### 13.8.4 使用其他迭代器

* collect
* map

#### 13.8.5 创建专用迭代器

参考 11.3

### 13.9 数组元素

#### 13.9.1 使用简单矩阵

```ruby
a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

取出元素6

a[1][2]
```

## 第14章 字符串类

### 14.1 字符串的创建

```ruby
str1 = "这是字符串"
str2 = '那也是字符串'
```

使用\转义特殊字符

* \t 水平制表符
* \n 换行符
* \r 回车
* \f 换页
* \b 退格
* \a 响铃
* \e 溢出
* \s 空格
* \v 垂直制表符
* \nnn 8进制表示方式
* \Xnn 16进制表示方式
* \Cx、\C-x Control + x
* \M-x Meta(Alt) + x
* \M-\C-x Meta(Alt) + Control + x
* \x 表示x字符本身(x为除以上字符的字符)
* \Unnnn Unicode字符的16进制表示方式

#### 14.1.1 使用%Q与%q

* %Q相当于用" "创建字符串
* %q相当于用' '创建字符串

```ruby
desc = %Q{Ruby的字符串中也可以使用''和""}
str = %q|Ruby said, 'Hello world!'|
```

#### 14.1.2 使用Here Document

Here Document源于Unix的shell的一种写法，<<来创建字符串

#### 14.1.3 使用sprintf方法

参考printrf方法与sprintf方法

#### 14.1.4 使用``

```ruby
irb --simple-prompt
`ls -l /etc/hosts`
```

### 14.2 获取字符串长度

length和size方法获得字符串长度，两者的返回结果相同。

```ruby
p '面向对象编程语言'.length	#=> 8
```

需要获得字节数可以使用bytesize方法

```ruby
p '面向对象编程语言'.bytesize	#=> 24
```

想知道字符串长度是否为0，使用empty?方法

### 14.3 字符串索引

```ruby
str = "全新的String类对象"
p str[0]	#=> "全"
p str[3]	#=> "S"
p str[2, 8]	#=> "的String类"
```

### 14.4 字符串的连接

连接字符串的两种方法：

* 将两个字符串合并为新字符串
* 扩展原有字符串

### 14.5 字符串的比较

使用==或者!=判断字符串是否相等

#### 14.9.3 与连接、反转(reverse)相关的方法

s.reverse
s.reverse!
反转字符串

```ruby
s = "晚上好"
p s.reverse   #=> "好上晚"
```

### 14.10 其他方法

s.strip
s.strip!

这是删除字符串s开头和结尾空白字符的方法

* s.upcase 大写
* s.upcase!
* s.downcase 小写
* s.downcase!
* s.swapcase 大写字母转换小写，小写字母转换大写
* s.swapcase!
* s.capitalize 首字母大写
* s.capitalize!

## 第15章 散列类

### 15.2 散列的创建

#### 15.2.1 使用{}

{键 => 值}

```ruby
h1 = {"a"=>"b", "c"=>"d"}
p h1["a"]	#=> "b"
```

{健: 值}

```ruby
h2 = {a: "b", c: "d"}
p h2	#=> {:a=>"b", :c=>"d"}
```

#### 15.2.2 使用Hash.new

```ruby
h1 = Hash.new
h2 = Hash.new("")
p h1["not_key"]		#=> nil
p h2["not_key"]		#=> ""
```

### 15.3 值的获取与设定

使用[]获取键相对应的元素值

```ruby
h = Hash.new
h["R"] = "Ruby"
p h["R"]	#=> "Ruby"
```

另外可以使用store方法设定，fetch方法获取值

```ruby
h = Hash.new
h.stroe("R", "Ruby")
p h.fetch("R")		#=> "Ruby"
```

使用fetch方法时，有一点与[]不一样，如果散列中不存在指定键，程序会发生异常；
如果对fetch方法指定第2个参数，那么该参数值就会作为键不存在时散列的默认值;
fetch方法还可以使用块，此时块的结果为散列的默认值

```ruby
h = Hash.new
p h.fetch("N"){String.new}		#=> ""
```

#### 15.3.1 一次性获取所有键、值

* 获取键
	* 数组形式: keys方法
	* 迭代器形式: each_key{|键| ……}
* 获取值
	* 数组形式: values方法
	* 迭代器形式: each_value{|值| ……}
* 获取键值对[键,值]
	* 数组形式: to_a
	* 迭代器形式: each{|键, 值| ……}			each{|数组| ……}

#### 15.3.2 散列的默认值

1. 创建散列时指定默认值

```ruby
h = Hash.new(1)
h["a"] = 10
p h["a"]	#=> 10
p h["x"]	#=> 1
p h["y"]	#=> 1
```

2. 通过块指定默认值

```ruby
h = Hash.new do |hash, key|
	hash|key| = key.upcase
end
p h["a"]	#=> "b"
p h["x"]	#=> "x"
p h["y"]	#=> "y"
```

### 15.4 查看指定对象是否为散列的键或值

h.key?(key)
h.has_key?(key)
h.include?(key)
h.member?(key)

上面4个方法都是查看指定对象是否为散列的键的方法，用法和效果都一样

h.value?(value)
h.has_value?(value)
上面两2个方法用来检查值是否在指定的对象中

### 查看散列的大小

* h.size
* h.length

可以用length方法或者size方法查看散列的大小

* h.empty?

可以empty?方法来查看散列的大小是否为0

### 15.6 删除键值

* h.delete(key)

通过键删除用delete方法，delete方法可以使用块，如果不存在键，返回块执行结果

```ruby
h = {"R"=>"Ruby"}
p h.delete("P"){|key| "no #{key}."}   #=> "no P."
```

* h.delete_if{|key, val| ……}
* h.reject!{|key, val| ……}

```ruby
h = {"R"=>"Ruby", "p"=>"Perl"}
p h.delete_if{|key, value| key == "P"}  #=> {"R"=>"Ruby"}
```

reject!方法和delete_if方法用法相同，但当不符合条件时，两者返回值各异。delete_if返回原来的散列，reject!返回nil

### 15.7 初始化散列

* h.clear

使用clear方法清空使用过的散列

```ruby
h = {"a"=>"b", "c"=>"d"}
h.clear
p h.size    #=> 0
```

## 第16章 正则表达式类

### 16.1 关于正则表达式

#### 16.1.1 正则表达式的写法与用法

一般情况我们把正则表达式对象（Regexp类对象）称为『正则表达式对象』，或直接称为『正则表达式』

#### 16.1.2 正则表达式创建方法

在程序中，通过用//将正则表达式模式的字符串括起来，就可以非常简单的创建出正则表达式

另外可以使用类方法Regexp.new(str)来创建对象

```ruby
re = Regexp.new("Ruby")
```

使用%r创建正则表达式

```ruby
%r(模式)
%r<模式>
%r|模式|
%r!模式!
```

### 16.2 正则表达式的模式与匹配

```ruby
正则表达式 =~ 字符串
```

无法匹配时返回nil，匹配成功返回该字符串起始字符的位置

```ruby
if 正则表达式 =~ 字符串
  匹配时处理
else
  不匹配时处理
end
```

可以使用!~颠倒「真」与「假」

#### 16.2.1 匹配普通字符

#### 16.2.2 匹配行首与行尾

* ^ 代表行首
* $ 代表行尾

#### 16.2.3 指定匹配字符的范围

有时候我们想匹配『ABC』中的1个字符，可以使用[]

```ruby
[AB]      # 匹配A或B
[ABC]     # 匹配A或B或C
[CBA]     # 同上，与[]中的顺序无关
[012ABC]  # 0、1、A、B、C中的一个字符
```

#### 16.2.4

使用.匹配任意1个字符

#### 16.2.5 使用反斜杠的模式

* \s 表示空白字符，匹配空格(0x20)、制表符(Tab)、换行符、换页符
* \d 配备0到9的数字
* \w 匹配英文字母与数字
* \A 匹配字符串的开头
* \z 匹配字符串的末尾
* \  元字符串转义

#### 16.2.6 重复

* * 重复0次以上
* + 重复1次以上
* ? 重复0次或1次

#### 16.2.7 最短匹配

* \*? 0次以上的重复中最短的部分
* +? 1次以上的重复中最短的部分

#### 16.2.8 ()与重复

### 16.3 使用quote方法的正则表达式

### 16.4 正则表达式的选项

正则表达式还有选项，使用选项可以改变正则表达式的一些默认效果。
设定正则表达式的选项时，只需在/.../后面指定即可，如：/.../im

* i 忽略英文字母大小写
* x 忽略正则表达式中的空白字符以及#后面的字符，指定这个选项，我们就可以使用#在正则表达式中写注释
* m 指定这个选项可以使用.匹配换行符

### 16.5 捕获

所谓捕获，就是从正则表达式的就匹配部分中提取其中的某部分。通过"$数字"这种形式的变量，就可以获取匹配了正则表达式中用()扩住的部分字符串。

除了"$数字"这种形式，保存匹配结果的变量还有：

* $\` 匹配部分前的字符串
* $& 匹配的字符串
* $' 匹配部分后的字符串

```ruby
/C./ =~ 'ABCDEF'
p $\``   #=> "AB"
p $&    #=> "CD"
p $'    #=> "EF"     
```

### 16.6 使用正则表达式的方法

#### 16.6.1 sub方法与gsub方法

sub方法与gsub方法的作用是用指定的字符串置换字符串中的某部分字符

sub方法只置换首次匹配的部分，而gsub方法则会置换所有匹配的部分

```ruby
str = "abc   def   g   hi"
p str.sub(/\s+/, ' ')    #=> "abc def  g  hi"
p str.gsub(/\s+/, ' ')   #=> "abc def g hi"
```

sub方法和gsub方法还可以使用块，这时程序将字符串中匹配的部分传递给块，并在块中使用该字符串进行处理。

#### 16.6.2 sacn方法

sacn方法像gsub方法那样捕获匹配部分的字符串，但不能做置换操作
