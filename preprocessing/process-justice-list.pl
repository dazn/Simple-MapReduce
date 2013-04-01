#! /usr/bin/perl
###############
# process-justice-list.pl
#
# takes the input list of justices from wikipedia and outputs the list 
# of justice names and appointment years for use in the hadoop mapper
###############

use strict;
use warnings;
use autodie qw(open close);

if ($#ARGV != 1 ) {
	print "usage: process-justice-list.pl inputfile justice_output_file\n";
	exit;
}

my $inputfile = $ARGV[0];
my $justice_outputfile = $ARGV[1];

open my $input_fh, "<", $inputfile;
open my $justice_fh, ">", $justice_outputfile;

#read the file line-by-line and output only the name and appointment year to the justice file
while (<$input_fh>) {
  chomp;
  my @supr_item = split("\t", $_);
    
  #the year appointed
  my @term = split("–",$supr_item[4]);
  my $appointed_year = $term[0];
  
  print $justice_fh $supr_item[1]."\t".$appointed_year."\n";  
}

close $input_fh;
close $justice_fh;
