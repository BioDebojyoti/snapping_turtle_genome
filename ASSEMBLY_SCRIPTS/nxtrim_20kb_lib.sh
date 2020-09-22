#!/bin/bash

t1=$(date +%s)

nxtrim --rf --separate --aggressive --minlength 25 --output-prefix 20kb_lib -1 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_BYU/20kb_matepair_S3/20kb-matepair_S3_L003_R1_001.fastq.gz -2 /Volumes/G-SPEED_Shuttle_TB3/GENOME_SEQ_BYU/20kb_matepair_S3/20kb-matepair_S3_L003_R2_001.fastq.gz


t2=$(date +%s)
echo "execution time"$((t2 -t1))
