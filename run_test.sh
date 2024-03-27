#!/bin/bash 
test_method="evalproperty"
dataset="zinc"
device=0
test_only="/data/home/liuyijing/rebuttal/multirun/2024-03-23/20-12-55/0/checkpoints/zinc/parp1_8287_epoch\=0-val/epoch_score\=1.4563.ckpt"
python main_generate.py -m dataset=$dataset +experiment=zinc_test.yaml general.device=$device  general.test_only=$test_only general.target_prop="parp1" general.pretrain=True general.seed=$RANDOM
