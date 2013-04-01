#! /usr/bin/perl
###############
# fetch-files.pl
#
# Takes the input list of bigrams generated from justice names and downloads the
# associated ngram files from google.
#
# the URLs for the files we want look like this:
# http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-3gram-20120701-<>.gz
# where <> is replaced by the initial bigram for the entries in that file.
#
# In other words, perl used in place of a shell script.
###############

use strict;
use warnings;
use autodie qw(open close);
use Getopt::Long;

#defaults
my $usage = "usage: fetch-files.pl [--justice-list=file] [--baseurl=URL] targetdir\n";
my $justice_file = "justices_to_match.txt";
my $baseurl = "http://storage.googleapis.com/books/ngrams/books/";
my $filecollection = "googlebooks-eng-all-3gram-20120701-";
my $suffix = "gz";

GetOptions(
    'baseurl=s' => \$baseurl,
    'justice-list=s' => \$justice_file
) or die $usage ;

if ($#ARGV != 0 ) {
	print $usage;
	exit;
}
my $targetpath = $ARGV[0];

open my $justice_fh, "<", $justice_file;

#the array for the download bigrams
my @bigramlist;

while (<$justice_fh>) {
  chomp;
  my @supr_item = split("\t", $_);
  
  #add the initial bigram to the list
  push (@bigramlist, lc substr($supr_item[0], 0, 2));
}

#remove duplicate bigrams
my @unique_bigrams = uniq(@bigramlist);
my $count = 1;

#download the files to hadoop file system, die if interrupted.
foreach (@unique_bigrams) {
  chomp;
  print "downloading $count of ".scalar @unique_bigrams.": $baseurl$filecollection$_.$suffix\n";
  system("curl $baseurl.$filecollection$_.$suffix > $filecollection.$_.$suffix");
  if ($? & 127){
    die "I'm skewered!!! ";
  }
  $count++;
}

close $justice_fh;

#this also exists in MoreUtils, but I wanted to put a map in here
sub uniq {
    return keys %{{ map { $_ => 1 } @_ }};
}