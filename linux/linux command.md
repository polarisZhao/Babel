#### 1. 基本文件与目录操作

~~~shell
ls    # 列出文件   [-a] 列出全部文件(包括隐藏文件)      [-l]  列出长数据串，包含属性与权限等信息
      # 查看当前文件下的目录个数  find ./ | wc -l
cd dir  # 切换到指定目录 
cd ..   # 切换到上一级目录          
cd ~    # 切换到自己的主文件夹       
cd -    # 切换到刚才目录

pwd    # 显示当前目录
mkdir [dirname]    # 创建新文件夹      
rm [file]  #  删除文件或者目录     [-r]  删除目录    [-f] 强制
cp [srcfile] [dstfile]   # 复制文件         [-r] 用于复制目录  
mv [srcfile] [dstfile]   # 将文件移动到指定目录，不使用 [-r] 即可移动目录，同一目录则为重命名

tree . # 显示目录树     -L   指定显示最大层数  sudo apt-get install tree
~~~

#### 2. 文件创建与查阅

~~~shell
touch filename #  创建新文件   
cat file    # 正向查看文件全部内容     
tac file    # 反向查看文件全部内容    [-n] 带行号显示文件
head -n file  # 查看文件前n行      
tail -n file  # 查看file的后n行
less file   # 按页查看文件
[Page Down]    下翻一页  [Page Up]  上翻一页    /  向下查询   ?  向上查询   q 退出
more file  # 按页查看文件 
[Enter]   向下一行    [Space]向下一页    q退出 /查询    :f   显示文件名和当前行数
~~~

#### 3. 搜索命令

~~~shell
locate [filename]    # 系统全局范围内定位文件,  从/var.lib/mlocate数据库中查找文件，
                     # 但是该数据库每天更新一次，所以可以首先使用sudo updatedb更新一下数据库，
                     # 才能查询最近的文件        

whereis [commands]    搜索命令位置(命令+帮助文档)   
which  搜索命令位置(命令+别名)

find  [search_file]  [search_condition]      搜索文件，应该避免大范围搜索
# 结合通配符使用： * 任意内容 ? 任意一个字符 []    任意一个[]内的内容 
grep [search_string]  [search_file]     -v 反向搜索  -i 忽略大小写
~~~

#### 4. 磁盘与压缩/解压缩命令 [F]

##### (1) 查看磁盘空间

```shell
du -h --max-depth=1 #　显示当前目录磁盘占用, --max-depth=1 显示级别
df -h  # 检查linux服务器的文件系统的磁盘空间占用情况
# -h 以人们较易读的容量格式 (G/M) 显示
```

##### (2) 压缩与解压缩

~~~shell
# .zip
zip  压缩文件名.zip  源文件   # 压缩 zip 文件  [-r] 压缩目录
unzip 压缩文件.zip   # 解压

# .tar.gz
tar -zcvf file.tar.gz 源目录  压缩  [-c] 打包  [-v] 显示过程 [-f] 指定打包后的文件名
tar -zxvf file.tar.gz    解压

# .tar.bz2
tar -jcvf file.tar.gz 源目录   压缩  [-c] 打包  [-v] 显示过程 [-f] 指定打包后的文件名
tar -jxcf file.tar.gz   解压
~~~

#### 5. 系统信息   

##### 时间

~~~shell
date   #  显示当前时间和日期    
cal   # 显示当月日历       
uptime  # 显示系统开机时间
~~~

##### 系统

~~~shell
lsb_release [-a]    # 查看linux 版本   
uname   [-a]  # 查看内核版本  
last # 查看登录信息

whoami   # 查看当前用户名
lsof  # 列出进程调用或者打开的文件信息
vmstat [刷新延时  刷新次数]  # 查看系统资源 
w # 查看用户登录信息
~~~

##### 硬件

~~~shell
cat /proc/cpuinfo     #  查看CPU 信息  
cat /proc/meminfo     # 查看内存信息
df   # 显示磁盘占用情况    [-h] 按照人们常见的 KB,MB,GB 格式显示
du   # 显示目录空间占用情况    [-h] 按照人们常见的 KB,MB,GB 格式显示   [--max-depth]  指定显示目录深度
nvidia-smi  #  显示nvidia 显卡的运行情况
~~~

