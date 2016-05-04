#!/usr/bin/perl
use strict;
use warnings;

# extracing words from a sentence
my $string = 'This is a sample string';
my @words = split /\s+/, $string;
print "\$string: $string\n";
print "words:   ".join(', ', @words)."\n\n";

# extracting letters from a word
my @letters = split //, $words[0];
print "splitting '$words[0]' into letters: @letters\n";

# saving even the pattern used to split
my $data = 'Rahul : 75 : 68 : 90';
my @columns = split /(\W+)/, $data;
print "\$data:    $data\n";
print "columns: ";
print "'$_' " foreach(@columns);
print "\n\n";

# using a count value to limit number of splits
my $info = '46 ways to publish a novel';
my @info_split = split /\s+/, $info, 2;
print "\$info:           $info\n";
print "\$info_split[0] = $info_split[0]\n";
print "\$info_split[1] = $info_split[1]\n";
