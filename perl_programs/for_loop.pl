#!/usr/bin/perl
use strict;
use warnings;

my $number = 9;
for(my $i = 1; $i < 5; $i++)
{
    my $mul_table = $number * $i;
    print "$number * $i = $mul_table\n";
}