#### 6. 进程管理

~~~shell
ps    # 显示当前活动进程   [aux]  以BSD系统格式显示  [-ef] 以linux标准格式显示
top    # 显示正在运行的进程  

kill pid   # 杀死进程id  [-9]  强制杀死
killall [进程名]  # 按照进程名杀死进程    
pkill [进程名]  # 按照进程名杀死进程
kill %[job num]  # 按照工作号杀死进程

bg     # 列出已停止或者后台的进程       
fg     # 将最近的作业带到前台   
fg  n  # 将作业n带到前台 

[command] &  #  把命令放入后台，并在后台执行  
jobs  # 显示后台进程
[command];[Enter];[ctrl] + z  # 把命令放在后台，并暂停
~~~

#### 7. 文件权限与用户管理  [F]

##### (1) 更改文件权限 ：

~~~shell
chmod [u|g|o][+|-|=][r|w|x]   file|dir    
chmod octal file|dir
# u 用户    g  所属群组   o 其他      r=read(4)     w=write(2)      x=execute(1)
~~~

##### (2) 用户和用户组管理

```shell
# user
useradd -m username   # 新建用户   [-m] 建立用户家目录
passwd username       # 为新建用户设置密码
su [username]         # 切换用户， 缺省则为 root 用户
userdel -r username   # 删除用户  [-r] 删除用户家目录

more /etc/passwd  # 查看所用用户及其权限
```

~~~shell
# groups
groups                           # 查看用户所属于的组
usermod -G groupNmame username   # 将用户加入到组
usermod -g groupName username    # 变更用户所属的根组

more /etc/group  # 查看所有用户组及其权限
~~~

~~~shell
chown username dirOrFile  # 更改文件的拥有者   -R 文件夹
~~~

##### (3) 环境变量

~~~shell
# bashrc与profile都用于保存用户的环境信息
# profile只能在登入的时候执行一次；
# bashrc 在每次执行 source 时都会使用它一次
source ~/.bashrc
~~~

#### 8. 网络传输 [F]

~~~shell
netstat         # 查看网络状态 -t TCP 端口  -u UDP 协议端口   -l 在监听状态  -a 所有端口
lsof -i:[Port]  # 列出端口占用情况

ipconfig        # 查看与配置网络状态
route -n        # 查看路由状态
traceroute IP    # 探测前往IP的路由路径

ssh [-P port] user@hostname    # 以user用户身份连接到 hostname, 端口为 port

wget file  # 下载file          -c 表示断点续传  -o 指定日志文件
scp  -r  src/path   dst/path     #  下载和上传文件或目录   -P 端口

host domain # domain -> IP
host IP # IP -> domain
ping host    #   探测指定IP或者域名的网络状况   -c 指定次数 
~~~

#### 9. 安装卸载   

##### 源代码安装 

~~~shell
./configure # 软件配置和检查
make # 编译
make install   # 安装       
~~~

##### 二进制包安装 ： apt-get (ubuntu - deb package)

~~~shell
apt-get install [package_name]      使用 apt-get安装包
apt-get remove [package_name]    使用 apt-get卸载包
~~~

##### 秘钥生成

~~~shell
ssh-keygen -f key_name   -C "description" 
~~~

#### 11. 常见的开关机命令

##### 关机命令

~~~shell
shutdown -h now   # 关机（保存当前正在运行的程序，相对安全）✨
# 其它： 
halt         
poweroff        
init 0
~~~

##### 重启命令

~~~shell
shutdown -h now      # 重启 (保存当前正在运行的程序，相对安全)  ✨
reboot
init 6
~~~

##### 退出登录：

~~~shell
logout  # 建议每次离开服务器的时候退出登录 ✨
~~~

#### 12.  窗口管理命令

##### 标签管理   

