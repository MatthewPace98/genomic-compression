#!/bin/bash
c=1
O=b

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

#    -l,   --compression-level [0-9]     compression level: 0 uncompressed, 1 best speed, 9 best compression [-1]
#    -o,   --output-file <file>          output file name [stdout]
#    -O,   --output-type <b|u|z|v>       b: compressed BCF, u: uncompressed BCF, z: compressed VCF, v: uncompressed VCF [v]
