#### 1. 基本文件与目录操作

`ls`        `-a` 列出全部文件(包括隐藏文件)      `-l`  列出长数据串，包含属性与权限等信息

`cd dir`  切换到指定目录 

`cd ..`  切换到上一级目录          `cd ~` 切换到自己的主文件夹       `cd - ` 切换到刚才目录

`pwd`     显示当前目录

`mkdir dirname`    创建新文件夹      

`rm file`    删除文件或者目录     `-r`  删除目录    `-f` 强制

`cp srcfile dstfile`   复制文件         `-r` 用于复制目录  

`mv srcfile dstfile`   将文件移动到指定目录，不使用 `-r` 即可移动目录，同一目录则为重命名

`tree .` 显示目录树     `-L`   指定显示最大层数

#### 2. 文件创建与查阅

`touch filename`     创建新文件   

`cat file`     正向查看文件全部内容     `tac file`    反向查看文件全部内容         `-n`带行号显示文件

`head -n file`  查看文件前n行      `tail -n file`  查看file的后n行

`less file`   按页查看文件

`[Page Down]`    下翻一页  ` [Page Up]`  上翻一页    `/`  向下查询   `?`  向上查询   `q` 退出

`more file` 按页查看文件 

`[Enter]`   向下一行    `[Space]`向下一页    `q`退出 /查询    `:f`   显示文件名和当前行数

#### 3. 文件搜索命令

`locate [filename]`    系统全局范围内定位文件,  从`/var.lib/mlocate`数据库中查找文件，但是该数据库每天更新一次，所以可以首先使用`sudo updatedb`更新一下数据库，才能查询最近的文件        

`whereis [commands]`    搜索命令位置(命令+帮助文档)   

`which`  搜索命令位置(命令+别名)

`find  [search_file]  [search_condition] `      搜索文件，应该避免大范围搜索

​                结合通配符使用： `*` 任意内容 `?` 任意一个字符 ` []`    任意一个[]内的内容 

`grep [search_string]  [search_file]`     `-v` 反向搜索  `-i` 忽略大小写

#### 4. 压缩与解压缩命令  

##### zip文件

`zip  压缩文件名.zip  源文件`     压缩zip文件   `zip -r 压缩文件名 源目录`  用来压缩目录

`unzip 压缩文件.zip`   解压

##### .tar.gz

`tar -zcvf file.tar.gz 源目录`  压缩      ` -c` 打包 `-v` 显示过程 `-f`指定打包后的文件名

`tar -zxvf file.tar.gz`    解压

##### .tar.bz2

`tar -jcvf file.tar.gz 源目录`   压缩     ` -c` 打包 `-v` 显示过程 `-f`指定打包后的文件名

`tar -jxcf file.tar.gz`   解压

#### 5. 系统信息   

##### 时间

`date`    显示当前时间和日期    `cal`   显示当月日历       `uptime`显示系统开机时间

##### 系统

`lsb_release -a`    查看linux 版本   `uname`  查看内核版本  `last` 查看登录信息

`whoami`   查看当前用户名

`lsof`  列出进程调用或者打开的文件信息

`vmstat [刷新延时  刷新次数]`  查看系统资源 

`w` 查看用户登录信息

##### 硬件

`cat /proc/cpuinfo`       查看CPU 信息  

`cat /proc/meminfo`      查看内存信息

`df`    显示磁盘占用情况    `-h` 按照人们常见的 KB,MB,GB 格式显示
`du`    显示目录空间占用情况    `-h` 按照人们常见的 KB,MB,GB 格式显示   `--max-depth`  指定显示目录深度

`nvidia-smi`    显示nvidia 显卡的运行情况

#### 6. 进程管理   

`ps`    显示当前活动进程  `aux`  以BSD系统格式显示  `le` 以linux标准格式显示

`top`    显示正在运行的进程  

`kill pid `   杀死进程id       `-9`  强制杀死

