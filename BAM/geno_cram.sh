#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=gcram2t
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --output=slurm.gcram2t.%J.out

s=/scratch/mpace21
sample=HTS154_1

mkdir /scratch/mpace21/CRAM/

/usr/bin/time -v genozip \
--reference $s/misc/Homo_sapiens_assembly38.ref.genozip \
--output $s/CRAM/${sample}.cram.genozip \
${sample}.cram
