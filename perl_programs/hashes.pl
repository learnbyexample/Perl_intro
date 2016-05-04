#!/usr/bin/perl
use strict;
use warnings;

# initializing hashes
my %marks = ('Rahul' => 86, 'Ravi' => 92, 'Rohit' => 75);
my %fav_book;
$fav_book{'fantasy'}   = 'Harry Potter';
$fav_book{'detective'} = 'Sherlock Holmes';
$fav_book{'thriller'}  = 'The Da Vinci Code';

# ----- Accessing individual element -----
print "Rahul's mark: $marks{'Rahul'}\n";
print "Favorite detective book: $fav_book{'detective'}\n\n";

# ----- Manipulating hashes -----
# adding element
$marks{'Rajan'} = 79;
# Deleting element
delete $marks{'Ravi'};

# ----- keys and values -----
my @marks_keys  = keys %marks;
print "All the keys of \%marks: @marks_keys\n";
my @book_values = values %fav_book;
print "All the values of \%fav_book: ".join(', ' , @book_values)."\n";

# ----- printing hashes -----
print "\nprinting \%marks by iterating over keys\n";
foreach my $marks_key (keys %marks)
{
    print "$marks_key: $marks{$marks_key}\n";
}
