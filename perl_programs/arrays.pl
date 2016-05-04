#!/usr/bin/perl
use strict;
use warnings;

# initializing arrays
my @places = ('Bangalore', 'Chennai', 'Coimbatore');
my @prime_numbers = (2, 3, 5, 7);
my @books;
$books[0] = 'Harry Potter';
$books[1] = 'Sherlock Holmes';
$books[2] = 'To Kill a Mocking Bird';
my @mixed_arr = ('Hello', 1, 'q', @places, $books[0]);

# ----- printing entire array -----
print "\@places: @places\n";
print "\@prime_numbers: @prime_numbers\n";
print "\@mixed_arr: @mixed_arr\n";
# use join to connect array items with preferred characters
print "My favorite books: ".join(', ', @books)."\n\n";

# ----- printing individual item -----
print "First item in \@places: $places[0]\n";
print "Last  item in \@places: $places[-1]\n";
print "Third last item in \@mixed_arr: $mixed_arr[-3]\n";

# ----- printing array slice -----
print "2nd and 3rd item in \@prime_numbers: @prime_numbers[1..2]\n\n";

# ----- array size -----
print "Index of last item in \@places: $#places\n";
my $arr_size = @places;
print "Number of items in \@places:    $arr_size\n\n";

# ----- manipulating array -----
# Add an item, same as $places[$#places + 1]
$places[3] = "Salem";
print "Manually add item: @places\n";

# Delete first item and shift left
shift(@places);
print "shift:             @places\n";
# Delete last item
pop(@places);
print "pop:               @places\n";

# Add an item at end of array
push(@places, "Mysore");
print "push:              @places\n";
# Add an item at beginning of array
unshift(@places, "Hyderabad");
print "unshift:           @places\n";

# change array size by assigning value to $#places
# Change no. of items to 2
$#places = 1;
print "\$#places = 1       @places\n";
# Change no. of items to 0
$#places = -1;
print "\$#places = -1      @places\n";
