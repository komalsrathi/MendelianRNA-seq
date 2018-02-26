source activate mendelian-rnaseq-env
snakemake -p -j 1 --nolock --configfile config.yaml --cluster-config cluster.yaml --snakefile Snakemake_2ndpass_CreateGenome
