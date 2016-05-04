#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV != 0)
{
    print STDERR "Please provide exactly one filename as command line argument\nExiting program\n";
    exit(1);
}
else
{
    my $filename = $ARGV[0];
    unless(-f $filename)
    {
        print STDERR "File '$filename' not found\nExiting program\n";
        exit(1);
    }
    
    # $0 special variable contains the name of program being executed
    if($0 =~ m/line_count.pl/)
    {
        print "No. of lines in '$filename' is: ".`wc -l < $filename`;
    }
    if($0 =~ m/word_count.pl/)
    {
        print "No. of words in '$filename' is: ".`wc -w < $filename`;
    }
}
