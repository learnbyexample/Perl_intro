#!/usr/bin/perl
use strict;
use warnings;

my $prev_num = 0;
my $curr_num = 0;
print "The first 10 numbers in fibonacci sequence:\n";
for(my $i = 0; $i < 10; $i++)
{
    print "$curr_num ";
    if($i == 0)
    {
        $curr_num = 1;
        # skip rest of the loop and start next iteration
        next;
    }
    my $temp  = $curr_num;
    $curr_num = $curr_num + $prev_num;
    $prev_num = $temp;
}
print "\n";
