# deep-learning-summary
deep learning course, framework, models, confluence and so on

#### 1. Course

**Coursera** 

machine learning  <https://www.coursera.org/learn/machine-learning>

deep learning    <https://www.coursera.org/specializations/deep-learning>

Neural Networks for Machine Learning    <https://www.coursera.org/learn/neural-networks>

**Udacity**  

machine learning & deep learning foundation

**Stanford**

Machine Learning

CS229: Machine Learning  <http://cs229.stanford.edu>

Deep Learning

Deep Learning <http://web.stanford.edu/class/cs230/>

CS231n: Convolutional Neural Networks for Visual Recognition

<http://cs231n.github.io>

PS: https://zhuanlan.zhihu.com/p/21930884  [中]  http://www.mooc.ai/course/268  [中]

Stanford CS224d:Deep Learning for Natural Language Processing  <http://cs224d.stanford.edu>

stanford university  CS 20SI: Tensorflow for Deep Learning Research <http://web.stanford.edu/class/cs20si/index.html>

**CMU** 

CMU 11-785 Introduction to Deep Learning   <http://deeplearning.cs.cmu.edu/>

CMU CS 11-747, Spring 2018 Neural Networks for NLP   <http://phontron.com/class/nn4nlp2018/>

**台湾大学**

ADLxMLDS  <https://www.youtube.com/channel/UCyB2RBqKbxDPGCs1PokeUiA/videos>[中文]

