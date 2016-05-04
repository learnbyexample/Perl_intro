#!/usr/bin/perl
use strict;
use warnings;

use autodie;
use open qw< :encoding(ASCII) >;

my $filename = "new_file.txt";
my $out_file = undef;
open($out_file, ">", $filename);

print $out_file "This is a sample line of text\n";
print $out_file "Yet another line\n";

close($out_file);

# sanity check
system("cat new_file.txt");
