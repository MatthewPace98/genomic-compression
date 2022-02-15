#!/bin/bash

t=1 # threads

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
	echo $sample

	/usr/bin/time -v samtools view \
	--threads $t \
	--reference Homo_sapiens.GRCh38.dna.primary_assembly.fasta \
	-C -o $sample.cram \
	$sample.bam
done
