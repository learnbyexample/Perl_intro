#!/usr/bin/perl
use strict;
use warnings;

my $add_value = 5;

sub print_num
{
    # check what happens if you omit () and understand why
    my ($num) = @_;
    printf "$num + $add_value = %d\n", ($num + $add_value);
}

sub main
{
    my $number = 25;
    print_num($number);
}

main();
