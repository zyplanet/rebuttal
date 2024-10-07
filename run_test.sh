#!/bin/bash 
test_method="evalproperty"
dataset="zinc"
device=0
test_only="/root/autodl-tmp/rebuttal/multirun/2024-10-06/16-24-00/0/checkpoints/zinc/5ht1b_25700_epoch\=0-val/epoch_score\=4.4444.ckpt"
python main_generate.py -m dataset=$dataset +experiment=zinc_test.yaml general.device=$device  general.test_only=$test_only general.target_prop="5ht1b" general.pretrain=True general.seed=$RANDOM
