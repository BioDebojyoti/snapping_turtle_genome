#!/bin/bash
#####Number of nodes
#SBATCH -N  1
#SBATCH -p  LM
#SBATCH -t 336:00:00
#SBATCH --mem=2016GB
#SBATCH -A tr4ifmp
#SBATCH --job-name=seal_assembly_gap
#SBATCH --workdir=./
#SBATCH -o ./seal_assembly_gap_out.txt
#SBATCH -e ./seal_assembly_gap_err.txt
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

# echo commands to stdout 
set -x

start_time1=$(date +%s)
echo "Initial time " $start_time1

# move to working directory
cd /pylon5/tr4ifmp/pcddas 

# copy input files

#cp /pylon2/tr4ifmp/pcddas/INPUT_DATA/two_step_corrected_63_3_subreads*.fq.gz .
#cp /pylon2/tr4ifmp/pcddas/INPUT_DATA/genome.fasta .

# gunzip files
#for file in two_step_corrected_63_3_subreads*.fq.gz; do gunzip -c "${file}" > "${file/.fq*/.fastq}"; done

# rm two_step_corrected_63_3_subreads*.fq.gz

# load module
module load python/2.7.11_gcc
module load blasr/1.3.1
module load pbjelly/15.8.24

#cp /home/pcddas/UND_CHAMPION/jellyProtocol.xml .

# fakeQuals.py for reference
#fakeQuals.py genome.fasta genome.qual


# running the gap sealing procedure

for stage in setup mapping support extraction assembly output
do
   Jelly.py $stage jellyProtocol.xml
done


stop_time1=$(date +%s)
execution_time1=$(expr $stop_time1 - $start_time1)
echo -e "execution time " $execution_time1 " seconds \n "
echo -e "\t \t" $(($execution_time1/60)) " minutes \n"
echo -e "\t \t" $(($execution_time2/3600)) " hours \n"

# unload module
module unload python/2.7.11_gcc
module unload blasr/1.3.1
module unload pbjelly/15.8.24
