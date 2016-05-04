#!/usr/bin/perl
use strict;
use warnings;

# continuously ask user string until it is a palindrome
my $usr_string = 'not a palindrome';
while($usr_string ne reverse($usr_string))
{
    print "Enter a palindrome string: ";
    $usr_string = <STDIN>;
    chomp($usr_string);
}
