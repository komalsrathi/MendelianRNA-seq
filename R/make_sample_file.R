samples <- list.dirs('/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/fastq', full.names=F,recursive=T)
samples <- samples[samples != ""]
write.table(samples, file = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/samples.txt', quote = F, row.names = F, col.names = F)
