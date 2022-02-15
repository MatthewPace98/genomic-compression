#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=geno16t
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --output=slurm.geno16t.%J.out

t=16
s=/scratch/mpace21
s1=$s/Fastqfiles
s2=$s1/geno${t}t
h1=/homes/mpace21/zipping
h2=$h1/genozip_dir

mkdir $s1
mkdir $s2

#echo 'Copying...'
#cp $h1/*.fastq $s1
#echo 'Finished copying'

samples=(D2 D3 D4)


for sample in ${samples[@]};
do
	echo $sample
	/usr/bin/time -v genozip \
	--reference $s/*.ref.genozip \
	--output $s2/${sample}_R1+R2.fastq.genozip\
	--pair $s1/${sample}_R1.fastq $s1/${sample}_R2.fastq
done

ls -l $s2
rm -r $s2
