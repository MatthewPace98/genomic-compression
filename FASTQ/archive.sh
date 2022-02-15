#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=genfq16t
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --output=slurm.genfq16t.%J.out

t=16
s1=/scratch/mpace21/gzipped_fastq
s2=$s1/geno${t}t
h1=/homes/mpace21/zipping
h2=$h1/genozip_dir

mkdir $s1
mkdir $s2

#echo 'Copying...'
#cp $h1/*.fastq $s1
#echo 'Finished copying'

for sample in ${samples[@]};
do
	echo $sample
	/usr/bin/time -v genozip \
	--reference $s1/*.ref.genozip \
	--output $s2/${sample}.fastq.genozip \
	--pair $s1/${sample}_R1.fastq.gz $s1/${sample}_R2.fastq.gz
done

ls -l $s2
