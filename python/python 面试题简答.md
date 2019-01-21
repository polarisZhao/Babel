[TOC]

#### 问题1：Python 简介

**问题：** 到底什么是Python？你可以在回答中与其他技术进行对比（也鼓励这样做）

**参考答案:**

- Python是一种**解释型语言**。这就是说，与C语言和C的衍生语言不同，Python代码在运行之前不需要编译。其他解释型语言还包括PHP和Ruby。
- Python是**动态类型语言**，指的是你在声明变量时，不需要说明变量的类型。你可以直接编写类似`x=111`和`x="I'm a string"`这样的代码，程序不会报错。
- Python非常适合**面向对象的编程**（OOP），因为它支持通过组合（composition）与继承（inheritance）的方式定义类（class）。Python中没有访问说明符（access specifier，类似C++中的public和private），这么设计的依据是“大家都是成年人了”。
- 在Python语言中，**函数是第一类对象**（first-class objects）。这指的是它们可以被指定给变量，函数既能返回函数类型，也可以接受函数作为输入。类（class）也是第一类。
- Python代码**编写快，但是运行速度比编译语言通常要慢**。好在Python允许加入基于C语言编写的扩展，因此我们能够优化代码，消除瓶颈，这点通常是可以实现的。numpy就是一个很好地例子，它的运行速度真的非常快，因为很多算术运算其实并不是通过Python实现的。
- Python**用途非常广泛**——网络应用，自动化，科学建模，大数据应用，等等。它也常被用作“胶水语言”，帮助其他语言和组件改善运行状况。
- **Python让困难的事情变得容易**，因此程序员可以专注于算法和数据结构的设计，而不用处理底层的细节。

**Hints:** 从 **解释型语言**、**动态类型语言**、**面向对象**、**面向过程**、**优缺点**、**应用领域** 和**设计理念** 等几个方面进行回答即可。

#### 问题2：代码规范

**问题：**补充缺失的代码

~~~python
def print_directory_contents(sPath):
    """
    这个函数接受文件夹的名称作为输入参数，返回该文件夹中文件的路径，
    以及其包含文件夹中文件的路径。
    """
    # 补充代码
~~~

**参考答案：**

~~~python
def print_directory_contents(sPath):
    """
    这个函数接受文件夹的名称作为输入参数，返回该文件夹中文件的路径，
    以及其包含文件夹中文件的路径。
    """
    import os
    for sChile in os.path.listdir(sPath):
        sChilePath = os.path.join(sPath, sChildPath)
        if os.path.isdir(sChilePath):
            print_directory_contents(sChilePath)
        else:
            print(sChilePath)
~~~

**Hints:**

- 要注意**代码规范**：命名规范（与给定代码一致），无效输入的判断，KISS 原则。
- 熟悉标准库 **os**
- **递归**

#### 问题3：列表推导   list comprehension

**问题：** 阅读下面的代码，写出A0，A1至An的最终值。

~~~python
A0 = dict(zip(('a','b','c','d','e'),(1,2,3,4,5)))   
# A0 = {a:1, b:2, c:3, d:4, e:5}
A1 = range(10)
# A1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
A2 = [i for i in A1 if i in A0]
# A2 = []
A3 = [A0[s] for s in A0]
# A3 = [1, 2, 3, 4, 5]
A4 = [i for i in A1 if i in A3]
# A4 = [1, 2, 3, 4, 5]
A5 = {i:i*i for i in A1}
# A5 = {1:1, 2:4, 3:9, 4:16, 5:25, 6:36, 7:49, 8:64, 9:81}
A6 = [[i,i*i] for i in A1]
# A6 = {[1:1], [2:4], [3:9], [4:16], [5:25], [6:36], [7:49], [8:64], [9:81]}
~~~

#### 问题4：代码管理

**问题：** 你如何管理不同版本的代码？

**参考答案**：主要使用git进行版本管理！原公司使用的是gitlab作为版本管理工具。当然也可以使用SVN。（可是适当说说github的使用）

**Hints：** **版本控制工具** git 是一个版本控制工具版本控制，能让你了解到一个文件的历史，以及它的发展过程的系统。 gitHub是一个面向开源及私有软件项目的托管平台，因为只支持git 作为唯一的版本库格式进行托管，故名gitHub。 

#### 问题5： 可变默认参数

**问题：**下面代码会输出什么？

```python
def f(x,l=[]):
    for i in range(x):
        l.append(i*i)
    print l

f(2)     # [0, 1]
f(3,[3,2,1])  # [3, 2, 1, 0, 1, 4]
f(3)   # [0,1, 0, 1, 4]   attention ！
```

