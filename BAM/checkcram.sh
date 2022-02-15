#!/bin/bash

t=16 # threads

out=check_bam_out
mkdir $out


samples=(D2 D3 D4)
for sample in ${samples[@]};
do
	inputbam=${sample}.bam
	outputvcf=$out/${sample}.vcf
	outputbam=$out/${sample}_HC.bam

	gatk HaplotypeCaller \
	--reference /data/target_id/dna/raw_data/resources/refGenomes/hg38/bwa-GATK/Homo_sapiens_assembly38.fasta \
	--input ${inputbam} \
	--emit-ref-confidence GVCF \
	-L /data/target_id/dna/raw_data/resources/refGenomes/hg38/bwa-GATK/resources-broad-hg38-v0-wgs_calling_regions.hg38.interval_list \
	-ip 100 \
	--min-base-quality-score 15 \
	--dbsnp /data/target_id/dna/raw_data/resources/annotationFiles/dbSNP/Homo_sapiens_assembly38.dbsnp138.vcf \
	--stand-call-conf 20 \
	--native-pair-hmm-threads 32 \
	--output ${outputvcf} \
	--bamout ${outputbam} \
	--tmp-dir /data/target_id/dna/results/dnaseq_results/TMP
done
