# Author: Komal S. Rathi
# Date: 02/15/2018
# Function: Create sample sheet (one sample per line)

setwd('/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq')
samples <- list.dirs('../fastq', full.names = F, recursive = T)
samples <- samples[samples != ""]
write.table(samples, file = 'data/samples.txt', quote = F, row.names = F, col.names = F)
