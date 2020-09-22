#!/bin/bash
#####Number of nodes
#SBATCH -N6
#########Number of tasks per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
##########
#SBATCH --job-name=41_3_parallel_two_step_iterated_correction
#SBATCH --workdir=./
######SBATCH --workdir=./
#SBATCH -o ./parallel_lordec_two_step_iterated_correction_41_3_out.txt 
#SBATCH -e ./parallel_lordec_two_step_iterated_correction_41_3_err.txt 
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

start_time=$(date +%s)

echo "Initial time " $start_time

export PATH=$PATH:/home/debojyoti.das/DE_NOVO_ASSEMBLY/LoRDEC-0.5.3-Linux/bin:/home/debojyoti.das/DE_NOVO_ASSEMBLY/parallel-20171022

DATA_DIR=/home/debojyoti.das/pacbio_correction
DBG_DIR=/home/debojyoti.das/pacbio_correction

seq 1 6 | parallel lordec-correct -T 8 -m 62000 -a 100000 -i $DATA_DIR/two_step_corrected_21_3_subreads{}.fasta -2 $DBG_DIR/illumina_41_3 -k 41 -s 3 -o two_step_corrected_41_3_subreads{}.fasta 

stop_time=$(date +%s)

echo "Final time " $stop_time

execution_time=$(expr $stop_time - $start_time)

echo -e "Execution time " $execution_time " seconds \n "
echo -e "\t \t" $(($execution_time/60)) " minutes \n"
echo -e "\t \t" $(($execution_time/3600)) " hours \n"
