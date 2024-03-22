#!/bin/bash

conda create --name GDPO --file spec-list.txt
conda activate GDPO
pip install -r requrements.txt
cd analysis/orca
g++ -O2 -std=c++11 -o orca orca.cpp