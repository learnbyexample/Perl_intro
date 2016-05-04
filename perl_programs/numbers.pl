#!/usr/bin/perl
use strict;
use warnings;

# integers
my $num1 = 7;
my $num2 = 42;
my $sum  = $num1 + $num2;
print "$num1 + $num2 = $sum\n";

# floating numbers 
my $appx_pi  = 22 / 7;
my $area     = 42.16;
my $new_area = $area + $appx_pi;
print "22/7 = $appx_pi\n";
print "$area + 22/7 = $new_area\n";

# scientific notation
my $sci_num1 = 3.982e5;
my $sci_num2 = 9.32e-1;
my $sci_sum  = $sci_num1 + $sci_num2;
print "$sci_num1 + $sci_num2 = $sci_sum\n";

# octal and hex
my $oct_num = 012;
my $hex_num = 0xF;
my $mix_sum = $oct_num + $hex_num;
print "$oct_num + $hex_num = $mix_sum\n";

# different type of numbers can be easily used together
my $int_float_sum = $num1 + $area;
print "$num1 + $area = $int_float_sum\n";
