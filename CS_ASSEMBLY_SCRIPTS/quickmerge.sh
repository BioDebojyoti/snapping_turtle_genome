#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=talon-fat
#SBATCH --time=60:10:00
#SBATCH --job-name=scaffolding
#SBATCH --workdir=./
#SBATCH -o ./quickmerge.out.txt 
#SBATCH -e ./quickmerge.err.txt
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

#The following line must be run to allow the script to find quickmerge in the path

export PATH=/home/debojyoti.das/software/quickmerge:/home/debojyoti.das/software/quickmerge/MUMmer3.23:$PATH

source /home/debojyoti.das/software/quickmerge/.quickmergerc

nprocessor=$(nproc)

echo $nprocessor

t1=$(date +%s)

merge_wrapper.py -pre $1 -hco $2 -c $3 -l $4 -ml $5 $6 $7
#merge_wrapper.py -pre run2 -hco 5.0 -c 1.5 -l 1358478 -ml 5000 "cserpentina_mix_all.contigs.fasta" "all_upper_Cserpentina_all_files.fasta" 

t2=$(date +%s)
echo -e "merge wrapper execution time: "$((t2 - t1))

