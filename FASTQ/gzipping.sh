#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=gzip1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=15
#SBATCH --output=slurm.gzip1.%J.out

n=1

s1=/scratch/mpace21/gzip9_$n
s2=$s1/output_$n
h1=/homes/mpace21/zipping
h2=$h1/gzip_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
time cp $h1/*.fastq $s1
echo 'Finished copying'

echo 'D2...'
time gzip -c -$n $s1/D2_R1.fastq $s1/D2_R2.fastq > $s2/D2.gz
echo 'D3...'
time gzip -c -$n $s1/D3_R1.fastq $s1/D3_R2.fastq > $s2/D3.gz
echo 'D4...'
time gzip -c -$n $s1/D4_R1.fastq $s1/D4_R2.fastq > $s2/D4.gz

echo 'Moving from scratch to home...'
mv $s2 $h2
echo 'Taking out the trash...'
rm -r $s1
