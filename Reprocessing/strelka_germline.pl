use Parallel::ForkManager;
use Data::Dumper;
use File::Slurp;
use File::Basename;

my @samples = read_file '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/MendelianRNA-seq/data/strelka_test_samples.txt';
# my $bamdir = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/strelka_out/bams';
my $bamdir = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/aligned/for-igv';
my $fasta = '/mnt/isilon/cbmi/variome/reference/hg19_GTEx_v6p/Homo_sapiens_assembly19.fasta';
# my $strelkabin = '/mnt/isilon/maris_lab/target_nbl_ngs/shared_resources/apps/strelka-2.9.2.centos6_x86_64/bin';
my $strelkabin = '/mnt/isilon/maris_lab/target_nbl_ngs/shared_resources/apps/strelka-2.9.4.release_src/bin';
my $strelkaout = '/mnt/isilon/cbmi/variome/rathik/mendelian_rnaseq/strelka_out/deduped_test';

# start time
my $start_run = time();

# run parallel jobs
my $pm=new Parallel::ForkManager(8);

foreach (@samples)
{	
	$pm->start and next;

		chomp($_);
		$bam = $_;

		print "$bam,\n";

		# no need to use MANTA here
		my $strelka = "$strelkabin/configureStrelkaGermlineWorkflow.py --bam=$bamdir/$bam".".sorted.deduped.bam --referenceFasta=$fasta --rna --runDir=$strelkaout/$bam";
		print $strelka,"\n";
		system($strelka);

		my $strelkascript = "$strelkaout/$bam/runWorkflow.py -m local -j 8";
		print $strelkascript,"\n";
		system($strelkascript);

	$pm->finish;
}

$pm->wait_all_children;

# end time
my $end_run = time();
my $run_time = $end_run - $start_run;
print "Job took $run_time seconds\n";
