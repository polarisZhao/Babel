### NVIDIA 常见命令

###### nvidia-smi

在进行深度学习实验时，GPU 的实时状态监测十分有必要。今天详细解读一下 `nvidia-smi` 命令。

~~~shell
Fri Aug  2 10:10:08 2019       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 410.48                 Driver Version: 410.48                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce RTX 208...  Off  | 00000000:01:00.0  On |                  N/A |
| 31%   43C    P8    12W / 250W |    223MiB / 10981MiB |      4%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0      1614      G   /usr/lib/xorg/Xorg                            14MiB |
|    0      4804      G   /usr/lib/xorg/Xorg                           207MiB |
+-----------------------------------------------------------------------------+

~~~

上图是服务器上 GeForce GTX 1080 Ti 的信息，下面一一解读参数。 上面的表格中的信息与下面的四个框的信息是一一对应的：

**GPU**：GPU 编号；            **Name**：GPU 型号；  **Persistence-M**：持续模式的状态。
**Fan**：风扇转速(0~100%)  **Temp**：温度(摄氏度)  **Perf**：性能状态，从P0(小)到P12(大)　**Pwr:Usage/Cap**：能耗

**Bus-Id**：GPU总线　　　　**Disp.A**：Display Active，表示GPU的显示是否初始化；
**Memory Usage**：显存使用率； 

**Volatile GPU-Util**：浮动的GPU利用率　　　**Uncorr. ECC**：Error Correcting Code，错误检查与纠正
**Compute M**：compute mode，计算模式。

**下方的 Processes 表示每个进程对 GPU 的显存使用率**

###### nvidia-smi -L

第二个命令：`nvidia-smi -L `, 该命令用于列出所有可用的 NVIDIA 设备信息。

###### watch -n1 nvidia-smi

每1秒检查一次GPU的使用情况

###### 查看CUDA　和 cudnn　版本信息

查看 CUDA 版本：

```shell
$ cat /usr/local/cuda/version.txt
CUDA Version 10.0.130
```

也可以使用如下命令:

~~~shell
nvcc --version
~~~

查看 CUDNN 版本：

```shell
$ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
rep CUDNN_MAJOR -A 2
#define CUDNN_MAJOR 7
#define CUDNN_MINOR 5
#define CUDNN_PATCHLEVEL 0
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
```

