#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=pbzip32t1c
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --output=slurm.pbzip.32t1c.%J.out

t=32 # threads
n=1 # compression
s1=/scratch/mpace21/pbzip2_${n}c${t}t
s2=$s1/output_${n}c${t}t
h1=/homes/mpace21/zipping
h2=$h1/pbzip2_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
cp $h1/*.fastq $s1
echo 'Finished copying'

# pbzip2 [ -123456789 ] [ -b#cdfhklm#p#qrS#tvVz ] [ filenames ... ]

echo 'D2...'
time pbzip2 -c -$n $s1/D2_R1.fastq $s1/D2_R2.fastq > $s2/D2.bz2
echo 'D3...'
time pbzip2 -c -$n $s1/D3_R1.fastq $s1/D3_R2.fastq > $s2/D3.bz2
#echo 'D4...'
time pbzip2 -c -$n $s1/D4_R1.fastq $s1/D4_R2.fastq > $s2/D4.bz2

# -S# Child thread stack size in 1KB steps (default stack size if unspecified)
# -r,--read Read entire input file into RAM and split between processors
# -c, --stdout Output to standard out (stdout)
# -p# Where # is the number of processors (default: autodetect)

echo 'Moving from scratch to home...'
mv $s2 $h2
echo 'Taking out the trash...'
rm -r $s1
