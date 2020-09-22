#!/bin/bash
#####Number of nodes
#SBATCH -N  1
#SBATCH -p  LM
#SBATCH -t 336:00:00
#SBATCH --mem=1920GB
#SBATCH --job-name=denovo_assembly
#SBATCH --workdir=./
#SBATCH -o ./denovo_assembly.out
#SBATCH -e ./denovo_assembly.err
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

# echo commands to stdout 
set -x

# move to working directory
cd $SCRATCH

start_time1=$(date +%s)
echo "start time for preparing input files " $start_time1

# load modules
module load allpaths-lg/52488
module load picard/2.17.0

echo -e "\n Prepare input data \n"

# Prepare input data
PrepareAllPathsInputs.pl DATA_DIR=$PWD/snapping_turtle/data IN_GROUPS_CSV=$PWD/snapping_turtle/data/in_groups.csv IN_LIBS_CSV=$PWD/snapping_turtle/data/in_libs.csv PICARD_TOOLS_DIR=/opt/packages/picard/2.17.0 PLOIDY=2 REFERENCE_DIR=$PWD/snapping_turtle

stop_time1=$(date +%s)

execution_time1=$(expr $stop_time1 - $start_time1)
echo -e "Total execution time " $execution_time1 " seconds \n "
echo -e "\t \t" $(($execution_time1/60)) " minutes \n"
echo -e "\t \t" $(($execution_time1/3600)) " hours \n"

echo -e "\n Assemble data \n"

start_time2=$(date +%s)
echo "start time for assembly " $start_time2

# Assemble data
RunAllPathsLG PRE=$PWD DATA_SUBDIR=data REFERENCE_NAME=snapping_turtle RUN=run OVERWRITE=True

stop_time2=$(date +%s)
echo "Final time " $stop_time2


execution_time2=$(expr $stop_time2 - $start_time2)
