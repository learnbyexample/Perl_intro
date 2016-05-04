#!/usr/bin/perl
use strict;
use warnings;

# Ask for user input
print "Enter a number: ";
my $usr_num    = <STDIN>;

my $square_num = $usr_num * $usr_num;
print "Square of entered number is: $square_num\n";
