#!/bin/bash

#Pipeline to obtain differential alternative splicing events

#Original pipeline

#Alignment
#STAR 2.5.3a
#gencode comprehensive annotation from v24 Backmap 37

STAR --runThreadN 16  --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE1_S1_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE1_S1_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE1_S1_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE1_S1_L007_R2_001.fastq.gz --outFileNamePrefix HTE1
STAR --runThreadN 16  --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE2_S2_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE2_S2_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE2_S2_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE2_S2_L007_R2_001.fastq.gz --outFileNamePrefix HTE2
STAR --runThreadN 16  --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE3_S3_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE3_S3_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE3_S3_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE3_S3_L007_R2_001.fastq.gz --outFileNamePrefix HTE3
STAR --runThreadN 16  --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE4_S4_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE4_S4_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE4_S4_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE4_S4_L007_R2_001.fastq.gz --outFileNamePrefix HTE4

#rMATS for differential splicing analysis
#Newest rMATS v4.0.2
python /home/sam/bin/rMATS.4.0.2/rMATS-turbo-Linux-UCS4/rmats.py --nthread 8 --tstat 8 --b1 HTE_wt.txt --b2 HTE_kd.txt --gtf gencode.v24lift37.annotation.gtf --od HTE/HTE -t paired --readLength 100 --cstat 0.0001 --libType fr-firststrand

#--------------------------------------------

#Rerunning using better parameters

#Use newest version of STAR 2.6.1b
#Use the gencode basic annotation from v24 Backmap 37

#Generate the genome index
STAR --runThreadN 16 --runMode genomeGenerate --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --genomeFastaFiles ../annotations/GRCh37.primary_assembly.genome.fa --sjdbGTFfile ../annotations/gencode.v24lift37.basic.annotation.gtf --sjdbOverhang 99

#Run STAR
STAR --runThreadN 16  --outFilterMultimapNmax 1 --outSAMstrandField intronMotif --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE1_S1_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE1_S1_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE1_S1_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE1_S1_L007_R2_001.fastq.gz --outFileNamePrefix HTE1
STAR --runThreadN 16  --outFilterMultimapNmax 1 --outSAMstrandField intronMotif --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE2_S2_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE2_S2_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE2_S2_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE2_S2_L007_R2_001.fastq.gz --outFileNamePrefix HTE2
STAR --runThreadN 16  --outFilterMultimapNmax 1 --outSAMstrandField intronMotif --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTM3_S7_L002_R1_001.fastq.gz,../raw_fastq/CC-HTM3_S7_L007_R1_001.fastq.gz ../raw_fastq/CC-HTM3_S7_L002_R2_001.fastq.gz,../raw_fastq/CC-HTM3_S7_L007_R2_001.fastq.gz --outFileNamePrefix HTE3
STAR --runThreadN 16  --outFilterMultimapNmax 1 --outSAMstrandField intronMotif --outFilterType BySJout --alignSJoverhangMin 8 --alignSJDBoverhangMin 3 --alignEndsType EndToEnd --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat --genomeDir star_genomes/grch37_pri_gencode_v24_backmap_37_overhang_99 --readFilesIn ../raw_fastq/CC-HTE4_S4_L002_R1_001.fastq.gz,../raw_fastq/CC-HTE4_S4_L007_R1_001.fastq.gz ../raw_fastq/CC-HTE4_S4_L002_R2_001.fastq.gz,../raw_fastq/CC-HTE4_S4_L007_R2_001.fastq.gz --outFileNamePrefix HTE4

#--------------------------------------------

#rMATS for differential splicing analysis
#Newest rMATS v4.0.2

#rMATS variable parameter = cstat (cutoff used for null hypothesis test)

#Default parameter = 0.0001 (0.1% difference) (Loose)

python /home/sam/bin/rMATS.4.0.2/rMATS-turbo-Linux-UCS4/rmats.py --nthread 8 --tstat 8 --b1 HTE_wt.txt --b2 HTE_kd.txt --gtf ../annotations/gencode.v24lift37.basic.annotation.gtf --od HTE_c_0.0001 -t paired --readLength 100 --cstat 0.0001 --libType fr-firststrand &

#Strict parameter = 0.05 (5% difference) (Strict)

python /home/sam/bin/rMATS.4.0.2/rMATS-turbo-Linux-UCS4/rmats.py --nthread 8 --tstat 8 --b1 HTE_wt.txt --b2 HTE_kd.txt --gtf ../annotations/gencode.v24lift37.basic.annotation.gtf --od HTE_c_0.05 -t paired --readLength 100 --cstat 0.05 --libType fr-firststrand &

#--------------------------------------------

#Cuffdiff for differential gene expression
#Newest cuffdiff v2.2.1

cuffdiff -p 8 --max-bundle-frags 1000000000 --library-type fr-firststrand -o HTE_cuffdiff ../annotations/gencode.v24lift37.basic.annotation.gtf ../star_runs/HTE1Aligned.sortedByCoord.out.bam,../star_runs/HTE3Aligned.sortedByCoord.out.bam ../star_runs/HTE2Aligned.sortedByCoord.out.bam,../star_runs/HTE4Aligned.sortedByCoord.out.bam

#--------------------------------------------

#Parsing the rMATS data to pull out useful parameters such as replicate specific junction counts, PSI, etc.
#The parsing script also has the ability to filter by cutoffs, but defer this until later
#Just use all inclusive cutoffs such as fdr 1, -dpsi filter 0, -junction reads filter 0

#Original
ultimate_rMATS_parser_TURBO.py -rm original_rmats_turbo_runs/HTE/ -fdr 1.0 -dpsi 0.0 -reads 0 -s hte_turbo_original

#Loose
ultimate_rMATS_parser_TURBO.py -rm ../rMATS_runs_turbo/HTE_c_0.0001/ -fdr 1.0 -dpsi 0.0 -reads 0 -s hte_turbo_loose

#Strict
ultimate_rMATS_parser_TURBO.py -rm ../rMATS_runs_turbo/HTE_c_0.05/ -fdr 1.0 -dpsi 0.0 -reads 0 -s hte_turbo_strict