1天搞懂深度学习 [http://www.slideshare.net/tw_dsconf/ss-62245351?qid=108adce3-2c3d-4758-a830-95d0a57e46bc&v=&b=&from_search=3](https://link.zhihu.com/?target=http%3A//www.slideshare.net/tw_dsconf/ss-62245351%3Fqid%3D108adce3-2c3d-4758-a830-95d0a57e46bc%26v%3D%26b%3D%26from_search%3D3) [中文]

**Fast.ai** Practical Deep Learning For Coders   <http://course.fast.ai>  

**MIT**

MIT 6.S191: Introduction to Deep Learning  <http://introtodeeplearning.com>

MIT 6.S099: Artificial General Intelligence: <https://agi.mit.edu>

MIT 6.S094: Deep Learning for Self-Driving Cars <https://selfdrivingcars.mit.edu>

**Oxford**

Deep Learning NLP -2017 <https://github.com/oxford-cs-deepnlp-2017/lectures>

Introduction to Deep Learning for Natural Language Processing (Tutorial at DeepLearning2017 summer school in Bilbao)  <https://www.microsoft.com/en-us/research/publication/introduction-deep-learning-natural-language-processing-tutorial-deeplearning2017-summer-school-bilbao-2/#>

**CUHK**

pytorch zerotoall   <https://github.com/hunkim/PyTorchZeroToAll>

**Others**

UCB S 294: Deep Reinforcement Learning <http://rll.berkeley.edu/deeprlcourse/>

2017 NIPS  Deep Mind   Deep Learning Practice and Trends.pdf  <https://docs.google.com/presentation/d/e/2PACX-1vQMZsWfjjLLz_wi8iaMxHKawuTkdqeA3Gw00wy5dBHLhAkuLEvhB7k-4LcO5RQEVFzZXfS6ByABaRr4/pub?slide=id.p>

AI and Deep Learning in 2017 – A Year in Review <http://www.wildml.com/2017/12/ai-and-deep-learning-in-2017-a-year-in-review/>

OPENAI requests for research-2 <https://blog.openai.com/requests-for-research-2/>

UCL Course on RL <http://www0.cs.ucl.ac.uk/staff/D.Silver/web/Teaching.html>

mxnet    <https://space.bilibili.com/209599371?spm_id_from=333.338.viewbox_report.7#/>

caffe tutorial  <http://caffe.berkeleyvision.org/tutorial/>

#### 2. Deep Learning Framework

**PC/Server**:  

**Tensorflow** (google)        

**Mxnet** (amazon)       

**Caffe + Pytorch**  (facebook)   pytorch for research ，caffe for production

![img](../img/gluon.png)

**Mobile:** 

**caffe2**  (facebook)

**core-ml**  (apple)

**ncnn** (tencent) <https://github.com/Tencent/ncnn>

**mobile-deep-learning** (baidu)  <https://github.com/baidu/mobile-deep-learning>

【MXnet】

论坛：<https://discuss.gluon.ai>

李沐深度学习教程主页：<http://zh.gluon.ai/index.html>

课程源代码：<https://github.com/mli/gluon-tutorials-zh>

Github 主页：<https://github.com/apache/incubator-mxnet>

mxnet 主页：<http://mxnet.readthedocs.io/en/latest/>

【Tensorflow】

Tensorflow 官网中国备份地址  <https://tensorflow.google.cn/>  

Tensorflow github 地址  <https://github.com/tensorflow/tensorflow> 

Tensorflow serving github 地址<https://github.com/tensorflow/serving> 

Stanford  tensorflow 教程 <https://web.stanford.edu/class/cs20si/>   

Others:

TVM: https://github.com/dmlc/tvm

TC: TensorComprehensions

onnx: <https://github.com/onnx/onnx>

#### 3. Computer Vision related Paper

Deep learning  Yann LeCun, Yoshua Bengio, Geoffrey Hinton

**Classification:**

AlexNet: ImageNet Classification with Deep Convolutional Neural Networks. 

VGGNet: Very Deep Convolutional Networks for Large-Scale Image Recognition.

GoogLeNet: Going Deeper with Convolutions.

Xception：

ResNet: Identity Mappings in Deep Residual Networks.

Wide Resnet： Wide Residual Networks

SE Net:Squeeze-and-Excitation Networks

Res Next: Aggregated Residual Transformations for Deep Neural Networks

Dense Net：Densely Connected Convolutional Networks 

SqueezeNet: AlexNet-level accuracy with 50x fewer parameters and <0.5MB model size.

ShuffleNet: An Extremely Efficient Convolutional Neural Network for Mobile Devices 

MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications

mobilenet v2 ： Inverted Residuals and Linear Bottlenecks: Mobile Networks for Classification, Detection and Segmentation

**Detection：**

RCNN: Rich feature hierarchies for accurate object detection and semantic segmentation.  arxiv  code

Fast R-CNN. 

Faster R-CNN: Towards Real-Time Object Detection with Region Proposal Networks.

YOLO: You Only Look Once: Unified, Real-Time Object Detection

SSD: Single Shot Multibox Detector

YOLO v2: YOLO9000: Better, Faster, Stronger

![img](../img/2.jpeg)

**Segmentation：**

FCN: Fully Convolutional Networks for Semantic Segmentation

Unet: Convolutional Networks for Biomedical Image Segmentation

Segnet:<http://mi.eng.cam.ac.uk/projects/segnet/>

Deep Lab v1-v3:DeepLab: Semantic Image Segmentation with Deep Convolutional Nets, Atrous Convolution, and Fully Connected CRFs

Mask CNN.

**GAN：**

GAN: Generative Adversarial Networks. 

DCGAN: Unsupervised Representation Learning with Deep Convolutional Generative Adversarial Networks.

WGAN: Wasserstein GAN

**Face Recognition:**

FaceNet: A Unified Embedding for Face Recognition and Clustering

SphereFace: Deep Hypersphere Embedding for Face Recognition

Arcface:ArcFace: Additive Angular Margin Loss for Deep Face Recognition

Addr ：<https://github.com/deepinsight/insightface>

cosFace: Large Margin Cosine Loss for Deep Face Recognition(Tencent)

Dynamic Routing Between Capsules

#### 4. Deep Learning models from github

**CV**

1.PixelCNN & PixelRNN in TensorFlow   <https://github.com/carpedm20/pixel-rnn-tensorflow>

2.Simulated+Unsupervised (S+U) learning in TensorFlow  <https://github.com/carpedm20/simulated-unsupervised-tensorflow>

3.ResNet in TensorFlow  <https://github.com/ry/tensorflow-resnet>

4.A composable Generative Adversarial Network(GAN) with API and command line tool  <https://github.com/255BITS/HyperGAN>

5.conversation of caffe vgg16 model to tensorflow <https://github.com/ry/tensorflow-vgg16>

6.A Kitti Road Segmentation model implemented in tensorflow <https://github.com/MarvinTeichmann/KittiSeg>

7.TensorFlow tutorial on Generative Adversarial Models  <https://github.com/ericjang/genadv_tutorial>

8.Pretrained models for TFLearn and TensorFlow  <https://github.com/tflearn/models>

9.Generative Models with TensorFlow <https://github.com/arahuja/generative-tf>

10.Re-implementation of the m-RNN model using TensorFLow <https://github.com/mjhucla/TF-mRNN>

11.Recurrent Models of Visual Attention  <https://github.com/zhongwen/RAM>

12.Simple Image Classification Models for the CIFAR-10 dataset using TensorFlow <https://github.com/wolfib/image-classification-CIFAR10-tf>

13.IllustrationGAN <https://github.com/tdrussell/IllustrationGAN>

14.ImageNet pre-trained models with batch normalization <https://github.com/cvjena/cnn-models>

Action Detection

1.Action Recognition using Visual Attention <https://github.com/kracwarlock/action-recognition-visual-attention>

2.Deep Video Analytics <https://github.com/AKSHAYUBHAT/DeepVideoAnalytics>

3.Visual Search Server <https://github.com/AKSHAYUBHAT/VisualSearchServer>

**Collection**

1.TensorFlow Models <https://github.com/tensorflow/models>

2.Collection of generative models, e.g. GAN, VAE in Pytorch and Tensorflow <https://github.com/wiseodd/generative-models>

3.Deep learning using tensorflow <https://github.com/shekkizh/TensorflowProjects>

4.A library for probabilistic modeling, inference, and criticism. Deep generative models, variational inference. Runs on TensorFlow. <https://github.com/blei-lab/edward>

5.Tensorflow Tutorial files and Implementations of various Deep NLP and CV Models.

<https://github.com/siddk/deep-nlp>

6.A tensorflow library for building all kinds of models  <https://github.com/hycis/TensorGraph>

7.PyTorch and Tensorflow functional model definitions <https://github.com/szagoruyko/functional-zoo>

8.Neural network models in tensorflow <https://github.com/AJwader/Tensorflow-models>

**Others：**

0. FaceBook 目标检测代码(含mask rcnn 代码 caffe 实现) <https://github.com/facebookresearch/Detectron>

1.Caffe models in TensorFlow <https://github.com/ethereon/caffe-tensorflow>

2.Run Keras models (tensorflow backend) in the browser, with GPU support <https://github.com/transcranial/keras-js>

3.Simplify the training and tuning of Tensorflow models <https://github.com/galeone/dynamic-training-bench>

4.Observations and notes to understand the workings of neural network models and other thought experiments using Tensorflow <https://github.com/shekkizh/neuralnetworks.thought-experiments>

5.attention model for entailment on SNLI corpus implemented in Tensorflow and Keras <https://github.com/shyamupa/snli-entailment>

6.Multilayer Feed-Forward Neural Network predictive model implementations with TensorFlow and scikit-learn

<https://github.com/civisanalytics/muffnn>

7.Keras pretrained models (VGG16 and InceptionV3) + Transfer Learning for predicting classes in the Oxford 102 flower dataset

<https://github.com/Arsey/keras-transfer-learning-for-oxford102>

8.Tensorflow Model Zoo for Torch7 and PyTorch <https://github.com/Cadene/tensorflow-model-zoo.torch>

9.Keras implementation of "Wide Residual Networks" <https://github.com/asmith26/wide_resnets_keras>

10.Caffe Model Zoo <https://github.com/BVLC/caffe/wiki/Model-Zoo>

#### 5. confluence 

VIPSAPP 2018 (13th International Conference on Computer Vision Theory and Applications )

时间：2018/01/27-2018/01/029 

地点：葡萄牙马德拉

介绍：计算机视觉应用领域知名会议，内容覆盖图像分析处理，视频分析与理解，视觉跟踪等应用和服务。

网址：http://wacv18.uccs.us/

AAAI 2018（the Association for the Advancement of Artificial Intelligence ）

时间：2018/02/02-2018/02/09

地点：Hilton New Orleans Riverside, New Orleans, Lousiana, USA 

介绍：人工智能领域顶级会议 ，涵盖人工智能和机器学习的各个分支

官网：https://aaai.org/Conferences/AAAI-18/aaai18call/

WACV 2018 (IEEE Winter Conf. on Applications of Computer Vision)

时间：2018/03/12-2018/03/15 

地点：美国内华达州

介绍：侧重计算机视觉应用的国际知名会议 

网址：http://wacv18.uccs.us/

VALSE 2018(Vision and Learning SEminar)

时间：2018/04/20-2018/04/22

地点：大连理工

介绍：计算机视觉、图像处理、模式识别与机器学习研究领域知名会议

网址：http://ice.dlut.edu.cn/valse2018/index.html

FG 2018（The IEEE Conference on Automatic Face and Gesture Recognition）

时间：2018/05/15-2018/05/19

地点：中国西安

介绍：图像识别，视频中的人脸，手势及身体移动等的识别研究会议

官网：https://fg2018.cse.sc.edu/index.html

CVPR 2018（IEEE Conference on Computer Vision and Pattern Recognition）

时间：2018/06/18-2018/06/22

地点：美国盐湖城

介绍：计算机视觉及模式识别领域国际三大顶级会议之一

官网：https://fg2018.cse.sc.edu/index.html

ICML 2018（Thirty-fifth International Conference on Machine Learning)

