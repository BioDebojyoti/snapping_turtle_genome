#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=talon
#SBATCH --time=72:00:00
#SBATCH --mem=190000
#SBATCH --exclusive
####SBATCH --job-name=gmap.map
#SBATCH --workdir=./
####SBATCH -o ./format.2.gff3.clc.gmap_map.out.txt
####SBATCH -e ./format.2.gff3.clc.gmap_map.err.txt
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

n=$(nproc)
n=$((n - 2))

GENOME_DIR=$1
GENOME_DB_NAME=$2
TRANSCRIPTOME=$3

OUTPUT_GFF3_BASE=$(echo $TRANSCRIPTOME | awk 'BEGIN{FS="/";}{gsub(".fasta","",$NF); print $NF}')

echo "Genome directory :"$GENOME_DIR
echo "Genome db name   :"$GENOME_DB_NAME
echo "Transcriptome    :"$TRANSCRIPTOME
echo "PROCESSORS COUNT :"$n

GMAP_GSNAP_BIN="/home/debojyoti.das/software/GMAP-GSNAP/build_dir/bin"

PATH=${GMAP_GSNAP_BIN}:${PATH}


start=$(date +%s)

gmap --dir=$GENOME_DIR --db=$GENOME_DB_NAME --nthreads=$n --format=2 $TRANSCRIPTOME > "gmap_format_2_gff3_"${OUTPUT_GFF3_BASE}.gff3

stop=$(date +%s)

echo "execution time: "$((stop -start))
