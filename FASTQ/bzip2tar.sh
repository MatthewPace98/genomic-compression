#!/bin/bash

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
	time BZIP2=-1 tar -c -v -j -f ${sample}.tar.bz2 ${sample}_R1.fastq ${sample}_R2.fastq
done
