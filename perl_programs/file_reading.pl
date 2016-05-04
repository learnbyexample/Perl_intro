#!/usr/bin/perl
use strict;
use warnings;

my $filename = "hello_world.pl";
my $hello_file = undef;
open($hello_file, "< :encoding(ASCII)", $filename) || die "cannot open $filename for reading";

# read contents of file line by line
while(<$hello_file>)
{
    # $_ gets the line by default
    print $_;
}
close($hello_file) || die "cannot close $filename";
