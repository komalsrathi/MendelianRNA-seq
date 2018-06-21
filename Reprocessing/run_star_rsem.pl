use Parallel::ForkManager;
use Data::Dumper;
use File::Slurp;

my @samples = read_file '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/samples.txt';
my $stargenomedir = '/mnt/isilon/cbmi/variome/reference/star_db/hg38_no_alt';
my $STAR = '/mnt/isilon/cbmi/variome/rathik/tools/miniconda3/envs/rnaseq-env/bin/STAR';
my $rsem = '/mnt/isilon/cbmi/variome/rathik/tools/miniconda3/envs/rnaseq-env/bin/rsem-calculate-expression';
my $rsemgenomedir = '/mnt/isilon/cbmi/variome/reference/rsem_db/hg38/hg38';
my $fastqdir = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/fastq';
my $aligndir = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/aligned/expression';

# start time
my $start_run = time();

# run parallel jobs
my $pm=new Parallel::ForkManager(20);

foreach (@samples)
{	
	$pm->start and next;

		chomp($_);
		$sample = $_;
		print $sample,"\n";
		my $starcmd = "$STAR --runThreadN 6 --genomeDir $stargenomedir --readFilesIn $fastqdir/$sample/$sample"."_pe_1.fq.gz $fastqdir/$sample/$sample"."_pe_2.fq.gz --readFilesCommand zcat --outFileNamePrefix $aligndir/$sample"."_ --outSAMtype None --outSAMunmapped Within --quantMode TranscriptomeSAM --outSAMattributes NH HI AS NM MD --outFilterType BySJout --outFilterMultimapNmax 20 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.04 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --sjdbScore 1 --limitBAMsortRAM 50000000000";
		if (-f $sample."_Log.final.out") {
			print "STAR output exists!\n";
		} else {
			print "STAR output does not exist\n";
			print $starcmd,"\n";
			system($starcmd);
		}
		

		my $rsemcmd = "$rsem --paired-end --no-bam-output --quiet --no-qualities -p 6 --forward-prob 0.5 --seed-length 25 --fragment-length-mean -1.0 --bam $aligndir/$sample"."_Aligned.toTranscriptome.out.bam $rsemgenomedir $aligndir/$sample";
		if (-f $sample.".genes.results") {
			print "RSEM output exists!\n";
		} else {
			print "RSEM output does not exist\n";
			print $rsemcmd,"\n";
			system($rsemcmd);
		}

	$pm->finish;
}

$pm->wait_all_children;

# end time
my $end_run = time();
my $run_time = $end_run - $start_run;
print "Job took $run_time seconds\n";
