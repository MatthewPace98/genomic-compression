#!/bin/bash

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
        echo $sample

	/usr/bin/time -v genozip \
	--reference Homo_sapiens.GRCh38.dna.primary_assembly.ref.genozip \
	--output ${sample}.cram.genozip \
	output_1default_samtools/${sample}.cram
done


