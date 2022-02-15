#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=gziptar
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=15
#SBATCH --output=slurm.gzip9.%J.out

s1=/scratch/mpace21/gzip9_tar
s2=$s1/output9
h1=/homes/mpace21/zipping
h2=$h1/gzip_tar_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
time cp $h1/*.fastq $s1
echo 'Finished copying'

echo 'D2...'
time tar -I 'gzip -9' -c -v -f $s2/D2.tar.gz $s1/D2_R1.fastq $s1/D2_R2.fastq
echo 'D3...'
time tar -I 'gzip -9' -c -v -f $s2/D3.tar.gz $s1/D3_R1.fastq $s1/D3_R2.fastq
echo 'D4...'
time tar -I 'gzip -9' -c -v -f $s2/D4.tar.gz $s1/D4_R1.fastq $s1/D4_R2.fastq

echo 'Moving from scratch to home...'
mv $s2 $h2
echo 'Taking out the trash...'
rm -r $s1
