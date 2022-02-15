#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=cram
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --output=slurm.cram.%J.out

t=16 # threads
s1=/scratch/mpace21/CRAM_$t
s2=$s1/output_$t
h1=/homes/mpace21/zipping
h2=$h1/cram_dir

mkdir $s1
mkdir $s2

samtools view \
--threads $t \
--reference /data/target_id/dna/raw_data/resources/refGenomes/hg38/bwa-GATK/Homo_sapiens_assembly38.fasta \
-C -o ./D97.post.sortNMMD.cram \
./D97.post.sortNMMD.bam
