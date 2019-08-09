# Various ways to filter splice junctions
# normalized values
python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10.txt

# normalized values, at least 10 read support across full dataset and only found in 1 sample 
python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -n_samples 1 > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_Only1Sample.txt

# normalized values, at least 10 read support across full dataset, filter any sample with < 5 reads support, and only found in 1 sample 
python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -filter_n_reads 5 > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_FilterReads5.txt

# normalized values, at least 10 read support across full dataset, filter any sample with < 2 reads support, and only found in 1 sample 
python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -filter_n_reads 2 > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_FilterReads2.txt

# normalized values, at least 10 read support across full dataset, filter any sample with < 3 reads support, and only found in 1 sample 
python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -filter_n_reads 3 > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_FilterReads3.txt

# normalized values, at least 10 read support across full dataset, filter any sample with < 5 reads support, only found in 1 sample and add OMIM annotation
python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -filter_n_reads 5 -add_OMIM > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/FilteredJunctions_ReadSupport10_FilterReads5_omim.txt
