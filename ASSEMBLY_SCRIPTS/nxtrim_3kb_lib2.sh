#!/bin/bash

t1=$(date +%s)

nxtrim --rf --separate --aggressive --minlength 25 --output-prefix 3kb_lib2 -1 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_BYU/3kb_matepair_S2/3kb-matepair2_S2_L002_R1_001.fastq.gz -2 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_BYU/3kb_matepair_S2/3kb-matepair2_S2_L002_R2_001.fastq.gz 


t2=$(date +%s)
echo "execution time"$((t2 -t1))
