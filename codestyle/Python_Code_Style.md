## 一些常见的编码规范

### 1. shebang

~~~
 #! /usr/bin/env python3
 # -*- coding:utf-8 -*-
~~~

### 2.注释

##### (1) 文档头

~~~python
# -*- coding: utf-8 -*-
#!/usr/bin/env python3

######################################################
#
# filename - xxxxxxx[function]
# written by  (zhaodao)
# inspired by xxxxxxx
#
######################################################
~~~

##### (2) docstring

除非一个函数满足：外部不可见/非常短小/简单命令，否则必须要有文档字符串．

推荐使用google 风格的docstring

~~~python
def func():
    """ This is a groups style docs.

    Parameters:
        param1 - this is the first param
        param2 - this is a second param

    Returns:
        This is a description of what is returned

    Raises:
        KeyError - raises an exception
    """
    pass
~~~

##### (3) 块注释

块注释位于代码块之上，行注释写在行后（离开代码２个空格）

注释的注意两点

解释复杂难懂的操作

不要写描述性注释，应该说你代码为什么样这么做，而不是做了什么


##### (4) 类注释

类注释应该包含文档字符串和公共属性(如果有)

~~~
class SampleClass(object):
    """Summary of class here.
    Longer class information....

    Attributes:
        likes_spam: A boolean indicating if we like SPAM or not.
        eggs: An integer count of the eggs we have laid.
　　　．．．
~~~

如果一个类不继承自其它类, 就显式的从object继承. 嵌套类也一样.

##### (5) TODO注释

TODO注释应该在所有开头处包含"TODO"字符串, 紧跟着是用括号括起来的**你的名字, email地址或其它标识符**. 然后是一个冒号. 接着必须有一行注释, 解释要做什么.

```
# TODO(kl@gmail.com): Use a "*" here for string repetition.
# TODO(Zeke) Change this to use relations.
```


### 3. 字符串

- 即使参数都是字符串, 使用%操作符或者格式化方法格式化字符串. 不过也不能一概而论, 你需要在+和%之间好好判定.

- 使用　`.join`　连接字符串列表，　而是使用　`+= `

- 在同一个文件中, 保持使用字符串引号的一致性. 使用单引号’或者双引号”之一用以引用字符串
- 对多行字符串使用三重单引号

### 4. 文件和sockets

使用with管理文件

~~~
with open("hello.txt") as hello_file:
    for line in hello_file:
        print line
~~~


### 5. 命名

**基本原则:**  见名知意

总体来说分类两类:

- **类名**和**异常**使用驼峰命名法, 

- **变量/函数名或者方法名** 使用帕斯卡命名法(下划线命名法), 比如 **get_landmark_2d**
- **模块名和包名**也使用使用帕斯卡命名法(下划线命名法), 但是应该尽量短小, 避免使用下划线,防止与函数名混淆.
- 对于内部变量:  模块或函数私有建议使用单下划线  `_`  开头/类私有使用双下划线 `__` 开头

### 6. 包导入顺序

导入应该放在文件顶部, 位于模块注释和文档字符串之后, 模块全局变量和常量之前. 导入应该按照从最通用到最不通用的顺序分组:

1. 标准库导入
2. 第三方库导入
3. 应用程序指定导入

每一个分组应该按照字典序进行排序, 方便查找. 

### 7. 项目目录

可以参考但不拘泥于以下目录，deep leanring可以有一些相应的改变：

~~~shell
.
├── c_lib # 相关的c扩展模块
├── doc # 项目文档
├── src # 源代码
├── data # 数据
│   ├── img
│   └── video
├── demo.py # 入口文件
├── test # 测试文件
├── README.md 
├── requirements.txt
├── result  # 存放结果
└── utils  　# 通用的辅助脚本文件
~~~

### 8. 空行/空格/缩进/行长度/分号/括号

##### (1) 空行

顶级定义（函数或者类定义）之间空两行, 方法定义（类内方法）之间空一行

##### (2)　空格/缩进

使用四个空格进行缩进，不要使用Tab进行缩进.　不要在逗号，分号，冒号的前面加空格，但是后面应该留有空格．

##### (3)　行长度

不要超过80个字符. 尽量不要使用反斜杠`/`进行换行．可以使用括号进行隐式换行．

##### (4)　括号/分号

尽量不要带有c++性质的括号．末尾也没必要用分号

### 9.　Main

~~~
def main():
    ...
    
if __name__ == "__main__":
    main()
~~~


### 参考:

google开源项目代码风格指南