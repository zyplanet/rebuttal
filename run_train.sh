#!/bin/bash //修改位置
device=1
dataset="toytree"
python main_generate.py -m dataset=$dataset general.device=$device +experiment=toytree.yaml 