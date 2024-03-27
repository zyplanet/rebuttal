#!/bin/bash 
test_method="evalproperty"
dataset="zinc"
device=0
python main_generate.py -m dataset=$dataset +experiment=zinc_test.yaml general.device=$device  general.target_prop="parp1" general.pretrain=True general.seed=$RANDOM
