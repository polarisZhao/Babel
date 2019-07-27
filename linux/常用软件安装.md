#### 1. OPENCV 编译安装

###### (1) 启动 cmake-gui

~~~shell
# cd opencv 
# mkdir build
cmake-gui
~~~

###### (2) 选择 source code 和 binaries 然后进行 configure

###### (3) 修改一些编译选项

- 配置 java/cuda/gtk/opencv-contrib等选项
- 安装 GtkGlExt

~~~shell
$ apt-cache search GtkGlExt
$ sudo apt-get install libgtkglextmm-x11-1.2-dev
$ sudo apt-get install libgtkglext1-dev 
$ sudo ldconfig
~~~

######  (4) 移动 code 文件

~~~shell
$ cd Video_Codec_SDK_9.0.20/include
$ sudo cp *.h /usr/local/cuda/include/
~~~

######  (5) 编译安装

~~~shell
$ sudo ldconfig
~~~

~~~shell
$ cd opencv/build/
$ make clean
$ make -j12
$ sudo make install
~~~


#### 2. install Sophus

```shell
 $ git clone https://github.com/strasdat/Sophus.git
 $ cd Sophus/
 
 $ mkdir build 
 $ cd build/
 
 $ cmake ..
 $ make
 $ sudo make install
```

#### 3. Eigen3

```shell
git clone https://github.com/eigenteam/eigen-git-mirror

# install 
cd eigen-git-mirror
mkdir build
cd build
cmake ..
sudo make install

#　incldue file locate: /usr/local/include/eigen3/
```

