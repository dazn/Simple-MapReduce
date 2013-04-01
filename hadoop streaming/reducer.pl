#! /usr/bin/perl
###############
# reducer.pl
#
# Reads from stdin (hadoop stream) and totals the mentions of the justices by year, writing out the 
# total mentions of all the justices for each year that they appear.
#
###############

use strict;
use warnings;

my $prev_year = 0;
my $total = 0;

while(<>) {
  chomp;
  my ($year, $count) = split_data($_);
  if($year == $prev_year) {
      $total += $count;
  }
  else {
    if($prev_year){ print "$prev_year\t$total\n"; }
    $prev_year=$year;
    $total=$count;
  }
}
#print the last set of values
print "$prev_year\t$total\n";

sub split_data {
  my $str = $_;
  my $year = substr($str, 0, 4);
  my $count = substr($str, 5);
  return ($year, $count);
} #split the data on the tab at [4], don't keep it.  Benchmark says this is faster than split()/regex