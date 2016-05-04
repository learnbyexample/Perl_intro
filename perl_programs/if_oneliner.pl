#!/usr/bin/perl
use strict;
use warnings;

my $number = 45;

# single statement if
print "Hurray! $number is greater than 25\n" if($number > 25);

# alternative to single-statement if-elsif-else structure
my $print_str = 'neither postive nor a negative';
$print_str = 'a negative' if($number < 0);
$print_str = 'a positive' if($number > 0);
print "$number is $print_str number\n";
