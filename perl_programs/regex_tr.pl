#!/usr/bin/perl
use strict;
use warnings;

my $greeting = '===== Have a great day =====';
$greeting =~ tr/=/*/;
print "$greeting\n";

# s modifier lets you 'squash' repetitive character sequences
my $lose = "Don't loose hope :)";
$lose =~ tr/a-zA-Z//s;
print "$lose\n";

# d modifier is used to delete characters
# c modifier complements the searchlist
my $sentence = "Th'i1s is34 a; senten6#ce";
$sentence =~ tr/a-zA-Z //cd;
print "$sentence\n";

# r modifier lets you retain original variable untouched and assign modified string to another variable
my $uppercase_quote = 'SIMPLICITY IS THE ULTIMATE SOPHISTICATION';
my $lowercase_quote = $uppercase_quote =~ tr/A-Z/a-z/r;
print "$lowercase_quote\n";

# tr can be used to count matching characters
my $mixed_str  = 'He has 5 cricket bats, 2 sets of stumps and a glove set';
my $letter_cnt = $mixed_str =~ tr/a-zA-Z//;
my $digit_cnt  = $mixed_str =~ tr/0-9//;
print "\$mixed_str: $mixed_str\n";
print "\$mixed_str has $letter_cnt letters and $digit_cnt digits\n";
