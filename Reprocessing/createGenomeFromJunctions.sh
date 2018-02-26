#!/bin/bash

STAR \
--runMode genomeGenerate \
--runThreadN 16 \
--genomeDir /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/aligned/2ndPass_genome \
--genomeFastaFiles /mnt/isilon/cbmi/variome/reference/hg19_GTEx_v6p/Homo_sapiens_assembly19.fasta \
--outFileNamePrefix /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/aligned/2ndPass_genome/ \
--sjdbGTFfile /mnt/isilon/cbmi/variome/reference/gencode/v19_GTEx_v6p/gencode.v19.genes.v6p_model.patched_contigs.gtf \
--sjdbFileChrStartEnd /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/aligned/final.filtered.SJout.tab \
--sjdbOverhang 99
