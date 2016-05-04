#!/usr/bin/perl
use strict;
use warnings;

# Storing output of external command 'pwd'
my $curr_working_dir = `pwd`;
print "Your current working directory is: $curr_working_dir";
