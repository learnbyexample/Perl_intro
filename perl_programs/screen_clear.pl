#!/usr/bin/perl
use strict;
use warnings;

# Executing external command 'clear'
system("clear");

# Note the use of single quotes
system('echo Hello $USER');