~~~shell
[Ctrl] + [Shift]  + T   #  新建一个ternimal 标签 
[Ctrl] + [Shift] + W    #  关闭 terminal 标签 
Ctrl + PD / Ctrl + PU   #  切换 terminal 标签页 
Alt+n   #   切换到标签页n 
~~~

##### 窗口管理

~~~shell
Ctrl + Shift + N    # 新建terminal窗口
Ctrl + shift + Q     # 关闭 terminal 窗口  
Alt + Tab    # 在窗口之间切换
F11    # 窗口全屏(exit 退出)
~~~

#### 13. 其它

##### (1) 常见的热键

~~~shell
[Ctrl] + c  # 停止当前命令     
[Ctrl] + d  # 注销当前会话     
[Ctrl]+z   # 结束交互  
[↑]         # 重复上一条命令         
[Tab]       # 命令补齐/文件补齐
~~~

##### (2) 帮助命令：    

~~~shell
man [cmd]  # 查询命令command的说明文档   [n]  指定分类  -k 关键字
[command] --help 
info [cmd]

whatis [cmd] # 简要说明命令的作用
which [cmd] # 查看程序的binary文件所在路径
whereis [cmd] # 查看程序的搜索路径

sudo ldconfig
source 
history  # 查看历史记录
~~~

##### 其他

~~~shell
# 重定向
>   # 标准输出重定向(覆盖)  
2>  # 标准错误输出重定向(覆盖)   
>>  # 标准输出重定向(追加) 
2>> # 标准错误输出重定向(追加) 
[command] >> [file1] 2>> [file2] # 将正确输出追加到file1，错误输出追加到file2

# 多命令顺序执行:     
;  # 无关联顺序执行   ;        与  &&        或  ||
&& # 与
||  # 或

|   # 将命令1的正确输出作为命令2 的输入     
~~~

通用的参数

~~~shell
-a  # 所有 all    
-l  # 长格式 long
-r  # 递归  recursive
-h  # 人类可读 human
-t  # 类型 type
~~~

#### 问题1： 如何挂载磁盘

（１） 找到未分配的磁盘，　这里是　`/dev/sdb`

```shell
$ sudo fdisk -l  # 找到未分配的磁盘
Disk /dev/sdb: 1.8 TiB, 2000398934016 bytes, 3907029168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0x76738fb3
```

（２）对该磁盘使用fdisk 命令建立分区:

```shell
sudo fdisk /dev/sdb
# m -> n -> 一路回车　－> w(保存退出)
$ sudo fdisk -l #　此时可以发现设备
Device     Boot Start        End    Sectors  Size Id Type
/dev/sdb1        2048 3907029167 3907027120  1.8T 83 Linux
```

（３）格式化分区，　并建立文件系统

```shell
$ sudo mkfs -t ext4 /dev/sdb1  # -t　指定文件系统格式
```

（４）挂载磁盘到指定位置

```shell
$ mount /dev/sdb1 /home/data/
# 区分 sdb和sdb1, sdb表示磁盘，　sdb1则表示该磁盘上的分区
```

#### 问题2： 如何查询端口所运行的程序

~~~shell
$ sudo netstat -antp | grep 7000
tcp6       0      0 :::7000                 :::*                    LISTEN      12464/frps      
$ ps 12464
  PID TTY      STAT   TIME COMMAND
12464 pts/0    Sl     0:00 ./frps

$ lsof -i:7000   # lsof:list open files -> -i 
COMMAND   PID   USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
frps    12464 ubuntu    3u  IPv6 7542760      0t0  TCP *:afs3-fileserver (LISTEN)
$ ps -fe | grep 12464
ubuntu   12464  6446  0 00:29 pts/0    00:00:00 ./frps
ubuntu   12707  6446  0 00:32 pts/0    00:00:00 grep --color=auto 12464
~~~

参考资料：

1. [Linux Command cheatsheet](https://fosswire.com/post/2007/08/unixlinux-command-cheat-sheet/)

2. <http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/index.html>

3. <https://github.com/chassing/linux-sysadmin-interview-questions>

4. <http://www.imooc.com/course/programdetail/pid/45>

5. <http://billie66.github.io/TLCL/book/>