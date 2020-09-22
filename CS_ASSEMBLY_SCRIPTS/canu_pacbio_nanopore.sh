#!/bin/bash
#####Number of nodes
#SBATCH --nodes=1
#SBATCH --partition=talon-fat
#SBATCH --nodelist=talon04
#SBATCH --time=360:00:00
#SBATCH --job-name=canu
#SBATCH --workdir=./
#SBATCH -o ./canu_all.out
#SBATCH -e ./canu_all.err


START=$(date +%s)

/home/debojyoti.das/software/anaconda3/envs/canu_env/bin/canu useGrid=0 -p cserpentina_mix_all -d cserpentina_mix_all genomeSize=2.5g -pacbio-raw Pacbio.all.fastq.gz -nanopore-raw Nanopore.all.runs.fastq.gz

STOP=$(date +%s)

DIFF=$((STOP - START))

echo "Execution time is " $DIFF

#####export LD_LIBRARY_PATHLD_LIBRARY_PATH=/home/debojyoti.das/software/anaconda3/lib/:${LD_LIBRARY_PATH}
