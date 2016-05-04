#!/usr/bin/perl
use strict;
use warnings;

# ----- calling subroutine without arguments -----
print_greeting();

sub print_greeting
{
    print "-----------------------------\n";
    print "         Hello World         \n";
    print "-----------------------------\n";
}

# ----- passing arguments by value -----
my @numbers = (1 .. 100);
my $sum_of_1_to_100 = array_sum(@numbers);
print "Sum of numbers from 1 to 100 is: $sum_of_1_to_100\n\n";

sub array_sum
{
    my $sum = 0;
    $sum += $_ foreach (@_);
    return $sum;
}

# ----- passing arguments by reference -----
my ($min, $max);
my @values = (34, 234, 0, 64, 97, 18, 53);
min_max(\$min, \$max, @values);

print "\@values:   @values\n";
print "Min value: $min\n";
print "Max value: $max\n";

sub min_max
{
    my ($min_ref, $max_ref, @values_arr) = @_;
    # sort array numerically in ascending order
    my @sorted_arr = sort {$a <=> $b} @values_arr;
    $$min_ref = $sorted_arr[0];
    $$max_ref = $sorted_arr[-1];
}
