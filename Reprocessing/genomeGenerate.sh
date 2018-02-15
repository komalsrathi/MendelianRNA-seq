#!/bin/bash

STAR \
--runMode genomeGenerate \
--runThreadN 16 \
--genomeDir /mnt/isilon/cbmi/variome/reference/star_db/hg19_GTEx_v6p \
--genomeFastaFiles /mnt/isilon/cbmi/variome/reference/hg19_GTEx_v6p/Homo_sapiens_assembly19.fasta \
--outFileNamePrefix /mnt/isilon/cbmi/variome/reference/star_db/hg19_GTEx_v6p/ \
--sjdbGTFfile /mnt/isilon/cbmi/variome/reference/gencode/v19_GTEx_v6p/gencode.v19.genes.v6p_model.patched_contigs.gtf \
--sjdbOverhang 99
