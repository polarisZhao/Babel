

##### 1. 下载镜像并制作启动U盘

​    参考链接：https://www.ubuntu.com/download/desktop

##### 2. 安装ubuntu 系统

##### 3. 最基本的工作

- 联网

- 切换镜像站(阿里源)

  ~~~shell
  # Software & Updates > Ubuntu Software > Download from 
  # > Other … > China > Mirrors.aliyun.com
  $ sudo apt-get update
  $ sudo apt-get upgrade
  ~~~

##### 4. uninstall software

~~~shell
sudo apt-get remove libreoffice-common # delete libreoffice
sudo apt-get remove unity-webapps-common  # delete Amazon
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku landscape-client-ui-install   # delete software useless
sudo apt-get remove onboard deja-dup 
~~~

##### 5.  build-tools

~~~shell
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler --fix-missing
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install libopenblas-dev liblapack-dev libatlas-base-dev
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt-get install git cmake build-essential
~~~

##### 6. tools

~~~shell
sudo apt-get install vim
sudo apt-get install zsh
sudo apt-get install tree
sudo apt-get install htop
sudo apt-get install byobu
~~~

##### 7. hosts 

~~~shell
cd /etc
mv hosts hosts.bak
sudo cp ~/Desktop/ubuntu-installs/hosts /etc/hosts
~~~

重新启动网络即可

##### 8. install shadowsocks-qt

~~~
...
~~~

##### 9. chromium & chrome

~~~shell
# chromium
sudo apt-get install chromium-browser

# download google chrome deb packgae
sudo dpkg -i google-chrome-stable_current_amd64.deb
~~~

##### 10. install WPS

~~~shell
wget http://kdl.cc.ksosoft.com/wps-community/download/6634/wps-office_10.1.0.6634_amd64.deb
sudo dpkg -i wps-office_10.1.0.6634_amd64.deb
~~~

##### 11.  install sublime text 3 & vscode

~~~shell
# sublime text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt install snapd && sudo snap install sublime-text --classic

# vs code
wget https://vscode.cdn.azure.cn/stable/a622c65b2c713c890fcf4fbf07cf34049d5fe758/code_1.34.0-1557957934_amd64.deb
sudo dpkg -i code_1.34.0-1557957934_amd64.deb
~~~

##### 12. vlc

~~~shell
sudo snap install vlc
~~~

##### 13. calibre

~~~shell
sudo apt-get install calibre
~~~

##### 14. okular

~~~shell
sudo apt-get install okular
~~~

##### 15. Xmind Zen

~~~
wget http://dl2.xmind.cn/XMind-ZEN-for-Linux-64bit.deb
sudo dpkg -i XMind-ZEN-for-Linux-64bit.deb 
sudo apt  --fix-broken install
sudo dpkg -i XMind-ZEN-for-Linux-64bit.deb 
~~~

##### 16. 搜狗输入法

~~~shell
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb
sudo dpkg -i sogoupinyin_2.2.0.0108_amd64.deb

# 设置
# (1)settings > Region & Language > Input Sources > + > add Chinese > 
# > Manage Installed Language > 安装语言包 
# > Keyboard input method system > fcitx > Close
# (2)重启
# (3) 单击菜单栏[键盘] > Configure > 去掉 Only show Current Language > Sougou Pinyin
~~~

##### 17. netease music

~~~shell
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
sudo dpkg -i netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
~~~

##### 18. Typora

~~~shell
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
# install typora
~~~

##### 19. anaconda

~~~shell
# download Anaconda
$ bash Anaconda3-2019.03-Linux-x86_64.sh 
  Do you approve the license terms? [yes|no]
  >>> yes
  Anaconda3 will now be installed into this location:
  /home/ubuntu/anaconda3
    
  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below  
  [/home/ubuntu/anaconda3] >>>
  Do you wish the installer to prepend the Anaconda3 install location
  to PATH in your /home/ubuntu/.bashrc ? [yes|no]
  >>> yes
$ source ~/.bashrc
~~~

##### 20. CUDA & cudnn

~~~shell
$ CUDA Drivers
# 按 Ctrl + Alt 进入 命令行界面

# 卸载以前安装的驱动
$ sudo apt-get remove –purge nvidia*

# 禁用nouveau
# 编辑 /etc/modprobe.d/blacklist.conf 文件， 在其中添加一行   blacklist nouveau 
$ sudo update-initramfs -u # 执行生效
$ sudo reboot # 重启

# 停止 可视化桌面
$ sudo telinit 3

# 更改权限
$ sudo chmod a+x NVIDIA-Linux-x86_64-430.14.run

# 安装
$ sudo sh ./NVIDIA-Linux-x86_64-430.14.run –no-opengl-files
~~~

~~~shell
# download CUDA   https://developer.nvidia.com/cuda-downloads
$ chmod a+x cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb 
$ sudo dpkg -i ./cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb 
$ sudo apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub
$ sudo apt-get update
$ sudo apt-get install cuda-10-1 -y
~~~

~~~shell
# download cuda from https://developer.nvidia.com/cudnn

$ sudo cp cuda/include/cudnn.h /usr/local/cuda/include
$ sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
$ sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
~~~

~~~shell
# add to ~/.bashrc
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
~~~

~~~shell
$ cat /usr/local/cuda/version.txt
$ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
~~~

##### 21. 如何使用豆瓣镜像站

~~~shell
Solution: 在指定位置 $HOME/.pip处，建立如下内容的pip.conf文件即可：
[global]
timeout = 60
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
~~~

##### 22. gimp

```shell
sudo apt-get install gimp
```

##### 23. draw

```shell
# https://about.draw.io/integrations/>   拉到底端， 下载 deb 包
dpkg -i draw.io-amd64-10.7.7.deb
```










