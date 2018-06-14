filename="/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/samples.txt"
while read -r line
do
    name="$line"
    echo "$name"
    python FilterSpliceJunctions.py -print_simple -splice_file /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/All.CDL_genes.normalized.splicing.txt -n_read_support 10 -include_normalized -sample_with_highest_normalized_read_support $name > /mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/splice-events/$name"_HighestReadSupport.txt"
done < "$filename"

#