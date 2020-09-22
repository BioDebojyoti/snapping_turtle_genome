#!/bin/bash

export PATH=/Users/turk.rhen/software/NxTrim:$PATH

t1=$(date +%s)

nxtrim  --separate --aggressive --minlength 25 --output-prefix 200bp_lib1 -1 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_HCI/RAW/13482X1_170227_D00550_0410_BCADT6ANXX_1_1.fq.gz -2 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_HCI/RAW/13482X1_170227_D00550_0410_BCADT6ANXX_1_2.fq.gz

t2=$(date +%s)
echo "execution time"$((t2 -t1))
