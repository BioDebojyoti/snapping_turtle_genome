#!/bin/bash

export PATH=/Users/turk.rhen/software/NxTrim:$PATH

t1=$(date +%s)

nxtrim  --separate --aggressive --minlength 25 --output-prefix 200bp_lib7 -1 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_HCI/RAW/13482X1_161222_D00294_0282_BCAB4VANXX_7_1.fq.gz -2 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_HCI/RAW/13482X1_161222_D00294_0282_BCAB4VANXX_7_2.fq.gz

t2=$(date +%s)
echo "execution time"$((t2 -t1))
