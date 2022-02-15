#!/bin/bash

n=9 #compression level

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
        echo $sample
	time zip -$n ${sample}.zip ${sample}_R1.fastq ${sample}_R2.fastq

done
