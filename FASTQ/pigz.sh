#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=pigz
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=slurm.pigz.1t6c.%J.out

t=1 # threads
c=6 # compression
s1=/scratch/mpace21/pigz${c}c${t}t
s2=$s1/${c}c${t}t
h1=/homes/mpace21/zipping
h2=$h1/pigz_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
cp $h1/*.fastq $s1
echo 'Finished copying'

echo 'D2...'
time pigz -c -$c -p $t $s1/D2_R1.fastq $s1/D2_R2.fastq > $s2/D2.gz
echo 'D3...'
time pigz -c -$c -p $t $s1/D3_R1.fastq $s1/D3_R2.fastq > $s2/D3.gz
echo 'D4...'
time pigz -c -$c -p $t $s1/D4_R1.fastq $s1/D4_R2.fastq > $s2/D4.gz

ls -l $s2

echo 'Taking out the trash...'
rm -r $s1
