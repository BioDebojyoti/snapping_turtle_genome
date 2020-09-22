#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=talon-fat
#SBATCH --time=120:00:00
#SBATCH --mem=2880000
#SBATCH --exclusive
#SBATCH --job-name=gmap_build
#SBATCH --workdir=./
#SBATCH -o ./gmap_build.out.txt
#SBATCH -e ./gmap_build.err.txt
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

n=$(nproc)

GENOME_DIR=$1
GENOME_DB_NAME=$2
FASTA_FILES=$3

echo "Genome directory :"$GENOME_DIR
echo "Genome db name   :"$GENOME_DB_NAME
echo "PROCESSORS COUNT: "$n

GMAP_GSNAP_BIN="/home/debojyoti.das/software/GMAP-GSNAP/build_dir/bin"

PATH=${GMAP_GSNAP_BIN}:${PATH}


start=$(date +%s)

gmap_build --dir=$GENOME_DIR --db=$GENOME_DB_NAME --fasta-pipe="cat $GENOME_DIR/Contig*fa" 

stop=$(date +%s)

echo "execution time: "$((stop -start))

