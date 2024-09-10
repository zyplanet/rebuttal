#!/bin/bash 

train_method="mdddpo"
val_method="ppo"
lr=1e-5
innerloop=1
sampleloop=1
step_freq=1
fix=0.5
device=0
# for run_times in `seq 1 1`:
# do
#     python main_generate.py -m general.test_method=$method general.seed=$RANDOM
# done
python main_generate.py -m dataset="toytree" +experiment=toytree_ppo.yaml general.device=$device general.fix=$fix train.lr=$lr general.train_method=$train_method general.val_method=$val_method general.step_freq=$step_freq general.innerloop=$innerloop general.sampleloop=$sampleloop  general.seed=$RANDOM