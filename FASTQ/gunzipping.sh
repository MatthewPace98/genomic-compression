#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=gunzip6c
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=slurm.gunzip6c.%J.out

n=6
s1=/scratch/mpace21/Fastqfiles
s2=$s1/gunzip_$n
h1=/homes/mpace21/zipping
h2=$h1/gunzip_dir

mkdir $s2

#echo 'Copying...'
#cp $h1/*R1.fastq $s/gunzip_$n
#echo 'Finished copying'
echo 'Gzipping'
#gzip -c -$n $s/D2_R1.fastq > $s/gunzip_$n/D2_R1.fastq.gz
gzip -c -$n $s1/D3_R1.fastq > $s2/D3_R1.fastq.gz
#gzip -c -$n $s/D4_R1.fastq > $s/gunzip_$n/D4_R1.fastq.gz

echo 'D2_R1...'
time gunzip $s2/D2_R1.fastq.gz > $s2/D2_R1.out.fastq
echo 'D3_R1...'
time gunzip $s2/D3_R1.fastq.gz > $s2/D3_R1.out.fastq
echo 'D4_R1...'
time gunzip $s2/D4_R1.fastq.gz > $s2/D4_R1.out.fastq

