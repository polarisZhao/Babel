## 目标函数

### 1. 分类任务的目标函数

##### (1) 交叉熵损失函数/Softmax 损失函数

​        交叉熵(cross entropy)损失函数又称Softmax 损失函数，是目前卷积神经网络最常用的分类目标函数。其形式为：

$$
L_{cross\ entropy\ loss} = L_{softmax\ loss} = -\frac{1}{N}\sum_{i=1}^{N}log(\frac{e^{h_{y_i}}}{\sum_{j=1}^{C}e^{h_j}})
$$
即通过指数化变换使网络输出 $h$ 转换为概率形式。

##### (2) 合页损失函数

​        在支持向量机中被广泛使用的合页损失函数（hinge loss）有时也作为目标函数在神经网络模型中使用：
$$
L_{hinge\ loss} = \frac{1}{N}\sum_{i=1}^{N}max{(0, 1-h_{yi})}
$$
​        合页损失函数的设计理念是：**对错误越大的样本施加越严重的惩罚。可是这一损失函数对噪声的抵抗能力较差。**另外，一般的分类任务中的交叉熵损失函数的分类效果略优于合页损失函数的分类效果。

##### (3) 坡道损失函数

​        坡道损失函数的定义为：
$$
L_{ramp\ loss} = L_{hinge\ loss} - \frac{1}{N}\sum_{i=1}^{M}max{(0, s-h{yi})}  \\
= \frac{1}{N}\sum_{i=1}^{M}(max{(0, 1-h_{yi})} - max{(0, s-h_{yi})})  \\
$$
​        其中 , $s$ 制定了“截断点”的文职。由于坡道损失函数实际在 $s$ 处“截断” 合页损失函数，因此坡道损失函数也被称为“截断合页损失函数”(truncated hinge loss function)

##### (4) 大间隔交叉熵损失函数

​        上面提到的网络输出结果 $h$ 实际上市全连接层参数 $W$ 与该层特征向量 $x_i$的内积， 即 $h=W^Tx_i$。因此传统的交叉熵损失还可以表示为：
$$
L_{softmax\ loss} = -\frac{1}{N}\sum_{i=1}^{N}log(\frac{e^{h_{y_i}}}{\sum_{j=1}^{C}e^{h_j}}) \\
= -\frac{1}{N}\sum_{i=1}^{N}log(\frac{e^{W^T_{yi}x_i}}{\sum_{j=1}^{C}e^{W^T_jx_i}}) \\
$$
​       其中， $W_i^T$ 为$W$ 第i列参数值。根据内积的定义，上式可以变换为
$$
L_{softmax\ loss} = -\frac{1}{N}\sum_{i=1}^{N}log(\frac{e^{||W_{yi}||||x_i||cos(\theta_{yi})}}{\sum_{j=1}^{C}e^{||W_{j}||||x_i||cos(\theta_j)}})
$$
​       式中的 $\theta_j(0\leq\theta_j \leq \pi)$ 为向量 $W_i^T$ 和 $x_i$的夹角。以二分类为例，对隶属于第一个类别的某样本 $x_i$而言， 为分类正确，传统的交叉熵损失函数需迫使学到的参数满足 $W_1^Tx_i > W_2^Tx_i$, 亦即$||W_1||||x_i|| cos(\theta) > ||W2||||x_i||cos(\theta)$。大间隔交叉熵损失函数为了使特征更加具有分辨能力，则再次基础上要求二者差异更大，即引入 $m$ “拉大”两者差距，这便是“大间隔”名称的由来。$||W_1||||x_i||cos(m\theta_1) \geq ||W2||||x_i||cos(\theta_2) , (0\leq\theta_1\leq\frac{\pi}{m})$。式中 $m$ 为正整数，起到控制间隔大小的作用，$m$ 越大。类间间隔越大，反之亦然。特别地， 当 $m=1$ 时， 大间隔交叉熵损失函数即退化为传统交叉熵损失函数。

综上可得：
$$
||W_1||||x_i||cos(\theta_1) \geq ||W_1||||x_i||cos(m\theta_1) \geq ||W2||||x_i||cos(\theta_2) , (0\leq\theta_1\leq\frac{\pi}{m})
$$
​        可以发现，上式不仅满足传统交叉熵损失函数的约束，在确保分类正确的同时增大了不同类别间分类的置信度，这有助于进一步提升特征分辨能力。

