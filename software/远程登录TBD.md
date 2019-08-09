### 1. 局域网 登录访问

(1) 查看 B 机器的 内网地址

~~~shell
$ ifconfig
enp2s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.31.241  netmask 255.255.255.0  broadcast 192.168.31.255
        inet6 fe80::a66d:76c7:cf39:b2fe  prefixlen 64  scopeid 0x20<link>
        ether 30:9c:23:cd:b4:7a  txqueuelen 1000  (Ethernet)
        RX packets 288490  bytes 186743020 (186.7 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 86424  bytes 8618827 (8.6 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 13364  bytes 952887 (952.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 13364  bytes 952887 (952.8 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
~~~

（2）使用 A机器 登录到B 电脑

~~~shell
ssh username@ 192.168.31.241
# 输入用户名即可
~~~

### 2. 内网穿透登录

##### (1) 服务器端配置：

- 下载 frp

~~~shell
wget https://github.com/fatedier/frp/releases/download/v0.22.0/frp_0.22.0_linux_amd64.tar.gz
tar -zxvf frp_0.22.0_linux_amd64.tar.gz # 下载 frp
rm -rf frp_0.22.0_linux_amd64.tar.gz  # 解压
mv frp_0.22.0_linux_amd64 frp # 修改名称
cd frp  # 进入目录
rm -rf frpc*  # 删除相关文件
~~~

- 修改 frps.ini 文件为如下格式， 如果没有必要，端口均可使用默认值，token、user和password项请自行设置。

~~~
[common]
bind_port = 7000
dashboard_port = 7500
token = 12345678
dashboard_user = admin
dashboard_pwd = admin
vhost_http_port = 10080
vhost_https_port = 10443
~~~

- 启动服务器端程序

~~~
nohup ./frps -c frps.ini &
#　ctrl + C 强制关闭　nohup, 然后使用　jobs 查看后台进程，　如果显示
# [1]+  Running                 nohup ./frps -c frps.ini &
#　则证明　OK 
~~~

现在输入公网的  http://xxx.xxx.xxx.xxx:7500/， 登录之后可以进入如下页面。

##### (2)　客户端配置

