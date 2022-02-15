#!/bin/bash

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
	time bzip2 -1 -c ${sample}_R1.fastq ${sample}_R2.fastq > ${sample}.bz2
done