**Hints: **   当函数被定义时，一个新的列表就被创建一次 ，而且同一个列表在每次成功的调用中都被使用。当函数被定义时，Python的默认参数就被创建一次，而不是每次调用函数的时候创建。 这意味着，如果您使用一个可变默认参数并改变了它，您 *将会* 在未来所有对此函数的 调用中改变这个对象。 参考：https://docs.python-guide.org/writing/gotchas/

#### 问题6： 多线程 &GIL

**问题：**Python和多线程（multi-threading）是个好主意吗？列举一些让Python代码以并行方式运行的方法。

**参考答案：** **Python并不支持真正意义上的多线程**。Python中提供了[多线程包](https://docs.python.org/2/library/threading.html)，但是如果你想通过多线程提高代码的速度，使用多线程包并不是个好主意。**Python中有一个被称为全局解释器锁 Global Interpreter Lock（GIL）的东西，它会使你的多个线程在任何时候只有一个被执行**。线程的执行速度非常之快，会让你误以为线程是并行执行的，但是实际上都是轮流执行。经过GIL这一道关卡处理，会增加执行的开销。这意味着，如果你想提高代码的运行速度，使用`threading`包并不是一个很好的方法。

#### 问题7：可变参数

**问题:** `*args`，`**kwargs` 这两个参数是什么意思？为什么要使用它们？

**参考答案：**如果我们**不确定要往函数中传入多少个参数**，或者我们想往函数中以列表和元组的形式传参数时，那就使要用`*args`；如果我们不知道要往函数中传入多少个关键词参数，或者想传入字典的值作为关键词参数时，那就要使用`**kwargs`。

下面是具体的示例：

```python
l = [1,2,3]
t = (4,5,6)
d = {'a':7,'b':8,'c':9}

def f(*args, **kwargs): 
    print(args, kwargs)

f()                         # () {}
f(1,2,3)                    # (1, 2, 3) {}
f(1,2,3,"groovy")           # (1, 2, 3, 'groovy') {}
f(a=1,b=2,c=3)              # () {'a': 1, 'c': 3, 'b': 2}
f(a=1,b=2,c=3,zzz="hi")     # () {'a': 1, 'c': 3, 'b': 2, 'zzz': 'hi'}
f(1,2,3,a=1,b=2,c=3)        # (1, 2, 3) {'a': 1, 'c': 3, 'b': 2}

f(*l,**d)                   # (1, 2, 3) {'a': 7, 'c': 9, 'b': 8}
f(*t,**d)                   # (4, 5, 6) {'a': 7, 'c': 9, 'b': 8}
f(1,2,*t)                   # (1, 2, 4, 5, 6) {}
f(q="winning",**d)          # () {'a': 7, 'q': 'winning', 'c': 9, 'b': 8}
f(1,2,*t,q="winning",**d)   
              # (1, 2, 4, 5, 6) {'a': 7, 'q': 'winning', 'c': 9, 'b': 8}

l = [1,2,3]
t = (4,5,6)
d = {'a':7,'b':8,'c':9}
def f2(arg1, arg2, *args, **kwargs): 
    print arg1,arg2, args, kwargs

f2(1,2,3)                       # 1 2 (3,) {}
f2(1,2,3,"groovy")              # 1 2 (3, 'groovy') {}
f2(arg1=1,arg2=2,c=3)           # 1 2 () {'c': 3}
f2(arg1=1,arg2=2,c=3,zzz="hi")  # 1 2 () {'c': 3, 'zzz': 'hi'}
f2(1,2,3,a=1,b=2,c=3)           # 1 2 (3,) {'a': 1, 'c': 3, 'b': 2}

f2(*l,**d)                  # 1 2 (3,) {'a': 7, 'c': 9, 'b': 8}
f2(*t,**d)                  # 4 5 (6,) {'a': 7, 'c': 9, 'b': 8}
f2(1,2,*t)                  # 1 2 (4, 5, 6) {}
f2(1,1,q="winning",**d)     # 1 1 () {'a': 7, 'q': 'winning', 'c': 9, 'b': 8}
f2(1,2,*t,q="winning",**d)   # 1 2 (4, 5, 6) {'a': 7, 'q': 'winning', 'c': 9, 'b': 8}
```

#### 问题8 单元测试

**问题：** “猴子补丁”（monkey patching）指的是什么？这种做法好吗？

**参考答案：**   **"猴子补丁”就是指，在函数或对象已经定义之后，再去改变它们的行为。**

举个例子：

```
import datetime
datetime.datetime.now = lambda: datetime.datetime(2012, 12, 12)
```

大部分情况下，这是种很不好的做法，要避免这种做法，因为函数在代码库中的行为最好是都保持一致。打“猴子补丁”的原因可能是为了测试。`mock`包对实现这个目的很有帮助。

#### 问题9 装饰器  

**问题：** 下面这些是什么意思：`@classmethod`,  `@staticmethod`,  `@property`？

**背景知识**

这些都是装饰器（decorator）。**装饰器是一种特殊的函数，要么接受函数作为输入参数，并返回一个函数，要么接受一个类作为输入参数，并返回一个类。**@标记是语法糖（syntactic sugar），可以让你以简单易读得方式装饰目标对象。

```python
@my_decorator
def my_func(stuff):
    do_things
# Is equivalent to
def my_func(stuff):
    do_things
my_func = my_decorator(my_func)
```

**参考答案**

`@classmethod`， `@staticmethod` 和 `@property`这三个装饰器的使用对象是在类中定义的函数。

`@classmethod`    定义类方法，只能访问类变量而不能访问实例变量，需要通过cls参数传递当前类对象，不需要实例化，直接`类名.方法名()`，可通过类对象和类对象实例访问。

`@staticmethod` 定义静态方法，名义归类管，实际跟类没关系，是类下单独的函数，可以不传递任何参数，不需要实例化，直接 类名.方法名()，可通过类对象和类对象实例访问。

~~~python
class Demo:
    @classmethod   # 类方法
    def klassmeth(*args)
        return args
    
    @staticmethod   
    def statemeth(*args):   # 与普通函数类似
        return args
    
>> Demo.klassmeth()
(<class '__main__.Demo'>,)
>> Demo.klassmeth('spam')
(<class '__main__.Demo'>, 'spam')
>> Demo.statmeth()
()
>> Demo.statmeth()
('spam', )
~~~

`@property`  负责把一个方法变成属性调用的，常常用于定义只读属性(不定义 setter 方法) 或者对参数进行必要的检查

~~~python
class LineItem:
    def __init__(self, description, weight, price):
        self.description = description
        self.weight = weight   # 特征的设值方法
        
    @property   # 装饰读值的方法
    def weight(self):
        return self.__weight = value
    #被装饰的读值方法有个 .setter 属性，这个属性也是个装饰器，这个装饰器把读值方法和设值方法绑定在一起
    @weight.setter  
    def weight(self, value):
        if value > 0:
            self.__weight = value
        else:
            raise ValueError('value must be > 0')   
~~~

#### 问题10  面向对象编程 OOP

**问题：** 阅读下面的代码，它的输出结果是什么？

```python
class A(object):
    def go(self):
        print("go A go!")
    def stop(self):
        print("stop A stop!")
    def pause(self):
        raise Exception("Not Implemented")

class B(A):
    def go(self):
        super(B, self).go()
        print("go B go!")

class C(A):
    def go(self):
        super(C, self).go()
        print("go C go!")
    def stop(self):
        super(C, self).stop()
        print("stop C stop!")

class D(B,C):
    def go(self):
        super(D, self).go()
        print("go D go!")
    def stop(self):
        super(D, self).stop()
        print("stop D stop!")
    def pause(self):
        print("wait D wait!")

class E(B,C): pass

a = A()
b = B()
c = C()
d = D()
e = E()

# 说明下列代码的输出结果
a.go()  
# go A go!
b.go()  
# go A go!
# go B go!
c.go()  
# go A go! 
# go C go!
d.go()  
# go A go! 
# go C go!     # 注意这里是先 C 后 B
# go B go!  
# go D go!
e.go()  
# go A go! 
# go C go!
# go B go! 

a.stop()
# stop A stop!
b.stop()         # dynamic binding
# stop A stop!
c.stop()
# stop A stop!
# stop C stop!
d.stop()
# stop A stop!
# stop C stop!
# stop D stop!
e.stop()       
# stop A stop!
# stop C stop!

a.pause()
# ... Exception: Not Implemented
b.pause()
# ... Exception: Not Implemented
c.pause()
# ... Exception: Not Implemented
d.pause()                 # 
# wait D wait!
e.pause()
# ... Exception: Not Implemented
```

####  问题11 组合与对象构造

**问题：** 阅读下面的代码，它的输出结果是什么？

```python
class Node(object):
    def __init__(self,sName):
        self._lChildren = []
        self.sName = sName
        
    def __repr__(self):
        return "<Node '{}'>".format(self.sName)
    
    def append(self,*args,**kwargs):
        self._lChildren.append(*args,**kwargs)
        
    def print_all_1(self):
        print(self)
        for oChild in self._lChildren:
            oChild.print_all_1()
            
    def print_all_2(self):
        def gen(o):
            lAll = [o,]
            while lAll:
                oNext = lAll.pop(0)
                lAll.extend(oNext._lChildren)
                yield oNext
        for oNode in gen(self):
            print(oNode)

oRoot = Node("root")
oChild1 = Node("child1")
oChild2 = Node("child2")
oChild3 = Node("child3")
oChild4 = Node("child4")
oChild5 = Node("child5")
oChild6 = Node("child6")
oChild7 = Node("child7")
oChild8 = Node("child8")
oChild9 = Node("child9")
oChild10 = Node("child10")

oRoot.append(oChild1)  
oRoot.append(oChild2)
oRoot.append(oChild3)
oChild1.append(oChild4)
oChild1.append(oChild5)
oChild2.append(oChild6)
oChild4.append(oChild7)
oChild3.append(oChild8)
oChild3.append(oChild9)
oChild6.append(oChild10)

# 说明下面代码的输出结果
oRoot.print_all_1()
# <Node 'root'>
# <Node 'child1'>
# <Node 'child4'>
# <Node 'child7'>
# <Node 'child5'>
# <Node 'child2'>
# <Node 'child6'>
# <Node 'child10'>
# <Node 'child3'>
# <Node 'child8'>
# <Node 'child9'>

oRoot.print_all_2()
# <Node 'root'>
# <Node 'child1'>
# <Node 'child2'>
# <Node 'child3'>
# <Node 'child4'>
# <Node 'child5'>
# <Node 'child6'>
# <Node 'child8'>
# <Node 'child9'>
# <Node 'child7'>
# <Node 'child10'>
```

**Hints：**

- 对象的精髓就在于**组合（composition）**与**对象构造（object construction）**。对象需要有组合成分构成，而且得以某种方式初始化。
- 这里也涉及到递归和生成器（generator）的使用。生成器是很棒的数据类型。你可以只通过构造一个很长的列表，然后打印列表的内容，就可以取得与`print_all_2`类似的功能。生成器还有一个好处，就是不用占据很多内存。
- 有一点还值得指出，就是`print_all_1`会以深度优先（depth-first）的方式遍历树(tree)，而`print_all_2`则是宽度优先（width-first）。有时候，一种遍历方式比另一种更合适。但这要看你的应用的具体情况。

#### 问题12:  垃圾回收机制

**问题：** 简要描述Python的垃圾回收机制（garbage collection）

**参考答案**

- Python在内存中存储了每个对象的**引用计数**（reference count）。如果计数值变成0，那么相应的对象就会消失，分配给该对象的内存就会释放出来另做他用。
- 偶尔也会出现**循环引用（reference cycle）**。垃圾回收器会定时寻找这个循环，并将其回收。举个例子，假设有两个对象`o1`和`o2`，而且符合`o1.x == o2`和`o2.x == o1`这两个条件。如果`o1`和`o2`没有其他代码引用，那么它们就不应该继续存在。但它们的引用计数都是1。
- Python中**使用了某些启发式算法(heuristics)来加速垃圾回收**。例如，越晚创建的对象更有可能被回收。对象被创建之后, 垃圾回收器会分配它们所属的代（generation）。每个对象都会被分配一个代，而被分配更年轻代的对象是优先被处理的。

#### 问题13：性能分析

将下面的函数按照执行效率高低排序。它们都接受由0至1之间的数字构成的列表作为输入。这个列表可以很长。一个输入列表的示例如下：`[random.random() for i in range(100000)]`。你如何证明自己的答案是正确的？

```python
def f1(lIn):
    l1 = sorted(lIn)
    l2 = [i for i in l1 if i<0.5]
    return [i*i for i in l2]

def f2(lIn):
    l1 = [i for i in lIn if i<0.5]
    l2 = sorted(l1)
    return [i*i for i in l2]

def f3(lIn):
    l1 = [i*i for i in lIn]
    l2 = sorted(l1)
    return [i for i in l1 if i<(0.5*0.5)]
```

**参考答案：**

按执行效率从高到低排列：`f2`、`f1`和`f3`。要证明这个**答案**是对的，你应该知道如何分析自己代码的性能。Python中有一个很好的程序分析包`cProfile`，可以满足这个需求。

```
import cProfile
lIn = [random.random() for i in range(100000)]
cProfile.run('f1(lIn)')
cProfile.run('f2(lIn)')
cProfile.run('f3(lIn)')
```

