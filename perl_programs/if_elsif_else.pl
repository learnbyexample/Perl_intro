#!/usr/bin/perl
use strict;
use warnings;

my $number = 45;

print "========== if ========== \n";
if($number > 25)
{
    print "Hurray! $number is greater than 25\n";
}

print "========== if-else ========== \n";
if($number % 2 == 0)
{
    print "$number is an even number\n";
}
else
{
    print "$number is an odd number\n";
}

print "========== if-elsif-else ========== \n";
if($number < 0)
{
    print "$number is a negative number\n";
}
elsif($number > 0)
{
    print "$number is a positive number\n";
}
else
{
    print "$number is neither postive nor a negative number\n";
}
