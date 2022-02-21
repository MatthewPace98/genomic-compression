#!/bin/bash

c=2 # compression level

for sample in ${samples[@]};
do
        echo $sample
	time dsrc c -m${c} -t1 ${sample}_R1.fastq ${sample}_R2.fastq ${sample}.dsrc
done
