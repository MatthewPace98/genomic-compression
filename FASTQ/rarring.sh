#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=rar.5
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=15
#SBATCH --output=slurm.rar.5.%J.out

n=5
s1=/scratch/mpace21/rar_$n
s2=$s1/output_$n
h1=/homes/mpace21/zipping
h2=$h1/rar_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
cp $h1/*.fastq $s1
echo 'Finished copying'

echo 'D2...'
time rar a -m$n $s2/D2.rar $s1/D2_R1.fastq $s1/D2_R2.fastq
echo 'D3...'
time rar a -m$n $s2/D3.rar $s1/D3_R1.fastq $s1/D3_R2.fastq
echo 'D4...'
time rar a -m$n $s2/D4.rar $s1/D4_R1.fastq $s1/D4_R2.fastq

echo 'Moving from scratch to home...'
mv $s2 $h2
echo 'Taking out the trash...'
rm -r $s1
