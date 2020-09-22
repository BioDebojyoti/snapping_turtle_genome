#!/bin/bash
#####Number of nodes
#SBATCH --nodes=1
#########Number of tasks per node
#SBATCH --partition=talon-fat
######SBATCH --oversubscribe
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=72
#SBATCH --job-name=busco
#SBATCH --workdir=./
#SBATCH -o ./busco-denovo1.out
#SBATCH -e ./busco-denovo1.err

start=`date +%s`

export AUGUSTUS_CONFIG_PATH=/home/debojyoti.das/augustus/config/
export LD_LIBRARY_PATH=/home/debojyoti.das/software/anaconda3/lib:${LD_LIBRARY_PATH}

python /home/debojyoti.das/busco/scripts/run_BUSCO.py --cpu 72 --blast_single_core --in $1 --out DENOVO_BUSCO_PILON_VERSION_4_ALL_FILES_NEW --lineage_path /home/debojyoti.das/busco/LINEAGE/vertebrata_odb9 --mode genome

stop=`date +%s`

runtime=$((stop - start))

echo "Time elapsed",$runtime

