#!/bin/bash

n=5 #compression level

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
        echo $sample
	time rar a -m$n ${sample}_D4.rar ${sample}_R1.fastq ${sample}_R2.fastq

done
