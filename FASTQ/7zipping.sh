#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=7zp1t1c
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=slurm.7zip.1c1t.%J.out

t=1
n=1
s1=/scratch/mpace21/7zip_${t}t_${n}c
s2=$s1/output_${t}t_${n}c
h1=/homes/mpace21/zipping
h2=$h1/7zip_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
cp $h1/*.fastq $s1
echo 'Finished copying'

echo 'D2...'
time 7z a -mx=$n $s2/D2.7z $s1/D2_R1.fastq $s1/D2_R2.fastq
echo 'D3...'
time 7z a -mx=$n $s2/D3.7z $s1/D3_R1.fastq $s1/D3_R2.fastq
echo 'D4...'
time 7z a -mx=$n $s2/D4.7z $s1/D4_R1.fastq $s1/D4_R2.fastq

echo 'Taking out the trash...'
rm -r $s1
