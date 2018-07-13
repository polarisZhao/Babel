#### 实例项目：

~~~shell
$ cd project1  # use project2/project3 instead of project1
$ cd build
$ cmake ..
$ make
$ ./hello 
Hello World.
~~~

- **project 1:**  使用cmake 编译项目
- **project 2:** 使用动态链接库
- **project 3：** 将src和include 分别放到不同的文件夹下



#### Cmake常见问题

#####1. **Question** : **make: Nothing to be done for \`all\` Solution**

这句提示是说明你已经编译好了，而且没有对代码进行任何改动。若想重新编译，可以先删除以前编译产生的目标文件，然后使用 make clean，然后再使用 make。

#####2. Question: 如何优化编译选项：

​    Debug通常称为调试版本，它包含调试信息，并且不作任何优化，便于程序员调试程序。Release 称为发布版本，它往往是进行了各种优化，使得程序在代码大小和运行速度上都是最优的，以便用户很好地使用。

- 在CMakeLists.txt下加入

```cmake
SET(CMAKE_BUILD_TYPE "Release")
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")
```

- 在CMakeLists.txt下加入

~~~cmake
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
    message(STATUS "CMAKE_BUILD_TYPE = Debug")
else()
    set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")
    message(STATUS "CMAKE_BUILD_TYPE = Release")
endif()
# cmake -DCMAKE_BUILD_TYPE=Debug/Release ..
~~~

CMake中有一个变量 CMAKE_BUILD_TYPE ,可以的取值是None、Debug、Release、RelWithDebInfo和MinSizeRel。当这个变量值为Debug的时候,CMake会使用变量 CMAKE_CXX_FLAGS_DEBUG 和 CMAKE_C_FLAGS_DEBUG 中的字符串作为编译选项生成 Makefile;

| CMAKE_BUILD_TYPE | 对应的c编译选项变量          | 对应的c++编译选项变量          |
| ---------------- | ---------------------------- | ------------------------------ |
| None             | CMAKE_C_FLAGS                | CMAKE_CXX_FLAGS                |
| Debug            | CMAKE_C_FLAGS_DEBUG          | CMAKE_CXX_FLAGS_DEBUG          |
| Release          | CMAKE_C_FLAGS_RELEASE        | CMAKE_CXX_FLAGS_RELEASE        |
| RelWithDebInfo   | CMAKE_C_FLAGS_RELWITHDEBINFO | CMAKE_CXX_FLAGS_RELWITHDEBINFO |
| MinSizeRel       | CMAKE_C_FLAGS_MINSIZEREL     | CMAKE_CXX_FLAGS_MINSIZEREL     |

​    如果将优化程度调到最高需要设置-O3，最低的是-O0即不做优化，添加调试信息的参数是-g  -ggdb，如果不添加这个参数，调试信息就不会被包含在生成的二进制中。

1. -O，-O1 这两个命令的效果是一样的，目的都是在不影响编译速度的前提下，尽量采用一些优化算法降低代码大小和可执行代码的运行速度。 
2. -O2 该优化选项会牺牲部分编译速度，除了执行-O1所执行的所有优化之外，还会采用几乎所有的目标配置支持的优化算法，用以提高目标代码的运行速度。 
3. -O3 该选项除了执行-O2所有的优化选项之外，一般都是采取很多向量化算法，提高代码的并行执行程度，利用现代CPU中的流水线，Cache等。这个选项会提高执行代码的大小，当然会降低目标代码的执行时间。
4. -Os 这个优化标识和-O3有异曲同工之妙，当然两者的目标不一样，-O3的目标是宁愿增加目标代码的大小，也要拼命的提高运行速度，但是这个选项是在-O2的基础之上，尽量的降低目标代码的大小，这对于存储容量很小的设备来说非常重要。为了降低目标代码大小，会禁用下列优化选项，一般就是压缩内存中的对齐空白(alignment padding)
5. -Ofast 该选项将不会严格遵循语言标准，除了启用所有的-O3优化选项之外，也会针对某些语言启用部分优化。如：-ffast-math ，对于Fortran语言，还会启用下列选项： 6.-Og: 该标识会精心挑选部分与-g选项不冲突的优化选项，当然就能提供合理的优化水平，同时产生较好的可调试信息和对语言标准的遵循程度。

##### 3. gcc/make/cmake 的联系与区别

​    gcc是GNU Compiler Collection（就是GNU编译器套件），也可以简单认为是编译器，它可以编译很多种编程语言（括C、C++、Objective-C、Fortran、Java等等）。当你的程序只有一个源文件时，直接就可以用gcc命令编译它。但是当你的程序包含很多个源文件时，用gcc命令逐个去编译时，你就很容易混乱而且工作量大。这时可以使用make 工具，make工具可以看成是一个智能的批处理工具，它本身并没有编译和链接的功能，而是用类似于批处理的方式—通过调用makefile文件中用户指定的命令来进行编译和链接的。简单的说就像一首歌的乐谱，make工具就像指挥家，指挥家根据乐谱指挥整个乐团怎么样演奏，make工具就根据makefile中的命令进行编译和链接的。makefile命令中就包含了调用gcc（也可以是别的编译器）去编译某个源文件的命令。

​    makefile在一些简单的工程完全可以人工手写，但是当工程非常大的时候，手写makefile也是非常麻烦的，如果换了个平台makefile又要重新修改。这时候就出现了Cmake这个工具，cmake就可以更加简单的生成makefile文件给上面那个make用。当然cmake还有其他功能，就是可以跨平台生成对应平台能用的makefile，你不用再自己去修改了。可是cmake根据什么生成makefile呢？它又要根据一个叫CMakeLists.txt文件（学名：组态档）去生成makefile。到最后CMakeLists.txt文件谁写啊？亲，是你自己手写的。三者的关系可以如下面的简图所示：

![p4107](../src/p4107.png)