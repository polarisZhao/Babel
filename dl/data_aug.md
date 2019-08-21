### 数据扩充

**数据扩充，即根据一些先验知识，在保证特定信息的前提下，对原始数据进行适当变换，以达到扩充数据集的效果**。有效的数据扩充，不仅能够扩充训练数据集，还能增加数据多样性。一方面能够避免过拟合，另一方面，又会带来性能的提升。具体到图像分类任务，在保持图像类别不变的前提下，可以对训练集中的每幅图像进行以下变换：

#### 1. 简单的数据扩充方式

- 在一定程度内的**随机旋转(rotating)**(将原图旋转一定角度)、**平移**、**缩放(scaling)**（将分辨率变为原图的0.8、0.9、1.1、1.2、1.3 倍）、**裁剪(cropping)**(一般使用0.8-0.9倍原图大小的正方形在原图的随机位置处扣取图像块)、**填充**、**上下左右翻转(flipping)**等。这些变换对应着同一个目标在不同角度的观察结果。

- **色彩抖动（color jittering）：**在原图的RGB颜色空间对原有的RGB色彩分布进行轻微的扰动，如高斯白噪声、椒盐噪声，也可以在**HSV 颜色空间**尝试改变原有的饱和度(S)和明度(V)，或者对色调(H)进行微调．

- 改变图像的亮度、清晰度、对比度、锐度等。

- **FancyPCA**。在图像的RGB颜色空间上进行主成分分析，得到3个主成分的特征向量 $p_1, p_2, p_3$及其对应的特征值$\lambda_1, \lambda_2,\lambda_3$ ，然后在每个像素的RGB值上．添加增量 $[p_1, p_2, p_3]  \cdot [\alpha_1 \lambda_1, \alpha_2\lambda_2,\alpha_3 \lambda_3]$，其中$[\alpha_1, \alpha_2, \alpha_3]$是均值为0、方差较小的高斯分布随机数。

  ~~~python
  def FancyPCA(img):
      """
      FancyPCA
      """
      h, w, c = img.shape
      img = np.reshape(img, (h * w, c)).astype('float32')
      mean = np.mean(img, axis=0)
      std = np.std(img, axis=0)
      img = (img - mean) / std
  
      cov = np.cov(img, rowvar=False)
      lambdas, p = np.linalg.eig(cov)
      alphas = np.random.normal(0, 0.1, c)
      pca_img = img + np.dot(p, alphas*lambdas)
  
      pca_color_img = pca_img * std + mean
      pca_color_img = np.maximum(np.minimum(pca_color_img, 255), 0)
      return pca_color_img.reshape(h, w, c).astype(np.uint8)
  ~~~

#### 2. 特殊的数据扩充方式

- **监督式数据扩充**：首先根据原数据训练一个分类的初始模型。而后根据该模型，对每张图生成的可指示图像区域与场景标记间的相关概率。最后根据此概率映射回原图选择较强相关的图像区域作为扣取的图像块。
- 除了直接在图像空间进行变换， 还可以先对图像进行特征提取， 然后在图像的**特征空间内进行变换**，利用一些通用的数据扩充或者上采样技术，例如 **SMOTE 算法**。
- 使用**生成模型**也可以合成一些新样本。例如当今非常流行的对抗生成网络。
- Fine-tune

​    在实践中，需要根据自身的任务特点选择合适的数据扩充方式，而不能一股脑的将所有的数据扩充方法都用到自己任务之中。





