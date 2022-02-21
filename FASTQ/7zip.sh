#!/bin/bash

samples=(D2 D3 D4)
c=1 # compression level

for sample in ${samples[@]};
do
        echo $sample
	time 7z a -mx=$c ${sample}.7z ${sample}_R1.fastq ${sample}_R2.fastq
done
