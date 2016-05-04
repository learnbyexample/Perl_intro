#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV != 1)
{
    print STDERR "Please provide exactly two numbers as command line arguments\nExiting program\n";
    # usual convention to use exit values is '0' for success and '1' for error
    exit(1);
}
else
{
    my ($num1, $num2) = @ARGV;
    my $sum = $num1 + $num2;
    print "$num1 + $num2 = $sum\n";
}
