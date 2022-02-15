#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=dsrc1t2c
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=slurm.dsrc1t2c.%J.out

t=1 # threads
c=2 # compression
s1=/scratch/mpace21/Fastqfiles
s2=$s1/${c}c${t}t
h1=/homes/mpace21/zipping
h2=$h1/DSRC_dir

mkdir $s1
mkdir $s2

#echo 'Copying...'
#cp $h1/*.fastq $s1
#echo 'Finished copying'

echo 'D2...'
time dsrc c -m${c} -t${t} $s1/D2_R1.fastq $s1/D2_R2.fastq $s2/D2.dsrc

echo 'D3...'
time dsrc c -m${c} -t${t} $s1/D3_R1.fastq $s1/D3_R2.fastq $s2/D3.dsrc

echo 'D4...'
time dsrc c -m${c} -t${t} $s1/D4_R1.fastq $s1/D4_R2.fastq $s2/D4.dsrc

ls -l $s2
