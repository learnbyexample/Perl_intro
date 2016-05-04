#!/usr/bin/perl
use strict;
use warnings;

my $string = "This is a sample string";

# positive and negative match examples
print "\$string: $string\n\n";
print "\$string has the pattern 'is'\n" if($string =~ m/is/);
print "\$string does not have the pattern 'this'\n" if($string !~ m/this/);
print "\$string has the pattern 'this' when matching case-insensitively\n\n" if($string =~ m/this/i);

# check out what happens when \b is not used
if($string =~ m/\bis/)
{
    # single quotes used to clarify space character in output
    print "Pattern specified:             '\\bis'\n";
    print "String before matched pattern: '$`'\n";
    print "String matching pattern:       '$&'\n";
    print "String after matched pattern:  '$''\n\n";
}

# assigning matched pattern to variables
my ($word1) = $string =~ m/(s[a-z]*e)/i;
print "Word starting with 's' and ending with 'e': $word1\n";
my (@all_words) = $string =~ m/([a-z]+)/gi;
print "All words in \$string: ";
print "'$_' " foreach(@all_words);
print "\n\n";

# what happens when output is saved in scalar context
# again, single quotes used to clarify output
my $match_output = $string =~ m/is/;
print "Output when pattern matches: '$match_output'\n";
$match_output = $string =~ m/line/;
print "Output when pattern does not match: '$match_output'\n";
