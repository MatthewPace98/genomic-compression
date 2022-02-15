#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=vcf16t
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --output=slurm.vcf16t.%J.out

t=16
s1=/scratch/mpace21/gVCFs
s2=$s1/geno${t}t
h1=/homes/mpace21/zipping
h2=$h1/genozip_dir

mkdir $s2

#echo 'Copying...'
#cp $h1/*.fastq $s1
#echo 'Finished copying'

samples=(D2 D3 D4)


for sample in ${samples[@]};
do
	echo $sample
	/usr/bin/time -v genozip \
	--reference $s1/*.ref.genozip \
	--output $s2/${sample}.genozip \
	$s1/${sample}_raw_variants.g.vcf
done

ls -l $s2
