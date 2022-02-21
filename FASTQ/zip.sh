#!/bin/bash

c=1 #compression level
samples=(D2 D3 D4)

for sample in ${samples[@]};
do
        echo $sample
	time zip -$c ${sample}.zip ${sample}_R1.fastq ${sample}_R2.fastq

done
