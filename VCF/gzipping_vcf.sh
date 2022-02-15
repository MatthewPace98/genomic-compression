#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=gzipvcf
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --output=slurm.gzipvcf.%J.out

n=6

s1=/scratch/mpace21/gVCFs/
s2=$s1/output_$n

mkdir $s2

echo 'D2...'
time gzip -c -$n $s1/D2_raw_variants.g.vcf > $s2/D2.vcf.gz
echo 'D3...'
time gzip -c -$n $s1/D3_raw_variants.g.vcf > $s2/D3.gz
echo 'D4...'
time gzip -c -$n $s1/D4_raw_variants.g.vcf > $s2/D4.gz
