#### 1. Outline

- CPU vs GPU
- Deep Learning Frameworks
  - Caffe/Caffe2
  - Theano/Tensorflow
  - Torch/PyTorch

#### 2. CPU vs GPU

(1) GPU ：Graphics card or Graphics Processing Unit

​       developed for rendering, computer graphics and especially around games.

(2) **NVIDIA** vs AMD 

(3) CPU vs GPU：
**CPU:** Fewer cores, but each core is much faster and much more capable; great at sequential tasks.

**GPU:** More cores, but each core is much slower and "dumber"; great for parallel tasks 
​          Example: Matrix Multiplication

(4) Programming GPUs
**CUDA**(NVIDIA only)

- Write C-like code that runs directly on the GPU
- Higher-level APIs: cuBLAS, cuFFT, cuDNN, etc

**OpenCL**:

- Similar to CUDA, but runs on anything
- Usually slower :(

**Related course**: Udacity:Intro to Parallel Programming

(5) Programming GPUs

- CPU performance not well-optimized, a little unfair
- CUDA vs cudnn: cuDNN much faster than “unoptimized” CUDA

(6) CPU/GPU communication
​    If you aren't careful, training can bottleneck on reading data and transferring to GPU
**Solution**：

- Read all data into RAM

- Use SSD instead of HDD
- Use multiple CPU threads to prefetch data

#### 3. Deep Learning Framework

**Caffe**             ——>     **Caffe2**

(UC Berkeley)              (Facebook)

**Torch**            ——>      **Pytorch**

NYU/Facebook         (Facebook)

**Theano**        ——>     **Tensorflow**

(U Montreal)                (Google)

**Paddle**(Baidu)        **CNTK**(Microsoft)        **MXNet**(Amazon)   And others

The point of deep learning frameworks

(1) Easily build big computational graphs

(2) Easily compute gradients in computational graphs

(3) Run it all efficiently on GPU(wrap cuDNN, cuBLAS, etc)

#### 4. Static vs Dynamic Graps

**TensorFlow**: Build graph once, then run many times(static)

- Optimization Friendly: With static graphs, framework can optimize the graph for you before it runs!
- Once graph is built, can serialize it and run it without the code that build the graph

**Pytorch**: Each forward pass define a new graph(dynamic)

- Conditional Friendly
- Loops Friendly

###### Dynamic Graph Applications

- Recurrent networks

- Recursive networks

- Modular Networks