时间：2018/07/10-2018/07/15 

地点：瑞典斯德哥尔摩

介绍：机器学习领域知名国际会议

网址：https://icml.cc/Conferences/2018/

IJCAI-ECAI 2018（27th International Joint Conference on Artificial Intelligence and the 23rd European Conference on Artificial Intelligence ）

时间：2018/07/13-2018/07/19 

地点：瑞典斯德哥尔摩

介绍：国际顶级人工智能联合大会 

官网：https://www.ijcai-18.org/

ICPR 2018(the 24th International Conference on Pattern Recognition)

时间：2018/08/20-2018/8/24 

地点：中国北京

介绍：模式识别,机器学习及计算机视觉国际著名会议 

官网：http://www.icpr2018.org

BMVC 2018（29TH BRITISH MACHINE VISION CONFERENCE）

时间：2018/09/03-2019/09/06 

地点：英国纽卡斯尔

介绍：机器视觉，图像处理及模式识别相关领域著名国际会议 

官网：http://bmvc2018.org

ECCV 2018（European Conference on Computer Vision )

时间：2018/09/08-2018/09/14 

地点：德国慕尼黑

介绍：计算机视觉国际三大顶级会议之一 

官网：https://eccv2018.org/

ICCVG 2018（International Conference on Computer Vision and Graphics）

