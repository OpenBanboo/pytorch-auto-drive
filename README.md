# Codebase for deep autonomous driving perception tasks

Segmentation models (**ERFNet, ENet, DeepLab, FCN**), Lane detection models (**SCNN, SAD, PRNet, RESA, LSTR, ERFNet and others**) based on Python 3.6 and PyTorch >=1.6.0 (CUDA 10) & TorchVision >=0.7.0 with mixed precision training.

**This repository implements (or plan to implement) the following interesting papers in a unified Pytorch codebase:**

[Fully Convolutional Networks for Semantic Segmentation](https://arxiv.org/abs/1605.06211) CVPR 2015

[DeepLab: Semantic Image Segmentation with Deep Convolutional Nets, Atrous Convolution, and Fully Connected CRFs](https://arxiv.org/abs/1606.00915) TPAMI 2017

[Rethinking Atrous Convolution for Semantic Image Segmentation](https://arxiv.org/abs/1706.05587) ArXiv preprint 2017

[ERFNet: Efficient Residual Factorized ConvNet for Real-Time Semantic Segmentation](https://ieeexplore.ieee.org/abstract/document/8063438/) ITS 2017

[Spatial As Deep: Spatial CNN for Traffic Scene Understanding](https://arxiv.org/abs/1712.06080) AAAI 2018

[RESA: Recurrent Feature-Shift Aggregator for Lane Detection](https://arxiv.org/abs/2008.13719) AAAI 2021

[Learning Lightweight Lane Detection CNNs by Self Attention Distillation](https://arxiv.org/abs/1908.00821) ICCV 2019

[Polynomial Regression Network for Variable-Number Lane Detection](http://www.ecva.net/papers/eccv_2020/papers_ECCV/papers/123630698.pdf) ECCV 2020

[End-to-end Lane Shape Prediction with Transformers](https://arxiv.org/abs/2011.04233) WACV 2021

**This repository is under active development, which means performance reported could improve in the future. While results with models uploaded are probably stable.**

## Highlights

Various methods tested on a wide range of backbones, modulated mIOU calculation, "poly" warmup learning rate schedule, image/keypoint loading, transformations and visualizations, also mixed precision training and tensorboard logging. **And you do not need matlab to test on CULane.**

Models from this repo are faster to train and often have better performance than other implementations, see [wiki](https://github.com/voldemortX/pytorch-auto-drive/wiki/Notes) for reasons and technical spefication of models.

## Supported datasets: 

| Task | Dataset |
| :---: | :---: |
| semantic segmentation | PASCAL VOC 2012 |
| semantic segmentation | Cityscapes |
| semantic segmentation | GTAV* |
| semantic segmentation | SYNTHIA* |
| lane detection | CULane |
| lane detection | TuSimple |
| lane detection | BDD100K (*In progress*) |

\* The UDA baseline setup, with Cityscapes *val* set as validation.

## Supported models:

| Task | Backbone | Model/Method |
| :---: | :---: | :---: |
| semantic segmentation | ResNet-101 | [FCN](https://arxiv.org/abs/1605.06211) |
| semantic segmentation | ResNet-101 | [DeeplabV2](https://arxiv.org/abs/1606.00915) |
| semantic segmentation | ResNet-101 | [DeeplabV3](https://arxiv.org/abs/1706.05587) |
| semantic segmentation | - | [ERFNet](https://ieeexplore.ieee.org/abstract/document/8063438/) |
| lane detection | ERFNet, VGG16, ResNets (18, 34, 50, 101) | Baseline |
| lane detection | ERFNet, VGG16, ResNets (18, 34, 50, 101) | [SCNN](https://arxiv.org/abs/1712.06080) |
| lane detection | VGG16, ResNets (18, 34, 50, 101) | [RESA](https://arxiv.org/abs/2008.13719) (*In progress*) |
| lane detection | ERFNet, ENet | [SAD](https://arxiv.org/abs/1908.00821) (*In progress*) |
| lane detection | ERFNet | [PRNet](http://www.ecva.net/papers/eccv_2020/papers_ECCV/papers/123630698.pdf) (*In progress*) |
| lane detection | ERFNet, ResNet18-reduced | [LSTR](https://arxiv.org/abs/2011.04233) (*In progress*) |

*The VGG16 backbone corresponds to DeepLab-LargeFOV in SCNN.*

*The ResNet backbone corresponds to DeepLabV2 (w.o. ASPP) with output channels reduced to 128 as in RESA.*

*We keep calling it VGG16/ResNet for consistency with common practices.*

## Model Zoo

We provide solid results (average/best/detailed), training time and trained models available for download in [MODEL_ZOO.md](docs/MODEL_ZOO.md).

## Preparations:

1. Setup a Python3 environment (CUDA 10), with PyTorch >= 1.6, TorchVision >= 0.7.0, tqdm, ujson, tensorboard, numpy, imageio, opencv-python, Pillow, pyyaml.

2. Download the code:
   
```
git clone https://github.com/voldemortX/pytorch-auto-drive.git
cd pytorch-auto-drive
```

3. Prepare the code:

```
chmod 777 *.sh
mkdir output
```

## Enable tensorboard (optional):

```
tensorboard --logdir=runs
```

## Getting started

Get started with [LANEDETECTION.md](docs/LANEDETECTION.md) for lane detection.

Get started with [SEGMENTATION.md](docs/SEGMENTATION.md) for semantic segmentation.

## Visualization Tools

Refer to [VISUALIZATION.md](docs/VISUALIZATION.md) for a visualization tutorial.

## Contributing

We welcome **Pull Requests** to fix bugs, update docs or implement new features etc. We also welcome **Issues** to report problems and needs, or ask questions (since your question might be more common and helpful to the community than you presume). Interested folks should checkout our [roadmap](https://github.com/voldemortX/pytorch-auto-drive/issues/4).

## Notes:

1. Cityscapes dataset is down-sampled by 2 when training at 256 x 512, to specify different sizes, modify them in [configs.yaml](configs.yaml); similar changes can be done with other experiments.

2. Training times are measured on **a single RTX 2080Ti**, including online validation time for segmentation, test time for lane detection.

3. All segmentation results reported are from single model without CRF and without multi-scale testing.
