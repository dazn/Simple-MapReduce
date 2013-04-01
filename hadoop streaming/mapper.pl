#! /usr/bin/perl
###############
# mapper.pl
#
# Reads from stdin (hadoop stream) and matches items against the list produced from the wikipedia
# data.  
#
# The justice's name must appear in the 3-gram, and the year must be equal to or later than the 
# appointment year
#
# The fields are written out in a different order so that the index for the reduce step is sorted
# by year rather than by justice name.
###############

use strict;
use warnings;
use justice_data;

my @justices = get_justices();
my @years = get_years();

my $min_year = get_min_year();

#many other options, this is less code but is still somewhat optimized.
my @justices_qr = compile_regex(); 

while(<>) {
  chomp;  
  my @line=split "\t",$_;
  my $threegram = $line[0];
  my $year = $line[1];
  my $appearances = $line[2];
  my $count;
  
  if($min_year <= $year) {
  	$count=0;
    foreach (@justices_qr) {
      if ($year >= $years[$count] && $threegram =~ $_) {
      	#This is slow but easy to read.  For more speed split strings and use equality?
        print "$year\t$appearances\n";
      }
      $count++;
    }
    #check if the 3-gram contains a justice name, if that matches, check that the year is in range
    #if both, output the year and the count for the reduce to take care of.
  }
}

sub get_min_year {
  return $years[0];
}#finds the first appointment year from the list of justices.

sub compile_regex {
  my @compiled;
  foreach (@justices) {
    #Only using files starting with correct bigram, matches will only be at line start.
    push (@compiled, qr/^$_/);
  }
  return @compiled;
}#compiles the array passed to it into an array of compiled regexes