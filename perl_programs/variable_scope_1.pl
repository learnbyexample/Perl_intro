#!/usr/bin/perl
use strict;
use warnings;

my $num1 = 25;
print_num();

sub print_num
{
    print "Yeehaw! \$num1 is visible in this scope, its value is: $num1\n";
}
