#!/usr/bin/perl
use strict;
use warnings;

# automatically handle open/close errors
use autodie;
# declare file encoding for all open functions in this program
use open qw< :encoding(ASCII) >;

my $filename = "file_doesnt_exist.txt";
my $handle = undef;
open($handle, "<", $filename);

# one can also declare another variable instead of using $_
while(my $line = <$handle>)
{
    print $line;
}
close($handle);
