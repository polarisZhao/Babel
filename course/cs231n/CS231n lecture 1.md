### lecture 1 **Course Introduction** 

#### 1. Computer vision overview 

##### Welcome to CS231n

​    Computer Vision is really the study of visual data.

​    The amount of visual data in our world has really exploded to a ridiculous degree. But it's really hard to understand and to use. The field of computer vision is an interdisciplinary field. It touches Biology、Psychology、Physics、Engineering、Mathemathtics and computer science。

##### Related Courses @ Stanford

​    CS131 Computer Vision： Foundations and Applications
​        undergraduate introductory class for computer vision

​    CS231a Computer Vision， from 3D Reconstruction to Recognition

​        Core computer vision class for seniors， masters and phDs

​    CS230 Deep Learning

​    CS224n Natural Language Processing with Deep Learning  

​    CS231n CNN for Visual Recognition

​        Focusing on applications of deep learning to computer vision



#### 2. A brief history of computer vision

1. 动物进化出眼睛，视力功能的出现，进而导致了物种大爆炸。

2. 相机的出现、生物学界对视觉处理机制进行研究

3. 计算机视觉

   - Block world， 首次出现计算机视觉概念

   - 《The SUMMER VISION PROJECT》 MIT 

   - 《VISION》， David Marr， 讲述了如何理解视觉、计算机视觉的发展走向、如何开发出可以识别现实世界的算法。

     Input image --> Edge image --> $2\frac{1}{2}D$ Sketch --> 3-D model


   - 如何识别和表示现实世界  Generalized Cylinder & Pictorial Structure
   - 如何由简单物体结构识别和重建视觉空间 David Lowe



   - 图像分割 Normalized Cut
   - Face Detection, Viola & Jones 
   - SIFT  & Object Recognition David Lowe, 1999
   - Spatial Pyramid Matching, Lazebnik Schmid & Ponce, 2006
   - HOG(Histogram of Gradients), Dalal & Trigggs, 2005
   - DPM(Deformable Part Model), Felzenswalb, McAllester, Ramanan, 2009



   - Obejection Detection Task
   - 标准数据集的出现  PASCAL VOC 
   - IMAGE-NET （泛化 & 克服过拟合）
   - 深度学习（CNN 卷积神经网络）



#### CS231n overview

###### 学习内容

1. CS231n focuses on one of the most important problems of visual recognition - image classifaction
   - objection detection 
   - Action classification
   - Image captioning
2. Convoluton Neural Networks (CNN) become an important tool for objection recognition
   - 2010 NEC-UIUC
   - 2012 AlexNet
   - 2014 GoogLeNet & VGG
   - 2015 ResNet
3. CNN were not invented overnight
   - Algorithms： 1998 LeCun   LeNet --> 2012 AlexNet
   - Computation：计算速度的指数级上升
   - Data
4. The quest for visual intelligence goes far beyond object recognition
   - 语义分割、perceptual grouping、3-D 重建、动作识别
   - 虚拟现实 & 增强现实
   - 图像描述（理解图像背后的含义）

###### CV Technology Can Better Our Lives 

###### Optional textbook： 

​     Deep Learning by Goodfellow， Bengio， and Courville

###### Pre-requisite

- Proficiency in Python， some high-level familiarity with C/C++
- College Calculus, Linear Algebra
- Equivalent knowledge of CS229(machine learning)

###### Syllabus    [course index](http://cs231n.stanford.edu/index.html)