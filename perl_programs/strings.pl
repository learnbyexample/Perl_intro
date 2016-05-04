#!/usr/bin/perl
use strict;
use warnings;

# strings are declared inside single or double quotes
my $str1 = 'This is a string';
print "$str1\n";

# Use single quotes to prevent interpretation of special characters 
my $greeting = 'Hello\tWorld';
print "$greeting\n";

# Use double quotes to allow interpretation of special characters 
$greeting = "Hello\tWorld";
print "$greeting\n";

# numbers and strings can be freely mixed
my $num   = 42;
my $quote = "The Ultimate Answer to Life, The Universe and Everything is...$num!";
print "$quote\n";

my $str_num = "16";
my $sum     = $num + $str_num;
print "$num + $str_num = $sum\n";

# string concatenation operator
my $concatenated_str = "$str1"." with concatenation";
print "$concatenated_str\n";

# string multiplication operator
my $multiplied_str = "$num" x 5;
print "Printing 42 five times: $multiplied_str\n";
