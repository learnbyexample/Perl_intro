# <a name="list,-array-and-hash-variables"></a>List, Array and Hash variables

* [lists](#lists)
* [arrays](#arrays)
* [Iterating over arrays](#iterating-over-arrays)
* [Hashes](#hashes)


<br>

### <a name="lists"></a>lists

List provides an easy way to group different values/variables together

```perl
my ($str1, $num1, $char1) = ('Good day', 2, 'x');
my ($str2, $num2, $char2) = ("$str1 to you :)", 42, 'y');
```

<br>

### <a name="arrays"></a>arrays

Arrays provide a way to keep scalar values together in a single variable

```perl
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
```

* as can be inferred from the above example, array can be built and resized dynamically
* scalar variables use `$` as prefix while `@` is used for arrays
* individual items of array are accessed in scalar context using the `$` prefix
* common array operations like printing, size, adding/deleting items, slicing etc are easily handled without having to explicitly use loops

```
$ ./arrays.pl
@places: Bangalore Chennai Coimbatore
@prime_numbers: 2 3 5 7
@mixed_arr: Hello 1 q Bangalore Chennai Coimbatore Harry Potter
My favorite books: Harry Potter, Sherlock Holmes, To Kill a Mocking Bird

First item in @places: Bangalore
Last  item in @places: Coimbatore
Third last item in @mixed_arr: Chennai
2nd and 3rd item in @prime_numbers: 3 5

Index of last item in @places: 2
Number of items in @places:    3

Manually add item: Bangalore Chennai Coimbatore Salem
shift:             Chennai Coimbatore Salem
pop:               Chennai Coimbatore
push:              Chennai Coimbatore Mysore
unshift:           Hyderabad Chennai Coimbatore Mysore
$#places = 1       Hyderabad Chennai
$#places = -1      
```

<br>

### <a name="iterating-over-arrays"></a>Iterating over arrays

```perl
#!/usr/bin/perl
use strict;
use warnings;

my @numbers = (2, 12, 3, 25, 624, 21, 5, 9, 12);
my (@odd_numbers, @even_numbers);

foreach my $item (@numbers)
{
    push(@odd_numbers,  $item) if($item % 2 != 0);
    push(@even_numbers, $item) if($item % 2 == 0);
}

print "\@numbers:      @numbers\n";
print "\@odd_numbers:  @odd_numbers\n";
print "\@even_numbers: @even_numbers\n";
```

* `foreach` loop is useful to iterate over an array when we only need its items and not worry about indices or array size

```
$ ./foreach_loop.pl
@numbers:      2 12 3 25 624 21 5 9 12
@odd_numbers:  3 25 21 5 9
@even_numbers: 2 12 624 12
```

If you do need indices, use the range operator

```perl
for my $i (0 .. $#numbers)
{
    print "$numbers[$i] ";
}
```

<br>

### <a name="hashes"></a>Hashes

Hash, or associative array, is similar to array, but each element has a key associated with it instead of numbered indices  
Hash variable is prefixed with %

```perl
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
```

* as opposed to arrays which are ordered, hashes are un-ordered
* keys are unique and associated with a scalar value
* note that `foreach` used for printing hashes is just iterating over an array returned by `keys %marks`

```
$ ./hashes.pl
Rahul's mark: 86
Favorite detective book: Sherlock Holmes

All the keys of %marks: Rohit Rajan Rahul
All the values of %fav_book: Harry Potter, Sherlock Holmes, The Da Vinci Code

printing %marks by iterating over keys
Rohit: 75
Rajan: 79
Rahul: 86
```

