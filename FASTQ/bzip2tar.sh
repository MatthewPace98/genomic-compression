#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=bzip2ing.9
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=15
#SBATCH --output=slurm.bzip2.9.%J.out

n=9
s1=/scratch/mpace21/bzip2_tar_$n
s2=$s1/output_$n
h1=/homes/mpace21/zipping
h2=$h1/bzip2_tar_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
echo 'Finished copying'
cp $h1/*.fastq $s1

echo 'D2...'
time BZIP2=-$n tar -c -v -j -f $s2/D2.tar.bz2 $s1/D2_R1.fastq $s1/D2_R2.fastq
echo 'D3...'
time BZIP2=-$n tar -c -v -j -f $s2/D3.tar.bz2 $s1/D3_R1.fastq $s1/D3_R2.fastq
echo 'D4...'
time BZIP2=-$n tar -c -v -j -f $s2/D4.tar.bz2 $s1/D4_R1.fastq $s1/D4_R2.fastq

echo 'Moving from scratch to home...'
mv $s2 $h2
echo 'Taking out the trash...'
rm -r $s1
