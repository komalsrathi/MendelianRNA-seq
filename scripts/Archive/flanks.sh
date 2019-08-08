fetchChromSizes hg19 > hg19.chrom.sizes
grep -v gene ../annotation/gencode.v19.cdl_genes.v7.patched_contigs.exons.txt | sed 's/^/chr/g' - > gencode.v19.cdl_genes.v7.patched_contigs.exons.bed
bedtools flank -i gencode.v19.cdl_genes.v7.patched_contigs.exons.bed -g hg19.chrom.sizes -b 10 > gencode.v19.cdl_genes.v7.patched_contigs.exons_flanks.bed 
