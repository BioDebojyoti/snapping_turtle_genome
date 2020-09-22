#!/bin/bash
#####Number of nodes
#SBATCH -N1
#########Number of tasks per node
#SBATCH --ntasks-per-node=1
#SBATCH --partition=talon
#SBATCH --time=30:10:00
#SBATCH --exclusive
#SBATCH --job-name=mikado
#SBATCH --workdir=./
#SBATCH -o ./mikado.configure.out.txt 
#SBATCH -e ./mikado.configure.err.txt 
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

n=$(nproc)

start=$(date +%s)

LIST_TXT=$1
REFERENCE=$2
BLAST_TARGETS=$3

echo "LIST_TXT        :"$LIST_TXT
echo "REFERENCE       :"$REFERENCE
echo "BLAST_TARGETS   :"$BLAST_TARGETS
echo "PROCESSOR COUNT :"$n


MIKADO_BIN="/home/debojyoti.das/software/anaconda3/envs/python_3.5_env/bin"

$MIKADO_BIN/python $MIKADO_BIN/mikado configure --list $LIST_TXT --reference $REFERENCE --mode stringent --scoring human.yaml -bt $BLAST_TARGETS configuration.yaml

stop=$(date +%s)

echo "execution time "$((stop - start))

#mikado configure --list list.txt --reference chr5.fas --mode permissive --scoring plants.yaml  --copy-scoring plants.yaml --junctions junctions.bed -bt uniprot_sprot_plants.fasta configuration.yaml


