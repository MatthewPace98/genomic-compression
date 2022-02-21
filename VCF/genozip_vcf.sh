#!/bin/bash

c=fast # compression level
samples=(D2 D3 D4)

for sample in ${samples[@]};
do
	echo $sample
	/usr/bin/time -v genozip \
	--$c \
	--reference Homo_sapiens.GRCh38.dna.primary_assembly.ref.genozip \
	--output ${sample}.genozip \
	${sample}.g.vcf

done
