#!/usr/bin/perl
use strict;
use warnings;

my $random_num;
while(1)
{
    $random_num = int(rand(500));
    last if($random_num % 4 == 0 && $random_num % 6 == 0);
}
print "Random number divisible by 4 and 6: $random_num\n";
