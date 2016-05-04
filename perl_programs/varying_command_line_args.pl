#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV < 0)
{
    print STDERR "Please provide atleast one filename as command line argument\nExiting program\n";
    exit(1);
}
else
{
    foreach (@ARGV)
    {
        # -f option checks if the argument is a plain file
        if( !(-f $_) )
        {
            print "File '$_' not found\n";
            next;
        }
        
        my $line_count = `wc -l < $_`;
        chomp($line_count);
        printf "%-30s: %-4d lines\n", $_, $line_count;
    }
}
