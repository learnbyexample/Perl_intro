#!/usr/bin/perl
use strict;
use warnings;

my $num1 = 25;
if($num1 & 1)
{
    print "$num1 is odd\n";
    my $num2 = $num1 + 1;
}
else
{
    print "$num1 is even\n";
    my $num2 = $num1 + 2;
}
print "next even number after $num1 is $num2\n";
