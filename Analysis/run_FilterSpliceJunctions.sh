python FilterSpliceJunctions.py -splice_file All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10.txt

python FilterSpliceJunctions.py -splice_file All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -n_samples 1 > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_Only1Sample.txt

python FilterSpliceJunctions.py -splice_file All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -filter_n_reads 5 > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_FilterReads5.txt

python FilterSpliceJunctions.py -splice_file All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -filter_n_reads 5 -add_OMIM > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_FilterReads5_omim.txt

# python FilterSpliceJunctions.py -splice_file All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -sample_with_highest_normalized_read_support > Sample_HighestReadSupport.txt
