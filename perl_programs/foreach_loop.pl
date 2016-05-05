#!/usr/bin/perl
use strict;
use warnings;

my @numbers = (2, 12, 3, 25, 624, 21, 5, 9, 12);
my (@odd_numbers, @even_numbers);

foreach my $item (@numbers)
{
    push(@odd_numbers,  $item) if($item % 2 != 0);
    push(@even_numbers, $item) if($item % 2 == 0);
}

print "\@numbers:      @numbers\n";
print "\@odd_numbers:  @odd_numbers\n";
print "\@even_numbers: @even_numbers\n";
