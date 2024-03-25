#!/bin/bash //
train_method="isddpo"
val_method="ppo"
device=2
python main_generate.py -m dataset="zinc" +experiment=zinc_ppo_fa7.yaml general.train_method=$train_method general.val_method=$val_method general.device=$device general.seed=$RANDOM