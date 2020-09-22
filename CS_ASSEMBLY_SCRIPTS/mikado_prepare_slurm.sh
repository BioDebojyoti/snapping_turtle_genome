#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=talon-fat
#SBATCH --time=180:10:00
#SBATCH --exclusive
#SBATCH --job-name=mikado
#SBATCH --workdir=./
#SBATCH -o ./mikado.prepare.out.txt 
#SBATCH -e ./mikado.prepare.err.txt 
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

n=$(nproc)

start=$(date +%s)

echo "PROCESSOR COUNT :"$n

MIKADO_BIN="/home/debojyoti.das/software/anaconda3/envs/python_3.5_env/bin"

$MIKADO_BIN/python $MIKADO_BIN/mikado prepare --procs $n --minimum_length 100 --json-conf configuration.yaml

stop=$(date +%s)

echo "execution time "$((stop - start))


