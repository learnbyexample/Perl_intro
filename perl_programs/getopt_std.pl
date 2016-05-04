#!/usr/bin/perl
use strict;
use warnings;

use Getopt::Std;
our ($opt_h, $opt_f);
getopts('hf:');

if($opt_h)
{
    print "----------------------------------------------------------------\n";
    print "This program sorts a given file and removes any duplicate lines\n\n";
    print "Usage:\n";
    print "./getopt_std.pl -h \t\tDisplays this help\n";
    print "./getopt_std.pl -f filename \tfile to be sorted uniquely\n";
    print "----------------------------------------------------------------\n";
}
elsif($opt_f)
{
    # no need file test if default behavior of command serves the purpose
    my $cmd_exit_value = system("sort -u $opt_f -o $opt_f");
    print "$opt_f is now uniquely sorted\n" unless($cmd_exit_value);
}
else
{
    print "Oops! Something went wrong\nUse './getopt_std.pl -h' to get help\n";
}