​        大间隔交叉熵损失函数的定义为：
$$
L_{large-margin\ softmax\ loss} = -\frac{1}{N}\sum^{1}_{i=1}log(\frac{e^{||W_i||||x_i||\phi(\theta_{y_i})}}{e^{||W_i||||x_i||\phi(\theta_{yi})}+\sum_{j\neq y_i}e^{||W_j||||x_i||\phi(\theta_{j})}})
$$
​        可以发现，上式与$Softmax$ 损失函数的区别仅仅在于第 $i$ 类分类间隔 “拉大”了：由  $cos(\theta_{y_i})$ 变为 $\phi(\theta_{y_i})$, 其中：
$$
\phi(\theta) = 
\begin{equation}  
\left\{  
             \begin{array}{**lr**}  
             cos(m\theta), 0 \leq \theta \leq \frac{\pi}{m}&  \\  
             \mathcal{D}(\theta) , \frac{\pi}{m} < \theta \leq \pi &\\     
             \end{array}  
\right.  
\end{equation}
$$
​        式中，$\mathcal{D}(\theta)$ 只需要满足“单调递减”条件， 且 $D(\frac{\pi}{m})=cos\frac{\pi}{m})$。

##### (5) 中心损失函数

​        大交叉熵损失函数主要考虑增大类间距离，而中心损失函数则在考虑类间距离的同时还将一些注意力放在减小类间差异上。中心损失函数的定义为：
$$
L_{center\ loss} = \frac{1}{2}\sum_{i=1}^{N}||x_i - c_{y_i}||_2^2
$$
​        其中， $c_{y_i}$ 为 第 $y_i$ 类所有深度特征均值的中心，故名“中心损失函数”。

​        在实际使用中，由于中心损失函数本身考虑类内差异，因此应该讲中心损失函数与其他主要考虑类间距离的损失函数配合使用，如交叉熵损失函数，这样网络最终目标形式可表示为：
$$
L_{final} = L_{cross\ entropy\ loss} + \lambda L_{center\ loss}(h, y_i)  \\
= -\frac{1}{N}\sum_{i=1}^{N}log(\frac{e_{h_{y_i}}}{\sum_{j=1}^{C}e^{h_j}})+\frac{\lambda}{2}\sum_{i=1}^{N}||x_i - c_{y_i}||_2^2
$$

#### 2. 回归任务的目标函数

##### (1) $\mathcal{L1}$ 损失函数

$$
L_{\mathcal{l1}} = \frac{1}{N}\sum_{i=1}^{N}\sum_{t=1}^{M}||y_t^i-\hat{y}t^i||
$$

##### (2) $\mathcal{L2}$ 损失函数

$$
L_{\mathcal{l2}} = \frac{1}{N}\sum_{i=1}^{N}\sum_{t=1}^{M}(||y_t^i-\hat{y}t^i||)^2
$$

​        在实际使用中， $\mathcal{l_1}$ 与 $\mathcal{l_2}$ 损失函数在回归精度上几乎相差无几。不过在一些情况先 $\mathcal{l_2}$ 损失函数会略优于 $\mathcal{l_1}$ ，同时收敛速度方面 $l_2$ 损失函数也略快于 $\mathcal{l_1}$ 损失函数。

##### (3) Tukey's biweight 损失函数

​        Tukey's biweight 损失函数是一类非凸函数，其可克服在回归任务中的利群店或者样本噪声对整体回归模型的干扰和影响，是回归任务中一种健壮的损失函数，其定义如下：
$$
\mathcal{L_{Tukey's\ biweight\ loss}} =
\begin{equation}  
\left\{  
             \begin{array}{**lr**}  
             \frac{c^2}{6N}\sum_{i=1}^{N}\sum_{t=1}^{M}[1-(1-(\frac{l_t^i}{c})^2)], |l_t^i| \leq c  \\  
             \frac{c^2{M}}{6}, 其他 &\\     
             \end{array}  
\right.  
\end{equation}
$$
​        式中， 常数  $c$ 指定了函数拐点的位置。需要说明的是，该超参数并不需要认为指定。一般情况下， 当 $c=4.6851$ 时， $Tukey's\ biweight $损失函数可取得与 $\mathcal{l_2}$ 损失函数在最小化符合标准正态分布时的残差类似的(95%渐进)回归效果。

#### 3. 其他任务的损失函数

​        在一些如人脸年龄估计、头部角度识别等任务样本标记具有不确定性的特殊场景下，基于标记分布(label distribution)的损失函数不失为一种优质的选择。具体而言，假设 $h=(h_1, h_2, …, h_C)^T$ 为模型对于输入样本 $x_i$ 的最终输出结果，那么在利用标记分布技术解决问题之前，首先需要将 $h$ 转化为一个合法分布。以softmax 为例可以将 $h$ 转化为:
$$
\hat{y}_k = \frac{e^{h_k}}{\sum_{j=1}^{C}{e^{h_j}}}
$$
​        其中，$k \in {1,2,3,…,C}$ 代表标记向量的第 $k$ 维。可以用Kullback-Leibler散度(KL divergence)来度量 $\hat{y}$与真实标记 $y$ 之间的误差：$\mathcal{L}_{KL\ loss}=\sum_k{y_klog\frac{y_k}{\hat{y}_k}}$。由于 $y_k$ 为常量，上式等价于：$\mathcal{L}_{KL\ loss} = -\sum_{k}{y_k}{log{\hat{y}_k}}$。通过该式可以衡量样本标记分布与真实部分之间的差异，并利用该差异指导模型训练。
