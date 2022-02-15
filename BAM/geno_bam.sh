#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=gbam2t
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --output=slurm.gbam2t.%J.out

t=2
s=/scratch/mpace21
s1=$s/BAM
s2=$s1/geno${t}t

mkdir $s1
mkdir $s2

h=/homes/mpace21/dna_storage/zipping/BAM

cp /homes/mpace21/misc/*genozip* $s1

samples=(HTS154_1 HTS154_2 HTS154_3)

for sample in ${samples[@]};
do
	echo $sample
	cp $h/${sample}.bam $s1
	/usr/bin/time -v genozip \
	--reference $s1/*.ref.genozip \
	--output $s2/${sample}.bam.genozip \
	$s1/${sample}.bam
done

ls -l $s2
mv $s2 /homes/mpace21/dna_storage/zipping/genozip_dir/BAM
rm -r $s1
