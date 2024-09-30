#!/bin/bash 
test_method="evalproperty"
dataset="zinc"
device=1
test_only="/root/autodl-tmp/rebuttal/multirun/2024-09-28/00-13-19/0/checkpoints/num400_n20_1-3_cliq4_hmedium_r0/5ht1b_4435_epoch\=0-val/epoch_score\=8.6957.ckpt"
python main_generate.py -m dataset=$dataset +experiment=zinc_test.yaml general.device=$device  general.test_only=$test_only general.target_prop="5ht1b" general.pretrain=True general.seed=$RANDOM