`killall 进程名`  按照进程名杀死进程    `pkill` 按照进程名杀死进程

`bg`     列出已停止或者后台的进程       `fg`    将最近的作业带到前台     `fg n`   将作业n带到前台 

`jobs`  显示后台进程

`[command] &`   把命令放入后台，并在后台执行     

`[commands][Enter];[ctrl] + z`  把命令放在后台，并暂停

#### 7. 文件权限与用户管理

##### 更改文件权限 ：

`chmod [u|g|o][+|-|=][r|w|x]   file|dir`    

`chmod octal file|dir`

u 用户    g  所属群组   o 其他      r=read(4)     w=write(2)      x=execute(1)

##### 用户管理

切换用户    `sudo su xxxx`     添加用户 `sudo adduser xxxx`     删除用户  `sudo userdel xxxx`

#### 8. 网络传输

`ipconfig`     查看与配置网络状态

`ssh [-P port] user@hostname `       以user用户身份连接到 hostname, 端口为 port

`wget file`       下载file          `-c` 表示断点续传 

`scp -r src/path   dst/path`      下载和上传文件或目录       `-P` 端口
`ping host`      探测指定IP或者域名的网络状况   `-c` 指定次数

`netstat`      查看网络状态 `-t` TCP 端口  `-u` UDP 协议端口   `-l` 在监听状态

#### 9. 安装卸载    xxxx

##### 源代码安装 

软件配置和检查： `./configure`    编译：  `make`      安装：    `make install  `    ​        

##### 二进制包安装 ： apt-get (ubuntu - deb package)

`apt-get install [package_name]`      使用 apt-get安装包

`apt-get remove [package_name]`    使用 apt-get卸载包

#### 10. 秘钥生成

`ssh-keygen -f key_name   -C "description"` 

#### 11. 常见的开关机命令

##### 关机命令

```Shutdown -h now ```        关机（保存当前正在运行的程序，相对安全）✨

其它： `halt`         `poweroff`        `init 0`

##### 重启命令

`shutdown -r now`      # 重启 (保存当前正在运行的程序，相对安全)  ✨

`reboot`         `init 6`

##### 退出登录：

`logout`      建议每次离开服务器的时候退出登录 ✨

#### 12.  窗口管理命令

##### 标签管理   

`[Ctrl] + [Shift]  + T`     新建一个ternimal 标签 

`[Ctrl] + [Shift] + W`      关闭 terminal 标签 

`Ctrl + PD / Ctrl + PU`     切换 terminal 标签页 

`Alt+n`     切换到标签页n 

##### 窗口管理

`Ctrl + Shift + N`    新建terminal窗口

`Ctrl + shift + Q`     关闭 terminal 窗口  

 `Alt + Tab`    在窗口之间切换

`F11` 窗口全屏(   `exit` 退出)

#### 13. 其它

常见的热键： `Ctrl + c` 停止当前命令     `Ctrl + d`  注销当前会话     `[Ctrl]+z`  结束交互  

​                        `[↑]`  重复上一条命令         `[Tab]` 命令补齐/文件补齐

帮助命令：    `man command`     or     `[command] --help ` 

查看历史记录： `history`   

标准输出重定向(覆盖)  `> `     标准错误输出重定向(覆盖)   `2>`

标准输出重定向(追加)   `>>`   标准错误输出重定向(追加)   `2>>`

将正确输出追加到file1，错误输出追加到file2     `[command] >> file1 2>> file2` 

多命令顺序执行:     无关联   ` ;`        与  `&&`        或  `||`

将命令1的正确输出作为命令2 的输入   `|`  



参考资料：

1. [Linux Command cheatsheet](https://fosswire.com/post/2007/08/unixlinux-command-cheat-sheet/)

2. <http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/index.html>

3. <https://github.com/chassing/linux-sysadmin-interview-questions>

4. <http://www.imooc.com/course/programdetail/pid/45>

5. <http://billie66.github.io/TLCL/book/>