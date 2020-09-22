#!/bin/bash
#####Number of nodes
#SBATCH -N  1
#SBATCH -p  LM
#SBATCH -t 336:00:00
#SBATCH --mem=2016GB
#SBATCH -A tr4ifmp
#SBATCH --workdir=./
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

# echo commands to stdout 

genome=$1

fraglib1=$2 # 200bp lib1
fraglib2=$3 # 200bp lib7
fraglib3=$4 # 200bp lib8

jumpslib1=$5 # 3kb lib1
jumpslib2=$6 # 3kb lib2
jumpslib3=$7 # 5.2kb 
jumpslib4=$8 # 10kb 
jumpslib5=$9 # 20kb 

unpairedlib1=${10}
unpairedlib1=${11}
unpairedlib1=${12}
unpairedlib1=${13}
unpairedlib1=${14}
unpairedlib1=${15}
unpairedlib1=${16}
unpairedlib1=${17}
unpairedlib1=${18}
unpairedlib1=${19}


n=$(nprocs)

module load java/jdk8u73
module load pilon/1.16


java -jar $PILON_HOME/pilon-1.16.jar --threads $n --genome $genome --frags $fraglib1 --frags $fraglib2 --frags $fraglib3 --jumps $jumpslib1 --jumps $jumpslib2 --jumps $jumpslib3 --jumps $jumpslib4 --jumps $jumpslib5 --unpaired $unpairedlib1 --unpaired $unpairedlib2 --unpaired $unpairedlib3 --unpaired $unpairedlib4 --unpaired $unpairedlib5 --unpaired $unpairedlib6 --unpaired $unpairedlib7 --unpaired $unpairedlib8 --unpaired $unpairedlib9


module unload java/jdk8u73
module unload pilon/1.16
