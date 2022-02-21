#!/bin/bash

c=1  # compression level
O=b  #b: compressed BCF, u: uncompressed BCF, z: compressed VCF, v: uncompressed VCF
samples=(D2 D3 D4)

for sample in ${samples[@]};
do
	echo $sample
	/usr/bin/time -v bcftools view \
	-l$c \
	-O $O \
	-o $sample*bcf \
	$sample.g.vcf
done


