## gcc/g++ &makefile 基本用法

**gcc/g++流程**: **预处理**　－>  **编译**　－>　**汇编**　－>  **链接**

目录选项
**-L[dir]**     　指定搜索目录

默认会在`/lib`和`/usr/lib`和`/usr/local/lib`三个目录进行搜索

👉  动态添加方法　　　`pkg-config [pkg_name] —libs`

**-l[libname]**             指定程序要链接的库，-l参数紧接着就是库名

例如： 库名是`m`，　库文件名　`libm.so`　 链接　`-lm`

###### 头文件设置

**-I**            指定头文件目录

`/usr/include`目录一般是不用指定的，gcc知道去那里找，但是如果头文件不在 `/usr/icnclude` 里我们就要用-I参数指定了，比如头文件放在 `/myinclude`目录里，那编译命令行就要加上    `-I /myinclude`

**--include [lib]**      用来包含头文件

一般情况下包含头文件都在源码里用`＃include xxxxxx`实现， `--include`  参数很少用。

###### 连接器选项

**-share**        共享库:尽量使用动态库
**-static** 　   静态库: 禁止使用动态库

###### 警告选项

**-w**                   禁止所有警告信息
**-Wall**             开启大部分警告提示
**-Werror**        视警告为错误

###### 指定优化级别

包含`-O1`/`-O2`  和`-O3`等级别，推荐使用`-O3`　进行优化

###### 生成位置无关目标码

**-fpic**               适用于共享库
**-fPIC**　          适用于动态链接库

###### 语言选项

**-ansi** #　支持符合ＡＮＳＩ标准的Ｃ程序
**-std=c99** # c99标准
**-std=C++11**  #　支持　c++11　标准  <-

###### 常见环境变量

**PKG_CONFIG_PATH**：用来指定pkg-config用到的pc文件的路径，默认是/usr/lib/pkgconfig，pc文件是文本文件，扩展名是.pc，里面定义开发包的安装路径，Libs参数和Cflags参数等等。
**CC**：用来指定c编译器。
**CXX**：用来指定cxx编译器。
**LIBS**：跟上面的--libs作用差不多。
**CFLAGS**:跟上面的--cflags作用差不多。
**CC，CXX，LIBS，CFLAGS** 手动编译时一般用不上，在做configure时有时用到，一般情况下不用管。
环境变量设定方法：**export  ENV_NAME=xxx**



###### makefile 基本格式 

~~~cmake
# 指定编译器

# 设置编译选项
# 库 & 头文件

# 变量设置

# 语句：
# 编译目标：依赖文件
#     运行脚本

# 清理脚本
~~~



makefile 模板

~~~~~~makefile
CC = g++ 

CFLAGS += -g -O3 -Wall
INC += -I. `pkg-config --cflags opencv`　
LIBS += `pkg-config --libs opencv`　　

TARGET = main.bin
OBJS += main.o \
        config.o 

all:$(TARGET)
$(TARGET):$(OBJS)
    $(CC) $(INC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LIBS)
$(OBJS):%.o:%.cpp
    $(CC) $(INC) $(CFLAGS) -c $< -o $@

.PHONY:clean
clean:　
    rm -r *.o $(TARGET)
~~~~~~

