#############################################
# Author: Komal Rathi
# Function: Creates list of CDL specific genes
##############################################

library(biomaRt)
library(dplyr) 

# use hg19
grch37 <- useMart(biomart="ENSEMBL_MART_ENSEMBL", host="grch37.ensembl.org", path="/biomart/martservice", dataset="hsapiens_gene_ensembl")
la <- listAttributes(grch37)
lf <- listFilters(grch37)

# genes implicated in CDL
dat <- read.delim('data/CDL_genes.txt', header = F)

res <- getBM(attributes = c("hgnc_symbol","ensembl_gene_id","refseq_mrna","ensembl_exon_id","gene_biotype","chromosome_name","start_position","end_position","strand"),
      filters = "hgnc_symbol", 
      values = dat$V1, 
      mart = grch37)
res$strand <- ifelse(res$strand == "-1", '-','+')
res <- res %>% filter(refseq_mrna != "") %>% 
  group_by(hgnc_symbol, ensembl_gene_id, refseq_mrna, gene_biotype, chromosome_name, start_position, end_position, strand) %>% 
  summarise(Exons = toString(ensembl_exon_id), 
            Exon.count = n())

write.table(res, file = 'data/CDL_genes.list', quote = F, sep = "\t", row.names = F)

# for analysis
dat <- read.delim('/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/CDL_genes.list', check.names = F)
dat <- unique(dat[,c('hgnc_symbol','ensembl_gene_id','strand','chromosome_name','start_position','end_position','gene_biotype')])
write.table(dat, file = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/CDL_genes_analysis_input.list', quote = F, sep = "\t", row.names = F, col.names = F)

