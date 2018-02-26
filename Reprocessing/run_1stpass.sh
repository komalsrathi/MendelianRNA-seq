source activate mendelian-rnaseq-env
snakemake -p -j 16 --nolock --configfile config.yaml --cluster-config cluster.yaml --snakefile Snakemake_1stpass
