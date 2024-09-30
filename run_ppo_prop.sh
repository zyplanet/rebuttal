#!/bin/bash //
train_method="mcddpo"
val_method="ppo"
device=0
python main_generate.py -m dataset="zinc" +experiment=zinc_ppo_5ht1b.yaml general.train_method=$train_method general.val_method=$val_method general.device=$device general.seed=$RANDOM

