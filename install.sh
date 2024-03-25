#!/bin/bash

conda create --name GDPO --file spec-list.txt
conda activate GDPO
pip install -r requirements.txt
cd analysis/orca
g++ -O2 -std=c++11 -o orca orca.cpp