时间：2018/09/17-2018/09/19 

地点：波兰华沙

介绍：计算机视觉及图像领域著名国际会议 

官网：http://iccvg.wzim.sggw.pl

ICIP 2018 （The 25th IEEE International Conference on Image Processing）

时间：2018/10/07-2018/10/10

地点：希腊雅典

介绍：国际知名图像和视频处理会议 

官网：https://2018.ieeeicip.org

PRCV 2018（The First Chinese Conference on Pattern Recognition and Computer Vision)

时间：2018/11/23-2018/11/26

地点：中国广州

介绍：中国第一届模式识别和计算机视觉理论与应用会议

网址：https://prcv-conf.org/2018/

NIPS 2018（The Conference and Workshop on Neural Information Processing Systems )

时间：2018/12/03-2018/12/08 

地点：加拿大蒙特利尔

介绍：机器学习领域国际顶级会议 

官网：<https://nips.cc/Conferences/2018>

PAMI/TPAMI (IEEE Transactions on Pattern Analysis and Machine Intelligence)



#### 6. others：

1. Deep Learning(Ian Goodfellow / Yoshua Bengio)
2. Pattern Recognition and Machine Learning
3. Neural Networks and Deep Learning <http://neuralnetworksanddeeplearning.com>
4. UFLDL Tutorial <http://deeplearning.stanford.edu/wiki/index.php/UFLDL_Tutorial>
5. colah blog <https://colah.github.io>
