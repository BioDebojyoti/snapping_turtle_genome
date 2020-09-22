#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=talon-fat
#SBATCH --time=180:10:00
#SBATCH --exclusive
#SBATCH --job-name=mikado
#SBATCH --workdir=./
#SBATCH -o ./mikado.blastx.out.txt 
#SBATCH -e ./mikado.blastx.err.txt 
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

n=$(nproc)

start=$(date +%s)

echo "PROCESSOR COUNT :"$n

makeblastdb -in uniprot_sprot.fasta -dbtype prot -parse_seqids > blast_prepare.log

blastx -max_target_seqs 5 -num_threads $n -query mikado_prepared.fasta -outfmt 5 -db uniprot_sprot.fasta -evalue 0.000001 2> blast.log | sed '/^$/d' | gzip -c - > mikado.blast.xml.gz

stop=$(date +%s)

echo "execution time "$((stop - start))
