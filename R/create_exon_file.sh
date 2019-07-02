# get exon coordinates for all transcripts
# grep -P '\texon\t' /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.genes.v7.patched_contigs.gtf |  grep -e \"AFF4\" -e \"ANKRD11\" -e \"ASXL1\" -e \"ASXL3\" -e \"HDAC8\" -e \"NIPBL\" -e \"PACS1\" -e \"RAD21\" -e \"SMC1A\" -e \"SMC3\" -e \"STAG2\" -e \"TAF1\" -e \"TAF6\" -e \"WDR26\" -e \"BRD4\"  | awk '{
# for (i = 1; i <= NF; i++){
# if ($i==$1 || $i==$4 || $i==$5 || $i==$7 || $(i-1) ~ /gene_name|exon_number|exon_id/){
# printf "%s ", $i
# }}                                                                                               
# print "" }' - | sed -e 's/;//g' -e 's/"//g' -e 's/ /\t/g' -e 's/\t$//g' > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_genes.v7.patched_contigs.exons.txt 

# get exon coordinates for canonical transcripts only
# grep -P '\texon\t' /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.transcripts.patched_contigs.gtf |  grep -e \"AFF4\" -e \"ANKRD11\" -e \"ASXL1\" -e \"ASXL3\" -e \"HDAC8\" -e \"NIPBL\" -e \"PACS1\" -e \"RAD21\" -e \"SMC1A\" -e \"SMC3\" -e \"STAG2\" -e \"TAF1\" -e \"TAF6\" -e \"WDR26\" -e \"BRD4\"  | awk '{
# for (i = 1; i <= NF; i++){
# if ($i==$1 || $i==$4 || $i==$5 || $i==$7 || $(i-1) ~ /gene_name|exon_number|exon_id|transcript_id/){
# printf "%s ", $i
# }}                                                                                               
# print "" }' - | sed -e 's/;//g' -e 's/"//g' -e 's/ /\t/g' -e 's/\t$//g' > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_transcripts.v7.patched_contigs.exons.txt 
# cut -f2 /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/CDL_canonical_transcripts.txt | grep -v Transcript_ID > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/tmp.txt
# grep -f /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/tmp.txt /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_transcripts.v7.patched_contigs.exons.txt > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_canonical_transcripts.v7.patched_contigs.exons.txt
# rm /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/tmp.txt

# only CDS regions
grep -P '\tCDS\t' /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.transcripts.patched_contigs.gtf |  grep -e \"AFF4\" -e \"ANKRD11\" -e \"ASXL1\" -e \"ASXL3\" -e \"HDAC8\" -e \"NIPBL\" -e \"PACS1\" -e \"RAD21\" -e \"SMC1A\" -e \"SMC3\" -e \"STAG2\" -e \"TAF1\" -e \"TAF6\" -e \"WDR26\" -e \"BRD4\"  | awk '{
for (i = 1; i <= NF; i++){
if ($i==$1 || $i==$4 || $i==$5 || $i==$7 || $(i-1) ~ /gene_name|exon_number|exon_id|transcript_id/){
printf "%s ", $i
}}                                                                                               
print "" }' - | sed -e 's/;//g' -e 's/"//g' -e 's/ /\t/g' -e 's/\t$//g' > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_transcripts.v7.patched_contigs.exons.txt 
cut -f2 /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/CDL_canonical_transcripts.txt | grep -v Transcript_ID > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/tmp.txt
grep -f /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/tmp.txt /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_transcripts.v7.patched_contigs.exons.txt > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_canonical_transcripts.v7.patched_contigs.exons.txt
rm /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/tmp.txt
rm /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/annotation/gencode.v19.cdl_transcripts.v7.patched_contigs.exons.txt
