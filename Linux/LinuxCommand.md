#### 1. 基本文件与目录操作

`ls`     列出目录 /  `-a` 列出全部文件(包括隐藏文件)     `-l`  列出长数据串，包含属性与权限等信息

`cd dir`  切换到指定目录 `cd ..`  切换到上一级目录   `cd ~` 切换到自己的主文件夹 `cd - ` 切换到刚才目录

`pwd`   显示当前目录

`mkdir dirname`    创建新文件夹         `touch filename`   创建新文件

`rm 文件`    删除文件或者目录  /  `-r`  删除目录  `-f` 强制

`cp 源文件 目标文件`   复制文件 / `-r` 用于复制目录  

`mv 源文件 目标文件`   移动文件， 将文件移动到知道目录，不使用 `-r` 即可移动目录  同一目录则为重命名

#### 2. 压缩与解压缩命令

##### zip文件

`zip 压缩文件名.zip  源文件`     压缩zip文件   `zip -r 压缩文件名 源目录`  用来压缩目录

`unzip 压缩文件.zip`   解压缩 .zip 文件

##### .tar.gz

`tar -zcvf file.tar.gz 源目录`   将文件压缩为 .tar.gz 格式/ ` -c` 打包 `-v` 显示过程 `-f`指定打包后的文件名

`tar -zxvf file.tar.gz`    将.tar.gz 文件解压缩

##### .tar.bz2

`tar -jcvf file.tar.gz 源目录`    将文件压缩为 .tar.bz2 格式 /  ` -c` 打包 `-v` 显示过程 `-f`指定打包后的文件名

`tar -jxcf file.tar.gz`   将 .tar.gz 文件解压缩

#### 3. 系统信息

`date`    显示当前时间和日期    `cal`   显示当月日历      `whoami`   查看当前用户名   `uptime`显示系统开机时间

`lsb_release -a`    查看linux 版本

`df`   # 显示磁盘占用情况  /  `-h` 按照人们常见的 KB,MB,GB 格式显示
`du`  # 显示目录空间占用情况  /  `-h` 按照人们常见的 KB,MB,GB 格式显示   `--max-depth`  指定显示目录深度

`cat /proc/cpuinfo`   # 查看CPU 信息    `cat /proc/meminfo`    #  查看内存信息

`nvidia-smi` 显示nvidia 显卡的运行情况

#### 4. 进程管理

`ps`      显示当前活动进程     `top`    显示正在运行的进程      `kill pid `   杀死进程id  / `-9`  强制杀死 

`bg` 列出已停止或者后台的左右    `fg` 将最近的作业带到前台     `fg n` 将作业n 带到前台 

#### 5. 文件权限与系统路径

  更改文件权限 ：1. `chmod   [u|g|o][+|-|=][r|w|x]   file|dir`    2. `chmod octal file|dir`

​                                  u 用户   g  所属群组  o 其他   r=read(4)    w=write(2)     x=execute(1)

 将指定路径到系统路径(一次性)： `export PATH=$PATH:/path/to/dir `  

将指定路径到系统路径(长期)：

~~~shell
vim ~/.bashrc
export PATH=$PATH:/path/to/dir
source ~/.bashrc
~~~

#### 6. 网络传输

`ssh [-P port] user@hostname `       以user 用户身份连接到 hostname, 端口为 port

`wget file`     下载file / `-c` 表示断点续传 

`scp -r src/path dst/path`      下载和上传文件或目录 / `-P` 端口
`ping host`       ping host 并输出结果

#### 7. 安装卸载

从源代码安装：`./configure`         `make`             `make install  `    

`yum`            `dpkg -i pkg.deb`  安装包 Debian              `rpm -Uvh pkg.rpm` 安装包 RPM

#### 8. 文件创建与查阅

`touch file`  创建 file 文件

 `cat file`   从首行开始正向查看文件全部内容`tac file1` 从尾行开始反向查看文件全部内容

`more file` 按页查看文件  Enter 向下滚动一行  Space 向下翻一页   q 退出    / 查询   :f 显示文件名和当前行数

`less file1` 类似 'more' ,但是可以向上 Page Down下翻一页  Page Up 上翻一页   / 向下查询   ? 向上查询 q 退出

`head -n file1` 查看file1的前n行      `tail -n file1` 查看file的后n行

#### 9. 秘钥生成

~~~shell
ssh-keygen -f test   -C "test key" 
            ~~文件名   ~~ 备注
~~~

#### 10. 常见的开关机命令

##### 关机命令

```Shutdown -h now ```        关机（保存当前正在运行的程序，相对安全）✨

其它： `halt`         `poweroff`        `init 0`

##### 重启命令

`shutdown -r now`      # 重启 (保存当前正在运行的程序，相对安全)  ✨

`reboot`         `init 6`

##### 退出登录：

`logout`      建议每次离开服务器的时候退出登录 ✨

#### 11. 其它

`Ctrl + C` 停止当前命令     `Ctrl + D`  注销当前会话

`history` 查看历史记录    `[↑]`  重复上一条命令         `[Tab]` 命令补齐/文件补齐

`man command`  帮助命令

`ln -s 源文件 目标文件 `   设置软链接



相关资料： [Linux Command cheatsheet](https://fosswire.com/post/2007/08/unixlinux-command-cheat-sheet/)
