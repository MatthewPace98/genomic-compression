#!/bin/bash

n=6 #compression level

samples=(D2 D3 D4)
for sample in ${samples[@]};
do
        echo $sample
	time gzip -c -$n ${sample}.g.vcf > ${sample}.gz
done
