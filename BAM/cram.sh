#!/bin/bash
#SBATCH --account=mpace21
#SBATCH --job-name=cram2
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --output=slurm.cram2.%J.out

t=2 # threads
s1=/scratch/mpace21/CRAM_$t
s2=$s1/output_$t
h1=/homes/mpace21/zipping
h2=$h1/cram_dir

mkdir $s1
mkdir $s2

echo 'Copying...'
cp $h1/HTS154_1.bam $s2
#cp /data/target_id/rna/testing/GRCh37_latest_genomic.fna $s1

echo 'Finished copying'

echo 'Cramming'
time samtools view \
--threads $t \
--reference $s1/GRCh37_latest_genomic.fna \
-C -o $s2/HTS154_1.cram \
$s2/HTS154_1.bam

echo 'Moving from scratch to home...'
mv $s2 $h2
echo 'Taking out the trash...'
rm -r $s1

#  -b       output BAM
#  -C       output CRAM (requires -T)
#  -1       use fast BAM compression (implies -b)
#  -u       uncompressed BAM output (implies -b)
#  -h       include header in SAM output
#  -H       print SAM header only (no alignments)
#  -c       print only the count of matching records
#  -o FILE  output file name [stdout]
#  -U FILE  output reads not selected by filters to FILE [null]
#  -t FILE  FILE listing reference names and lengths (see long help) [null]
#  -X       include customized index file
#  -M       use the multi-region iterator (increases the speed, removes
#           duplicates and outputs the reads as they are ordered in the file)
#  -x STR   read tag to strip (repeatable) [null]
#  -B       collapse the backward CIGAR operation
#  -?       print long help, including note about region specification
#  -S       ignored (input format is auto-detected)
#  --no-PG  do not add a PG line
#      --input-fmt-option OPT[=VAL]
#               Specify a single input file format option in the form
#               of OPTION or OPTION=VALUE
#  -O, --output-fmt FORMAT[,OPT[=VAL]]...
#               Specify output format (SAM, BAM, CRAM)
#      --output-fmt-option OPT[=VAL]
#               Specify a single output file format option in the form
#               of OPTION or OPTION=VALUE
#  -T, --reference FILE
#               Reference sequence FASTA FILE [null]
#  -@, --threads INT
#               Number of additional threads to use [0]
#      --write-index
#               Automatically index the output files [off]
#     --verbosity INT
