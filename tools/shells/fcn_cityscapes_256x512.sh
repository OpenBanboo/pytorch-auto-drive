#!/bin/bash
# Trained weights: fcn_cityscapes_256x512_20201226.pt
python main_semseg.py --epochs=60 --lr=0.004 --batch-size=8 --dataset=city --model=fcn --mixed-precision --exp-name=fcn_cityscapes_256x512
