#!/usr/bin/perl
use strict;
use warnings;

print "Hi there! What's your name? ";
my $usr_name  = <STDIN>;
print "And your favorite color is? ";
my $usr_color = <STDIN>;

# use chomp to remove trailing \n character from a string
chomp($usr_name);
chomp($usr_color);
print "\n$usr_name, I like the $usr_color color too :)\n";
