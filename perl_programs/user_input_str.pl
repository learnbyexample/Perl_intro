#!/usr/bin/perl
use strict;
use warnings;

# Ask for string input
print "Hi there! What's your name? ";
my $usr_name  = <STDIN>;
print "And your favorite color is? ";
my $usr_color = <STDIN>;

print "\n$usr_name, I like the $usr_color color too :)\n";
