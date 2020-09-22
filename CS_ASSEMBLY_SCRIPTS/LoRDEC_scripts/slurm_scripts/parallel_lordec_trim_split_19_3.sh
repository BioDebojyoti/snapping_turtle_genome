#!/bin/bash
#####Number of nodes
#SBATCH -N6
#########Number of tasks per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
##########
#SBATCH --job-name=parallel_trim_split_19_3
#SBATCH --workdir=./
######SBATCH --workdir=./
#SBATCH -o ./parallel_trim_split_19_3_out.txt 
#SBATCH -e ./parallel_trim_split_19_3_err.txt 
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

start_time=$(date +%s)

echo "Initial time " $start_time

export PATH=$PATH:/home/debojyoti.das/DE_NOVO_ASSEMBLY/LoRDEC-0.5.3-Linux/bin:/home/debojyoti.das/DE_NOVO_ASSEMBLY/parallel-20171022

DATA_DIR=/home/debojyoti.das/pacbio_correction

seq 1 6 | parallel lordec-trim-split -i $DATA_DIR/corrected_19_3_subreads{}.fasta -o corrected_trim_split_19_3_subreads{}.fasta 

stop_time=$(date +%s)

echo "Final time " $stop_time

execution_time=$(expr $stop_time - $start_time)

echo -e "Execution time " $execution_time " seconds \n "
echo -e "\t \t" $(($execution_time/60)) " minutes \n"
echo -e "\t \t" $(($execution_time/3600)) " hours \n"
