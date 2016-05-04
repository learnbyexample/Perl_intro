#!/usr/bin/perl
use strict;
use warnings;

my $str = 'sample string';
$str =~ s/sample/test/;
print "simple replace:              $str\n";

# different delimiters like |,#,% etc can be used instead of /
my $date = '25/04/2016';
$date =~ s|/|-|g;
print "using different delimiter:   $date\n";

# use \ when you need to match special characters
my $greeting = '***** Have a great day *****';
$greeting =~ s/\*/=/g;
print "replacing special character: $greeting\n";

# pattern extraction
my $words = 'night and day';
$words =~ s/(\w+)( and )(\w+)/$3$2$1/;
print "swapping words:              $words\n\n";

# changing case of matched pattern
my $sentence = 'thIs iS a saMple StrIng';
print "\$sentence:     $sentence\n";
$sentence =~ s/^([a-z])(.*)/\U$1\L$2/;
print "Changing case: $sentence\n\n";

# e modifier
my $numbers = '34 28 91 42 5';
print "\$numbers:  $numbers\n";
$numbers =~ s/(\d+)/$1%5/ge;
print "numbers%5: $numbers\n\n";

# one can also call subroutines with e modifier
# use r modifier to retain original variable and assign output to another
$numbers = '1 2 3 4 5';
my $numbers_factorial = $numbers =~ s/(\d+)/num_fact($1)/ger;
print "\$numbers: $numbers\n";
print "numbers!: $numbers_factorial\n\n";

sub num_fact
{
    my ($num) = @_;
    return ($num == 0) ? 1 : $num * num_fact($num - 1);
}

# backreferencing in defining match pattern
my $line = 'Can you spot the the mistakes? I i seem to not';
print "\$line:     $line\n";
$line =~ s/\b(\w+) \1/$1/gi;
print "corrected: $line\n";
