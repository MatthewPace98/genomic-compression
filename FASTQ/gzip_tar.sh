#!/bin/bash

# compression level was manually inputted after 'gzip'

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
        echo $sample
	time tar -I 'gzip -6' -c -v -f ${sample}.tar.gz ${sample}_R1.fastq ${sample}_R2.fastq
done
