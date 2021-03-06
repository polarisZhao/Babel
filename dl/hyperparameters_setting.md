## 超参数设定和网络训练

### 1. 网络超参数设定

##### （1）输入数据像素大小：

​        关于图像样本输入大小的设置，为了方便GPU设备的并行计算，**会统一将图像压缩到 $2^n$ 大小**。

​        **如果不考虑硬件设备限制，更高分辨率图像作为输入数据一般有助于网络性能的提升**，特别是基于注意力模型的深度网络提升更为明显。**高分辨率的图像会增加模型计算消耗而导致网络整体训练时间的延长**，另外如果使用全连接层作为最后的分类层，**会导致原始模型卷积层的最终输出无法输入到全连接层**，此时需要改变输入滤波器的大小，或者指定其他参数

##### (2) 卷积层参数的设定

卷积层的超参数主要包括卷积核大小，卷积操作的步长，和卷积核的个数。

- 在实践中**推荐使用 3x3 以及 5x5 这样的小卷积，其对应的步长建议设置为1**。小卷积相比与大卷积有两个优势：**增加网络容量和模型复杂度和减小卷积参数个数**。
- 卷积操作前还可以配合使用 padding 操作。**Padding操作主要有两个作用：(1) 可充分利用和处理输入图像的边缘信息。(2) 配合使用合适的卷积层参数可保持输出与输入同等大小，而避免随着网络深度的增加，输入大小急剧减小**。两种常见的设定为：
  - 卷积核大小为 3 x 3， 步长为 1， 填充为1
  - 卷积核大小为 5 x 5， 步长为1， 填充为2
- **卷积核的个数设置为2的次幂**，如 64、128、256、512等。这样设定有利于硬件计算过程中划分数据矩阵和参数矩阵， 尤其在利用显卡计算时。

##### (3) 汇合层参数的设定

**常用的参数设定为：核大小为 2x2，汇合步长为2.在此设定下，输出结果大小仅为输入数据长宽大小的四分之一**，也就是说，输入数据中有 75%的响应值被丢弃，这也就起到了"下采样"的作用。

### 2. 训练技巧

##### (1) 训练数据随机打乱

尽管训练数据固定，但是由于采取了批处理(mini-batch) 的训练机制，因此**我们可在对模型的每轮 epoch训练前将训练数据集随机打乱(shuffle)， 确保在模型不同轮数相同批次看到的数据是不同的**。

##### (2) 学习率的设定

学习率的设定一般遵循以下两个原则：

**一是模型刚开始的初始学习率不宜过大，以 0.01 和 0.001 为宜**；如果发现刚开始训练没几个批次模型的损失值就急剧上升，说明模型训练的学习率过大，此时应该减小学习率，从头训练。

**二是在训练过程中，学习率应该随着轮数的增加而减缓。**减缓的机制一般有以下几种方式：

- 轮数减缓， 如每五轮训练后，学习率减半。
- 指数减缓，即学习率按轮数增长指数插值递减。
- 分数减缓， 若原始的学习率为 lr0, 学习率按照下式递减， $lr_t = \frac{lr_0}{1+kt}$， 其中 k为超参数，用来控制学习率减缓幅度，t 为训练轮数。

##### （3）模型优化算法选择

**随机梯度下降(SGD)**

经典的随机梯度下降(Stochastic Gradient Descent， SGD) 法是神经网络训练的基本算法，即在每次批处理训练时计算网络误差并进行误差的反向传播， 之后根据一阶梯度信息对参数进行更新，更新策略为：
$$
\omega_t = \omega_{t-1} - \eta \cdot g
$$
其中， 一阶梯度信息完全依赖于 当前批数据在网络目标函数上的误差，故可以将学习率理解为当前批的梯度对网络整体参数更新的影响程度。

- 随机梯度下降法是最常见的神经网络优化算法
- 收敛效果稳定，不过收敛速度较慢

**基于动量的随机梯度下降法(momentum)**

受启发与物理学研究领域，基于动量(momentum)的随机下降法用于改善 SGD 更新时可能产生的震荡现象，其通过积累前几轮的"动量"信息辅助更新参数，更新策略为：
$$
v_t \leftarrow \mu \cdot v_{t-1} - \eta \cdot g, \\
\omega \leftarrow \omega_{t-1} + v_t
$$
其中， $\mu$ 为动量因子，控制动量信息对整体梯度更新的影响程度，一般设置为 0.9。

- 基于动量的随机梯度下降法可以抑制振荡，还可以在网络训练中后期网络参数趋于收敛、在局部最小值附近来回震荡时帮其跳出局部限制，找到最有参数

**Agagrad 法**

针对学习率自适应问题， Adagrad 法根据训练轮数的不同，对学习率进行动态调整。即：
$$
\eta \leftarrow \frac{\eta_{global}}{\sqrt{\sum_{t'=1}^{t}{g_{t'}^2 + \epsilon}}} \cdot g_t
$$
其中，$\epsilon$ 为一个小常数(通常设定为 10^-6 数量级)以防止分母为零。

**RMSProp 法**

RMSProp 法 更新策略为：
$$
r_t \leftarrow \rho \cdot r_{t-1} + (1-\rho) \cdot g^2, \\
\eta \leftarrow \frac{\eta_{global}}{\sqrt{r_t+\epsilon}}
$$
式子中， $\rho$ 的作用是消除adagrad 法对全局学习率的以来。不过 RMSProp 依然依赖全局学习率。在实际中， 关于RMSProp法中参数的设定，一组推荐值为: $\eta_{global}=1, \rho=0.9, \epsilon=10^{-6}$。 

**Adam 法**

Adam 法的本质是带有动量项的RMSProp 法，它利用梯度的一阶矩估计和二阶矩估计动态调整每个参数的学习率。Adam 法的主要优点在于，经过偏置矫正后，每一次迭代学习率都有一个确定范围，这样可以使得参数更新比较稳定。
$$
m_t = \beta_1 \cdot m_{t-1} + (1-\beta_1) \cdot g_t, \\
v_t = \beta_2 \cdot v_{t-1} + (1-\beta_2) \cdot g_t^2, \\
\hat{m}_t \leftarrow \frac{m_t}{1-\beta_1^2}, \\
\hat{v}_t \leftarrow \frac{v_t}{1-\beta_2^2}, \\
\omega_t \leftarrow \omega_{t-1} + \eta \cdot\frac{\hat{m}_t}{\sqrt{v}_t+\epsilon}
$$
可以看出，使用 Adam 法仍然需要制定基本学习率 $\eta$。 对于其中的超参数设定可以遵循： $\beta_1=0.9, \beta_2 = 0.999, \epsilon=10_{-8}, \eta=0.001$。

##### (4) 微调神经网络

 简单来说，微调神经网络就是用目标任务数据在原先预训练模型上继续训练过程。在这一过程中需要以下细节：

- 由于网络已在原始数据上收敛，因此应设置 较小学习率在目标数据上微调， 如在 $10^{-4}$ 数量级或以下。

- 可根据层深对不同层设置不同学习率；网络深层的学习率可以稍大于浅层学习率。

- 可以根据目标任务与原始数据的相似程度采取不同的微调策略：

