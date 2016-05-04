This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/)  
For more resources, visit [learnbyexample - scripting course](https://github.com/learnbyexample/scripting_course)

# <a name="table-of-contents"></a>Table of Contents
* [Introduction](#introduction)
* [Executing external commands](#external-commands)
* [Scalar Variables](#scalar-variables)
* [Getting User input](#user-input)
* [Control Structures](#control-structures)
* [List, Array and Hash variables](#list-array-hash)
* [Reference and Special Variables](#reference-special-variables)
* [Subroutines and Variable Scope](#subroutines-variable-scope)
* [Regular Expressions](#regular-expressions)
* [File handling](#file-handling)
* [Command line arguments](#command-line-arguments)
* [Debugging](#debugging)
* [Perl resources list](#resources-list)
* [To Do](#todo)


<br><br>
# <a name="introduction"></a>Introduction

From [wikipedia](https://en.wikipedia.org/wiki/Perl)
>Perl is a family of high-level, general-purpose, interpreted, dynamic programming languages. The languages in this family include Perl 5 and Perl 6

[Larry Wall](https://en.wikipedia.org/wiki/Larry_Wall) wrote the language as a **general purpose scripting language**, borrowing features from **C, shell scripting, awk, sed, grep, cut, sort** etc

It is quite easy to learn, especially if one is already familiar with programming and/or shell scripting.  Perl's easy to use and flexible syntax is both a boon and a curse. There's a running joke that Perl programs look the same before and after encryption, so we'll try to stick to a readable and consistent style over smart tricks in this introductory guide

### Installation
Get Perl for your OS from official website - https://www.perl.org/get.html

* Examples presented here is for **Unix-like systems**, Perl version 5.18.2 and uses **bash** shell
* You can also try running Perl code online, [tutorialspoint](http://www.tutorialspoint.com/execute_perl_online.php) is one of them
* It is assumed that you are familiar with command line. If not, check out [this basic tutorial on ryanstutorials](http://ryanstutorials.net/linuxtutorial/) and [this list of curated resources for Linux](https://github.com/learnbyexample/scripting_course/blob/master/Linux_curated_resources.md)

### Hello World example
Let's start with simple a Perl program and how to run it

```perl
#!/usr/bin/perl

print "Hello World\n";
```

The first line has two parts

* `/usr/bin/perl` is the path of Perl interpreter
* `#!` called as **[shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))**, directs the program loader to use the interpreter path provided

The third line prints the message `Hello World` with a `\n` character to print newline after the message

### Running Perl program
You can write the program using text editor like **gedit** or **[vim](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)**

After saving the file, give execute permission and run the program from a terminal

```
$ chmod +x hello_world.pl

$ ./hello_world.pl 
Hello World
```

To find out Perl path and Perl version in your system

```
$ type perl
perl is /usr/bin/perl

$ perl -v
This is perl 5, version 18, subversion 2 (v5.18.2) built for x86_64-linux-gnu-thread-multi
(with 44 registered patches, see perl -V for more detail)
...
```

**Further Reading**

* [Running Perl programs](http://perldoc.perl.org/perlintro.html#Running-Perl-programs) - for more options to run a Perl program

### Using compilation flags - strict and warnings

To avoid common programming mistakes and typos, it is helpful to always include these two compilation flags

**strict**

```perl
#!/usr/bin/perl
use strict;

print "Printing < $uninitialized > variable\n";
```
Let's see what happens when we try to execute this program:

```
$ ./strict.pl
Global symbol "$uninitialized" requires explicit package name at ./strict.pl line 4.
Execution of ./strict.pl aborted due to compilation errors.
```

**warnings**

```perl
#!/usr/bin/perl
use warnings;

print "\n----------------------------------------\n";
print "Printing < $uninitialized > variable\n";
print "----------------------------------------\n";
```
While **strict** flag aborts program execution, **warnings** flag executes the program but provides a more helpful message

```
$ ./warnings.pl
Name "main::uninitialized" used only once: possible typo at ./warnings.pl line 5.

----------------------------------------
Use of uninitialized value $uninitialized in concatenation (.) or string at ./warnings.pl line 5.
Printing <  > variable
----------------------------------------
```

**Further Reading**

* [Always use strict and warnings](http://perlmaven.com/always-use-strict-and-use-warnings)
* [Common warnings and error messages](http://perlmaven.com/common-warnings-and-error-messages)
* Perldoc: [strict](http://perldoc.perl.org/strict.html) and [warnings](http://perldoc.perl.org/warnings.html)


[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="external-commands"></a>Executing external commands
The sample output shown in this section will be different based on your username and working directories

### system()
Perl gives an easy syntax to execute external commands

```perl
#!/usr/bin/perl
use strict;
use warnings;

# Executing external command 'clear'
system("clear");

# Note the use of single quotes
system('echo Hello $USER');
```

* The first `system` statement clears the terminal screen
* The second one will print a personalized greeting message. Use of single quotes means Perl will pass the string `echo Hello $USER` to command line as it is

```
$ ./screen_clear.pl
<screen clears>


Hello learnbyexample
```

### backticks ``

```perl
#!/usr/bin/perl
use strict;
use warnings;

# Storing output of external command 'pwd'
my $curr_working_dir = `pwd`;
print "Your current working directory is: $curr_working_dir";
```

* to save output of external command in a variable, place the command within **``** instead of **system**. The backtick key is usually placed above Tab key in keyboard
* Using double quotes in the print statement means Perl will substitute the value of `$curr_working_dir` variable before printing
	* Note that output saved in the variable also includes a newline character

```
$ ./backticks.pl 
Your current working directory is: /home/learnbyexample/perl_programs
```

**Further Reading**

* [stackoverflow](http://stackoverflow.com/questions/3854651/how-can-i-store-the-result-of-a-system-command-in-a-perl-variable) - for more ways of working with external commands

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="scalar-variables"></a>Scalar Variables
A scalar variable holds a single value like **integer, character, string** etc. Perl treats them according to context. Scalar variable is identified by the `$` symbol prefixed to variable name

Since we are using the **strict** flag, we have to explicitly declare variables. For now, we'll use the `my` keyword and revisit the topic in a later section

Let's see some numbers first

```perl
#!/usr/bin/perl
use strict;
use warnings;

# integers
my $num1 = 7;
my $num2 = 42;
my $sum  = $num1 + $num2;
print "$num1 + $num2 = $sum\n";

# floating numbers 
my $appx_pi  = 22 / 7;
my $area     = 42.16;
my $new_area = $area + $appx_pi;
print "22/7 = $appx_pi\n";
print "$area + 22/7 = $new_area\n";

# scientific notation
my $sci_num1 = 3.982e5;
my $sci_num2 = 9.32e-1;
my $sci_sum  = $sci_num1 + $sci_num2;
print "$sci_num1 + $sci_num2 = $sci_sum\n";

# octal and hex
my $oct_num = 012;
my $hex_num = 0xF;
my $mix_sum = $oct_num + $hex_num;
print "$oct_num + $hex_num = $mix_sum\n";

# different type of numbers can be easily used together
my $int_float_sum = $num1 + $area;
print "$num1 + $area = $int_float_sum\n";
```
Running the program gives this output. Notice how Perl processes and saves them internally

```
$ ./numbers.pl
7 + 42 = 49
22/7 = 3.14285714285714
42.16 + 22/7 = 45.3028571428571
398200 + 0.932 = 398200.932
10 + 15 = 25
7 + 42.16 = 49.16
```

Let's see some strings now

```perl
#!/usr/bin/perl
use strict;
use warnings;

# strings are declared inside single or double quotes
my $str1 = 'This is a string';
print "$str1\n";

# Use single quotes to prevent interpretation of special characters 
my $greeting = 'Hello\tWorld';
print "$greeting\n";

# Use double quotes to allow interpretation of special characters 
$greeting = "Hello\tWorld";
print "$greeting\n";

# numbers and strings can be freely mixed
my $num   = 42;
my $quote = "The Ultimate Answer to Life, The Universe and Everything is...$num!";
print "$quote\n";

my $str_num = "16";
my $sum     = $num + $str_num;
print "$num + $str_num = $sum\n";

# string concatenation operator
my $concatenated_str = "$str1"." with concatenation";
print "$concatenated_str\n";

# string multiplication operator
my $multiplied_str = "$num" x 5;
print "Printing 42 five times: $multiplied_str\n";
```

Running the program:

```
$ ./strings.pl
This is a string
Hello\tWorld
Hello	World
The Ultimate Answer to Life, The Universe and Everything is...42!
42 + 16 = 58
This is a string with concatenation
Printing 42 five times: 4242424242
```

### Built-in Operators and Functions

* arithmetic operators
    * `+` addition, `-` subtraction, `*` multiplication, `/` division, `**` exponentiation, `%` modulo
    * `$i++` increment `$i` after returning value, `$i--` decrement `$i` after returning value
    * `++$i` increment `$i` and return value, `--$i` decrement `$i` and return value
* comparing numbers
    * `==` equal to, `>` greater than, `<` less than
    * `!=` not equal to, `>=` greater than or equal to, `<=` less than or equal to
    * `<=>` returns `-1, 0, 1` if the left argument is numerically `less than, equal to, greater than` the right argument respectively
* comparing strings
    * `eq` equal to, `gt` greater than, `lt` less than
    * `ne` not equal to, `ge` greater than or equal to, `le` less than or equal to
    * `cmp` returns `-1, 0, 1` if the left argument is stringwise `less than, equal to, greater than` the right argument respectively
* boolean logic
    * `&&` and, `||` or, `!` not
* bitwise operators
    * `&` and, `|` or, `^` exclusive or, `~` negation (1's complement)
* pattern
    * `=~` whether pattern matches when used with `m//`
    * `!~` whether pattern does not match when used with `m//`
    * `=~` change string according to `s///` or `tr///`
* miscellaneous
    * `.` string concatenation
    * `..` range operator, works for both numbers and strings
    * `x` string multiplication
    * `?:` conditional operator shorthand for `if-then-else`

* functions
    * `chomp` remove trailing `\n` character from a string only if present
    * `chop` remove trailing character from a string
    * `join` combine a list of scalar/array variables with desired pattern
    * `sort` for sorting alphabetically, numerically, etc
    * `reverse` for reversing string or list
    * and many more...

**Further Reading**

* [Perl operators](http://perldoc.perl.org/perlop.html)
* [Perl built-in functions](http://perldoc.perl.org/perlfunc.html)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="user-input"></a>Getting User input
Let's see how to get input from user

```perl
#!/usr/bin/perl
use strict;
use warnings;

# Ask for user input
print "Enter a number: ";
my $usr_num    = <STDIN>;

my $square_num = $usr_num * $usr_num;
print "Square of entered number is: $square_num\n";
```

Let us test the program by giving a number and a string

```
$ ./user_input.pl
Enter a number: 23
Square of entered number is: 529

$ ./user_input.pl
Enter a number: abc
Argument "abc\n" isn't numeric in multiplication (*) at ./user_input.pl line 8, <STDIN> line 1.
Square of entered number is: 0
```

* A number input gave us the expected result
* as we used **warnings** flags, we get a helpful warning message that something is probably wrong

Note that the warning message printed the user input as `"abc\n"`, meaning our variable has a `\n` character at the end. While it didn't affect the arithmetic operation(thanks to Perl's context aware computation), it can be problematic as a string input

Let's see an example to further illustrate this behavior

```perl
#!/usr/bin/perl
use strict;
use warnings;

# Ask for string input
print "Hi there! What's your name? ";
my $usr_name  = <STDIN>;
print "And your favorite color is? ";
my $usr_color = <STDIN>;

print "$usr_name, I like the $usr_color color too :)\n";
```

and how does the output look like?
```
$ ./user_input_str.pl 
Hi there! What's your name? learnbyexample
And your favorite color is? blue

learnbyexample
, I like the blue
 color too :)
```

### chomp()

```perl
#!/usr/bin/perl
use strict;
use warnings;

print "Hi there! What's your name? ";
my $usr_name  = <STDIN>;
print "And your favorite color is? ";
my $usr_color = <STDIN>;

# use chomp to remove trailing \n character from a string
chomp($usr_name);
chomp($usr_color);
print "\n$usr_name, I like the $usr_color color too :)\n";
```
Now, our output is as desired
```
$ ./user_input_chomp.pl 
Hi there! What's your name? learnbyexample
And your favorite color is? blue

learnbyexample, I like the blue color too :)
```

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="control-structures"></a>Control Structures

### if-elsif-else

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $number = 45;

print "========== if ========== \n";
if($number > 25)
{
    print "Hurray! $number is greater than 25\n";
}

print "========== if-else ========== \n";
if($number % 2 == 0)
{
    print "$number is an even number\n";
}
else
{
    print "$number is an odd number\n";
}

print "========== if-elsif-else ========== \n";
if($number < 0)
{
    print "$number is a negative number\n";
}
elsif($number > 0)
{
    print "$number is a positive number\n";
}
else
{
    print "$number is neither postive nor a negative number\n";
}
```

* braces `{}` are required even for single statement blocks
* if you made a syntax error using `if` control structure, it is likely due to leaving out braces or a typo for `elsif` keyword
* any number of statements can be placed within braces, including nesting - i.e `if` statements within the braces

```
$ ./if_elsif_else.pl
========== if ========== 
Hurray! 45 is greater than 25
========== if-else ========== 
45 is an odd number
========== if-elsif-else ========== 
45 is a positive number
```

As seen in above examples, we often need only single statement in `if` control block. In such cases, we can place the condition at end of statement for more compact coding

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $number = 45;

# single statement if
print "Hurray! $number is greater than 25\n" if($number > 25);

# alternative to single-statement if-elsif-else structure
my $print_str = 'neither postive nor a negative';
$print_str = 'a negative' if($number < 0);
$print_str = 'a positive' if($number > 0);
print "$number is $print_str number\n";
```

* don't forget the semicolon at end of `if` condition

```
$ ./if_oneliner.pl
Hurray! 45 is greater than 25
45 is a positive number
```

### for-loop

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $number = 9;
for(my $i = 1; $i < 5; $i++)
{
    my $mul_table = $number * $i;
    print "$number * $i = $mul_table\n";
}
```

* for loop syntax is very similar to that in C
* use `foreach` when iterating over arrays and similar iterative structures. Syntax and examples are convered in later sections

```
$ ./for_loop.pl
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
```

### while-loop

```perl
#!/usr/bin/perl
use strict;
use warnings;

# continuously ask user string until it is a palindrome
my $usr_string = 'not a palindrome';
while($usr_string ne reverse($usr_string))
{
    print "Enter a palindrome string: ";
    $usr_string = <STDIN>;
    chomp($usr_string);
}
```

* while-loop allows us to execute block of statements until a condition is satisfied
* `ne` is the 'not equal to' string comparison operator, use `!=` when comparing numbers
* `reverse` gives us the reversed string for comparison
* this is another example where removing trailing newline character with `chomp` is important

```
$ ./while_loop.pl
Enter a palindrome string: abc
Enter a palindrome string: malayalam
```

### next and last
The `next` and `last` keywords are used to change the normal flow of loops on certain conditions

Example for `next`

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $prev_num = 0;
my $curr_num = 0;
print "The first 10 numbers in fibonacci sequence:\n";
for(my $i = 0; $i < 10; $i++)
{
    print "$curr_num ";
    if($i == 0)
    {
        $curr_num = 1;
        # skip rest of the loop and start next iteration
        next;
    }
    my $temp  = $curr_num;
    $curr_num = $curr_num + $prev_num;
    $prev_num = $temp;
}
print "\n";
```

* `next` can be placed anywhere in a loop block without having to worry about complicated code flow

```
$ ./loop_with_next.pl
The first 10 numbers in fibonacci sequence:
0 1 1 2 3 5 8 13 21 34 
```

Example for `last`

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $random_num;
while(1)
{
    $random_num = int(rand(500));
    last if($random_num % 4 == 0 && $random_num % 6 == 0);
}
print "Random number divisible by 4 and 6: $random_num\n";
```

* `while(1)` and `for(;;)` are generally used to create infinite loops

```
$ ./loop_with_last.pl
Random number divisible by 4 and 6: 348
```

* in case of nested loops, `next` and `last` only affect the immediate parent loop

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="list-array-hash"></a>List, Array and Hash variables

### lists
List provides an easy way to group different values/variables together

```perl
my ($str1, $num1, $char1) = ('Good day', 2, 'x');
my ($str2, $num2, $char2) = ("$str1 to you :)", 42, 'y');
```

### arrays
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

### Iterating over arrays

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
$
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

### Hashes
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

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="reference-special-variables"></a>Reference and Special Variables

### references

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $scalar_var = 'cat';
my @array_var  = (1,2,3,4,5);
my %hash_var   = ( 'car' => 'bmw', 'color' => 'blue' );

my $scalar_ref = \$scalar_var;
my $array_ref  = \@array_var;
my $hash_ref   = \%hash_var;

# deferencing is just prefixing another $,@,% depending on requirement
print "$$scalar_ref\n";
print "@$array_ref\n";
print "$$hash_ref{'color'}\n";
my @keys_hash_var = keys %$hash_ref;
print "keys of \%hash_var: @keys_hash_var\n";

# array of references
my @north = ( 'aloo tikki', 'baati', 'khichdi', 'makki roti', 'poha' );
my @south = ( 'appam', 'bisibele bath', 'dosa', 'koottu', 'sevai' );
my @west  = ( 'dhokla', 'khakhra', 'modak', 'shiro', 'vada pav' );
my @east  = ( 'hando guri', 'litti', 'momo', 'rosgulla', 'shondesh' );
my @zones = ( 'North', 'South', 'West', 'East' );

my @choose_dish = ( \@north, \@south, \@west, \@east );
my $rand_zone = int(rand(4));
my $rand_dish = int(rand(5));
print "Would you like to have '$zones[$rand_zone]' speciality '$choose_dish[$rand_zone]->[$rand_dish]' today?\n";
# -> is optional, used for clarity and readability
```

* reference works by storing the address of a variable
* mostly used to pass arguments to subroutine

```
$ ./references.pl
cat
1 2 3 4 5
blue
keys of %hash_var: car color
Would you like to have 'East' speciality 'shondesh' today?
```

### Perl special variables
Certain variables have special meaning in Perl and used for variety of purposes

For example, the `$_` as default iterator variable in `foreach` loop

```perl
print "'$_' " foreach (@north);
```

* `$_` is also default variable in many other places like `print, m//, s///, while(<FILEHANDLE>)` etc
* `@_` is default array containing parameters passed to subroutine
* `@ARGV` contains command line arguments
* `$0` contains name of Perl program being executed
* and many more. We'll see some of these variables in coming sections

**Further Reading**

* [References](http://perldoc.perl.org/perlreftut.html)
* [Special Variables](http://perldoc.perl.org/perlvar.html#SPECIAL-VARIABLES)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="subroutines-variable-scope"></a>Subroutines and Variable Scope

### Subroutines

```perl
#!/usr/bin/perl
use strict;
use warnings;

# ----- calling subroutine without arguments -----
print_greeting();

sub print_greeting
{
    print "-----------------------------\n";
    print "         Hello World         \n";
    print "-----------------------------\n";
}

# ----- passing arguments by value -----
my @numbers = (1 .. 100);
my $sum_of_1_to_100 = array_sum(@numbers);
print "Sum of numbers from 1 to 100 is: $sum_of_1_to_100\n\n";

sub array_sum
{
    my $sum = 0;
    $sum += $_ foreach (@_);
    return $sum;
}

# ----- passing arguments by reference -----
my ($min, $max);
my @values = (34, 234, 0, 64, 97, 18, 53);
min_max(\$min, \$max, @values);

print "\@values:   @values\n";
print "Min value: $min\n";
print "Max value: $max\n";

sub min_max
{
    my ($min_ref, $max_ref, @values_arr) = @_;
    # sort array numerically in ascending order
    my @sorted_arr = sort {$a <=> $b} @values_arr;
    $$min_ref = $sorted_arr[0];
    $$max_ref = $sorted_arr[-1];
}
```

* subroutines are declared using the `sub` keyword
* arguments passed, if any, are accessible via the special variable `@_`
* `@_` is a flattened list combining all the arguments passed in order. Using the `()` list construct, we can extract them in any combination of scalar/array variables
* by using references, we can overcome limitation of single return value
* recall that `<=>` returns `-1, 0, 1` if the left argument is numerically `less than, equal to, greater than` the right argument respectively
    * use `{$b <=> $a}` to sort in descending order
    * `$a` and `$b` are special variables used by `sort` function

```
$ ./subroutines.pl
-----------------------------
         Hello World         
-----------------------------
Sum of numbers from 1 to 100 is: 5050

@values:   34 234 0 64 97 18 53
Min value: 0
Max value: 234
```

**Further Reading**

* [subroutines](http://perldoc.perl.org/perlsub.html)
* [sort](http://perldoc.perl.org/functions/sort.html)

### Variable Scope
Let's see some examples of how the use of `my` keyword to declare variables affects where it is accessible within the program

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $num1 = 25;
print_num();

sub print_num
{
    print "Yeehaw! \$num1 is visible in this scope, its value is: $num1\n";
}
```

* since the variable `$num1` is declared outside of any block, it is visible to all blocks/subroutines in this file

```
$ ./variable_scope_1.pl
Yeehaw! $num1 is visible in this scope, its value is: 25
```

What happens when a variable declared within a block is used outside of it?

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $num1 = 25;
if($num1 & 1)
{
    print "$num1 is odd\n";
    my $num2 = $num1 + 1;
}
else
{
    print "$num1 is even\n";
    my $num2 = $num1 + 2;
}
print "next even number after $num1 is $num2\n";
```

* since `$num2` was declared only within `if` and `else` blocks, it is not visible outside those blocks and results in error
* this applies to any blocks like control structures and subroutines

```
$ ./variable_scope_2.pl
Global symbol "$num2" requires explicit package name at ./variable_scope_2.pl line 16.
Execution of ./variable_scope_2.pl aborted due to compilation errors.
```

Using a superficial `main` subroutine in Perl programs can come in handy

```perl
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
```

* `printf` allows us to format output string
* in this case, it could also have been done using `print` and `,` operator

```perl
print "$num + $add_value = ", ($num + $add_value), "\n";
```

```
$ ./variable_scope_3.pl
25 + 5 = 30
```

**Further Reading**

Explanation of `our` and `local` keywords is beyond the scope of this tutorial. Check out these links for further details

* [our keyword](http://perldoc.perl.org/functions/our.html)
* [local keyword](http://perldoc.perl.org/perlsub.html#Temporary-Values-via-local())
* [printf formatting options](http://perldoc.perl.org/functions/sprintf.html)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="regular-expressions"></a>Regular Expressions

Regular expression look-up tables

| Special characters | Description |
| ------------- | ----------- |
| ^ | anchor, match from beginning of string |
| $ | anchor, match end of string |
| . | Match any character except newline character \n |
| \| | OR operator for matching multiple patterns |
| () | for grouping patterns and also extraction |
| [] | Character class – match one character among many |
| \^ | use \ to match special characters like ^ |

<br>

| Quantifiers | Description |
| ------------- | ----------- |
| * | Match zero or more times the preceding character |
| + | Match one or more times the preceding character |
| ? | Match zero or one times the preceding character |
| {n} | Match exactly n times |
| {n,} | Match atleast n times |
| {n,m} | Match atleast n times but not more than m times |

<br>

| Character classes | Description |
| ------------- | ----------- |
| [aeiou] | Match any vowel |
| [^aeiou] | ^ inverts selection, so this matches any consonant |
| [a-f] | Match any of abcdef character |
| \d | Match a digit, same as [0-9] |
| \D | Match non-digit, same as [^0-9] or [^\d] |
| \w | Match alphanumeric and underscore character, same as [a-zA-Z_] |
| \W | Match non-alphanumeric and underscore character, same as [^a-zA-Z_] or [^\w] |
| \s | Match white-space character, same as [\ \t\r\n\f] |
| \S | Match non white-space character, same as [^\s] |
| \t | Match horizontal tab character |

<br>

| Miscellaneous | Description |
| ------------- | ----------- |
| \b | word boundary |
| \B | not a word boundary |
| \U | uppercases pattern until end of string or \L or \E |
| \L | lowercases pattern until end of string or \U or \E |
| \u | uppercases only next character |
| \l | lowercases only next character |
| \Q | quote metacharacters until end of string or \E |
| \E | terminate case conversion or quoted section |

* `\u \U \l \L \Q \E` will work in any double quoted strings
* example: `$book = "\uelantris"` is equivalent to `$book = "Elantris"`
<br>

| Modifier | Description |
| ------------- | ----------- |
| g | global, match all patterns in string, not just the first |
| i | Ignore case |
| m | multiline mode, ^ and $ anchors work on internal lines |
| s | singleline mode, . will also match \n |
| e | evaluate replacement string as an expression |
| r | return substituted string without modifying the variable |

<br>

| Variable | Description |
| ------------- | ----------- |
| $1, $2, $3 etc | Matched patterns grouped inside () |
| \1, \2, \3 etc | backreferencing while defining match pattern |
| $` | String before matched pattern |
| $& | Matched pattern |
| $' | String after matched pattern |

### Pattern matching and extraction

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $string = "This is a sample string";

# positive and negative match examples
print "\$string: $string\n\n";
print "\$string has the pattern 'is'\n" if($string =~ m/is/);
print "\$string does not have the pattern 'this'\n" if($string !~ m/this/);
print "\$string has the pattern 'this' when matching case-insensitively\n\n" if($string =~ m/this/i);

# check out what happens when \b is not used
if($string =~ m/\bis/)
{
    # single quotes used to clarify space character in output
    print "Pattern specified:             '\\bis'\n";
    print "String before matched pattern: '$`'\n";
    print "String matching pattern:       '$&'\n";
    print "String after matched pattern:  '$''\n\n";
}

# assigning matched pattern to variables
my ($word1) = $string =~ m/(s[a-z]*e)/i;
print "Word starting with 's' and ending with 'e': $word1\n";
my (@all_words) = $string =~ m/([a-z]+)/gi;
print "All words in \$string: ";
print "'$_' " foreach(@all_words);
print "\n\n";

# what happens when output is saved in scalar context
# again, single quotes used to clarify output
my $match_output = $string =~ m/is/;
print "Output when pattern matches: '$match_output'\n";
$match_output = $string =~ m/line/;
print "Output when pattern does not match: '$match_output'\n";
```

* General syntax for pattern matching: `$var =~ m/PATTERN/MODIFIER`
* `$var =~ m` portion of the syntax can be ignored if matching against `$_` variable
* logically invert match pattern, use: `$var !~ m/PATTERN/MODIFIER`
* when pattern doesn't match, `undef` value is returned which acts as a logical false condition

```
$ ./regex_match.pl
$string: This is a sample string

$string has the pattern 'is'
$string does not have the pattern 'this'
$string has the pattern 'this' when matching case-insensitively

Pattern specified:             '\bis'
String before matched pattern: 'This '
String matching pattern:       'is'
String after matched pattern:  ' a sample string'

Word starting with 's' and ending with 'e': sample
All words in $string: 'This' 'is' 'a' 'sample' 'string' 

Output when pattern matches: '1'
Output when pattern does not match: ''
```

### Transliteration operator

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $greeting = '===== Have a great day =====';
$greeting =~ tr/=/*/;
print "$greeting\n";

# s modifier lets you 'squash' repetitive character sequences
my $lose = "Don't loose hope :)";
$lose =~ tr/a-zA-Z//s;
print "$lose\n";

# d modifier is used to delete characters
# c modifier complements the searchlist
my $sentence = "Th'i1s is34 a; senten6#ce";
$sentence =~ tr/a-zA-Z //cd;
print "$sentence\n";

# r modifier lets you retain original variable untouched and assign modified string to another variable
my $uppercase_quote = 'SIMPLICITY IS THE ULTIMATE SOPHISTICATION';
my $lowercase_quote = $uppercase_quote =~ tr/A-Z/a-z/r;
print "$lowercase_quote\n";

# tr can be used to count matching characters
my $mixed_str  = 'He has 5 cricket bats, 2 sets of stumps and a glove set';
my $letter_cnt = $mixed_str =~ tr/a-zA-Z//;
my $digit_cnt  = $mixed_str =~ tr/0-9//;
print "\$mixed_str: $mixed_str\n";
print "\$mixed_str has $letter_cnt letters and $digit_cnt digits\n";
```

* General syntax for transliteration: `$var =~ tr/SEARCHLIST/REPLACEMENTLIST/MODIFIER`
* `$var =~ ` portion of the syntax can be ignored for `$_` variable
* `tr` works by replacing SEARCHLIST by corresponding character in REPLACEMENTLIST
* for modifiers `d` and `s`, REPLACEMENTLIST is optional
* `tr` doesn't allow regular expression elements other than the range operator (ex: `0-9`, `a-f`, etc)

```
$ ./regex_tr.pl
***** Have a great day *****
Don't lose hope :)
This is a sentence
simplicity is the ultimate sophistication
$mixed_str: He has 5 cricket bats, 2 sets of stumps and a glove set
$mixed_str has 40 letters and 2 digits
```

### Search and Replace

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $str = 'sample string';
$str =~ s/sample/test/;
print "simple replace:              $str\n";

# different delimiters like |,#,% etc can be used instead of /
my $date = '25/04/2016';
$date =~ s|/|-|g;
print "using different delimiter:   $date\n";

# use \ when you need to match special characters
my $greeting = '***** Have a great day *****';
$greeting =~ s/\*/=/g;
print "replacing special character: $greeting\n";

# pattern extraction
my $words = 'night and day';
$words =~ s/(\w+)( and )(\w+)/$3$2$1/;
print "swapping words:              $words\n\n";

# changing case of matched pattern
my $sentence = 'thIs iS a saMple StrIng';
print "\$sentence:     $sentence\n";
$sentence =~ s/^([a-z])(.*)/\U$1\L$2/;
print "Changing case: $sentence\n\n";

# e modifier
my $numbers = '34 28 91 42 5';
print "\$numbers:  $numbers\n";
$numbers =~ s/(\d+)/$1%5/ge;
print "numbers%5: $numbers\n\n";

# one can also call subroutines with e modifier
# use r modifier to retain original variable and assign output to another
$numbers = '1 2 3 4 5';
my $numbers_factorial = $numbers =~ s/(\d+)/num_fact($1)/ger;
print "\$numbers: $numbers\n";
print "numbers!: $numbers_factorial\n\n";

sub num_fact
{
    my ($num) = @_;
    return ($num == 0) ? 1 : $num * num_fact($num - 1);
}

# backreferencing in defining match pattern
my $line = 'Can you spot the the mistakes? I i seem to not';
print "\$line:     $line\n";
$line =~ s/\b(\w+) \1/$1/gi;
print "corrected: $line\n";
```

* General syntax: `$var =~ s/PATTERN/REPLACEMENTPATTERN/MODIFIER`
* `$var =~ ` portion of the syntax can be ignored for `$_` variable

```
$ ./regex_search_replace.pl
simple replace:              test string
using different delimiter:   25-04-2016
replacing special character: ===== Have a great day =====
swapping words:              day and night

$sentence:     thIs iS a saMple StrIng
Changing case: This is a sample string

$numbers:  34 28 91 42 5
numbers%5: 4 3 1 2 0

$numbers: 1 2 3 4 5
numbers!: 1 2 6 24 120

$line:     Can you spot the the mistakes? I i seem to not
corrected: Can you spot the mistakes? I seem to not
```

### split

```perl
#!/usr/bin/perl
use strict;
use warnings;

# extracing words from a sentence
my $string = 'This is a sample string';
my @words = split /\s+/, $string;
print "\$string: $string\n";
print "words:   ".join(', ', @words)."\n\n";

# extracting letters from a word
my @letters = split //, $words[0];
print "splitting '$words[0]' into letters: @letters\n";

# saving even the pattern used to split
my $data = 'Rahul : 75 : 68 : 90';
my @columns = split /(\W+)/, $data;
print "\$data:    $data\n";
print "columns: ";
print "'$_' " foreach(@columns);
print "\n\n";

# using a count value to limit number of splits
my $info = '46 ways to publish a novel';
my @info_split = split /\s+/, $info, 2;
print "\$info:           $info\n";
print "\$info_split[0] = $info_split[0]\n";
print "\$info_split[1] = $info_split[1]\n";
```

* General syntax for split: `@output_var = split /PATTERN/, $var[, count]`
* `, $var[, count]` part of syntax can be ignored for `$_` variable

```
$ ./regex_split.pl
$string: This is a sample string
words:   This, is, a, sample, string

splitting 'This' into letters: T h i s
$data:    Rahul : 75 : 68 : 90
columns: 'Rahul' ' : ' '75' ' : ' '68' ' : ' '90' 

$info:           46 ways to publish a novel
$info_split[0] = 46
$info_split[1] = ways to publish a novel
```

**Further Reading**

* [perlrequick - quick tutorial](http://perldoc.perl.org/perlrequick.html)
* [perlretut - longer tutorial](http://perldoc.perl.org/perlretut.html)
* [perlreref - quick reference](http://perldoc.perl.org/perlreref.html)
* [Handy Perl regular expressions](http://www.catonmat.net/blog/perl-one-liners-explained-part-seven/)
* Practice and general regex tutorials (i.e they may not be Perl specific)
    * [online regex tester](https://regex101.com/#pcre) - [PCRE](http://www.pcre.org/), shows explanations, has reference guides and ability to save and share regex
    * [regexone](http://regexone.com/) - interative tutorial
    * [regexcrossword](https://regexcrossword.com/) - practice by solving crosswords, read 'How to play' section before you start

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="file-handling"></a>File handling

### Reading files

```perl
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
```

* In this tutorial, we'll handle only ASCII file types. We indicate that by `:encoding(ASCII)`
    * for other encoding types and for more discussion on `open` in general, refer to links given later in this section
* `undef` is a way of telling that the variable doesn't have any value yet
* `<` symbol in `open` indicates that we wish to only read the file
* in case file cannot be opened for reading (for ex: file does not exist) `die` will cause the program to exit, along with error message
* `while` is the most frequently used construct to read file contents line by line. It automatically takes care of stopping the loop at end of file

```
$ ./file_reading.pl
#!/usr/bin/perl

print "Hello World\n";
```

### Declaring file encoding and using autodie

```perl
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
```

* this way, code looks cleaner and avoids issues due to missing out on `die` constructs
* `autodie` works on other functions too, refer to link given later in the section

```
$ ./file_reading_error.pl
Can't open 'file_doesnt_exist.txt' for reading: 'No such file or directory' at ./file_reading_error.pl line 12
```

### Writing to files

```perl
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
```

* `>` symbol in `open` indicates that we wish to write to a new file
    * if the file already exists, its contents will get overwritten
    * use `>>` to append to an existing file
* all print statements we have seen prior to this example uses the filehandle `STDOUT` by default and thus we see the print result on terminal
* to print error messages instead of normal output, use the `STDERR` filehandle. We'll see examples in next section
* by using `print $out_file`, printing is redirected to that filehandle instead of default `STDOUT`

```
$ ./file_writing.pl
This is a sample line of text
Yet another line
```

### Nested file handling

Often, one needs to read one file to get list of filenames for further processing. Nesting `while` loop with filehandles may result in unintended consequences  
In such cases, one can read entire file contents into an array and iterate using `foreach` for one loop and use `while` for the other

```perl
# assign entire contents of file to array variable, each item contains single line from file
my @file_contents = <$file_handle>;
```

This method also allows an easier way to process file lines relative to current line by using `for` loop to iterate using explicit indices

**Further Reading**

* [open](http://perldoc.perl.org/perlopentut.html)
* [why opening files in old way is bad](http://perlmaven.com/open-files-in-the-old-way)
* [autodie](http://perldoc.perl.org/autodie.html)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="command-line-arguments"></a>Command line arguments

### Known number of arguments

```perl
#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV != 1)
{
    print STDERR "Please provide exactly two numbers as command line arguments\nExiting program\n";
    # usual convention to use exit values is '0' for success and '1' for error
    exit(1);
}
else
{
    my ($num1, $num2) = @ARGV;
    my $sum = $num1 + $num2;
    print "$num1 + $num2 = $sum\n";
}
```

* Command line arguments given to Perl program are automatically saved in `@ARGV` array
* It is a good idea to let the user know something went wrong
* Use of `exit(1)` is helpful if the program is used by another program which can then use the `exit` value to take decision
* As the program terminates with error message for wrong usage, use `STDERR` filehandle instead of default `STDOUT`
* As can be seen from sample output below, giving string as input for numeric addition only results in a warning. If you want to escalate this to an error, modify warnings to `use warnings FATAL => qw(numeric);` This will cause the program to exit and `echo $?` yielding value of `255`
    * more on different usage of [warnings](https://metacpan.org/pod/warnings)

```
$ ./sum_of_two_numbers.pl 2.34 '56' 
2.34 + 56 = 58.34
$ echo $?
0

$ ./sum_of_two_numbers.pl 3 2 5
Please provide exactly two numbers as command line arguments
Exiting program
$ echo $?
1

$ ./sum_of_two_numbers.pl 3 a
Argument "a" isn't numeric in addition (+) at ./sum_of_two_numbers.pl line 14.
3 + a = 3
$ echo $?
0
```

### Varying number of arguments

```perl
#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV < 0)
{
    print STDERR "Please provide atleast one filename as command line argument\nExiting program\n";
    exit(1);
}
else
{
    foreach (@ARGV)
    {
        # -f option checks if the argument is a plain file
        if( !(-f $_) )
        {
            print "File '$_' not found\n";
            next;
        }
        
        my $line_count = `wc -l < $_`;
        chomp($line_count);
        printf "%-30s: %-4d lines\n", $_, $line_count;
    }
}
```

* When dealing with filenames obtained as user input, it is good to do a sanity check before processing
* As seen earlier, output of external command execution contains trailing newline character, which might need to be taken care
* Note that Perl automatically substitutes value of `$_` before calling external command, use `\` to escape special characters when needed

```
$ ./varying_command_line_args.pl *pl
arrays.pl                     : 59   lines
backticks.pl                  : 7    lines
bitwise.pl                    : 13   lines
file_reading_error.pl         : 19   lines
file_reading.pl               : 15   lines
...
```

### The $0 argument

```perl
#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV != 0)
{
    print STDERR "Please provide exactly one filename as command line argument\nExiting program\n";
    exit(1);
}
else
{
    my $filename = $ARGV[0];
    unless(-f $filename)
    {
        print STDERR "File '$filename' not found\nExiting program\n";
        exit(1);
    }
    
    # $0 special variable contains the name of program being executed
    if($0 =~ m/line_count.pl/)
    {
        print "No. of lines in '$filename' is: ".`wc -l < $filename`;
    }
    if($0 =~ m/word_count.pl/)
    {
        print "No. of words in '$filename' is: ".`wc -w < $filename`;
    }
}
```

* Using the `$0` special variable, same program can be repurposed for different functionalities
* `unless` helps in situation where you need to check a negated test condition. In this case, `unless(-f $filename)` is equivalent to `if( !(-f $filename) )`

```
$ ./line_count.pl arrays.pl
No. of lines in 'arrays.pl' is: 59

$ ln -s line_count.pl word_count.pl
$ ./word_count.pl arrays.pl
No. of words in 'arrays.pl' is: 247

$ wc -lw arrays.pl
  59  247 arrays.pl
```

### Command line switches

```perl
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
```

* `Getopt` is an easy way to build command-line like functionality for your Perl program
* To indicate that you need argument along with option, append colon to the option, like `f:`
* For just option without argument, use the letter you want, like `h`
* Because of `use strict;` construct, we need to declare the `$opt_` variables by adding the option letters as suffix. Perl then automatically populates these variables based on user input
* The `$opt_` variables have the initial value `undef`. `$opt_h` gets assigned to `1` if `-h` option is given by user and `$opt_f` to filename in case of `-f`

```
$ ./getopt_std.pl -h
----------------------------------------------------------------
This program sorts a given file and removes any duplicate lines

Usage:
./getopt_std.pl -h 		        Displays this help
./getopt_std.pl -f filename 	file to be sorted uniquely
----------------------------------------------------------------

$ cat test_list.txt
basic_test
input_test
async_test
output_test
input_test
sync_test

$ ./getopt_std.pl -f test_list.txt
test_list.txt is now uniquely sorted
$ cat test_list.txt
async_test
basic_test
input_test
output_test
sync_test

$ ./getopt_std.pl -x
Unknown option: x
Oops! Something went wrong
Use './getopt_std.pl -h' to get help

$ ./getopt_std.pl -f non_existing_file.txt
sort: cannot read: non_existing_file.txt: No such file or directory
```

**Further Reading**

* [file test options](http://perldoc.perl.org/functions/-X.html)
* [Getopt::Std](http://perldoc.perl.org/Getopt/Std.html)
* [Getopt::Long](http://perldoc.perl.org/Getopt/Long.html)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="debugging"></a>Debugging

### perl -c

To quickly check for any syntax errors, use the `perl -c` option to execute program

```
$ perl -c hello_world.pl 
hello_world.pl syntax OK
```

Example syntax error

```perl
#!/usr/bin/perl
use strict;
use warnings;

print "-----------\n"
print "Hello World\n"
print "-----------\n"
```

* Useful to quickly catch syntax errors like missing semicolon
* While this example might be trivial, real world program might have thousands of lines and tougher to find typos

```
$ perl -c syntax_error.pl 
syntax error at syntax_error.pl line 6, near "print"
syntax_error.pl had compilation errors.
```

### perl -d

```
$ perl -d for_loop.pl

Loading DB routines from perl5db.pl version 1.39_10
Editor support available.

Enter h or 'h h' for help, or 'man perldebug' for more help.

main::(for_loop.pl:5):	my $number = 9;
  DB<1> v
2:	use strict;
3:	use warnings;
4 	
5==>	my $number = 9;
6:	for(my $i = 1; $i < 5; $i++)
7 	{
8:	    my $mul_table = $number * $i;
9:	    print "$number * $i = $mul_table\n";
10 	}
  DB<1> s
main::(for_loop.pl:6):	for(my $i = 1; $i < 5; $i++)
main::(for_loop.pl:7):	{
  DB<1> s
main::(for_loop.pl:8):	    my $mul_table = $number * $i;
  DB<1> s
main::(for_loop.pl:9):	    print "$number * $i = $mul_table\n";
  DB<1> s
9 * 1 = 9
main::(for_loop.pl:8):	    my $mul_table = $number * $i;
  DB<1> s
main::(for_loop.pl:9):	    print "$number * $i = $mul_table\n";
  DB<1> q
```

* `perl -d` invokes Perl debugger, stops at first statement and gives a debugger prompt `DB<1>` awaiting further commands from user
* `v` prints code around the current statement the debugger is at, useful to visualize the progress of debug effort
* `s` single step through program execution, shows print results from previous statements if any and next statement up for execution
* `p $scalar_var` print value of a scalar variable, not so useful for arrays/hashes
* `x \$scalar_var`, `x \@array_var` and `x \%hash_var` print address and value of variables (nicely formatted output for array and hash variables)
* `h` help on debugger features, how to set breakpoints, etc. Use `h h` for complete help page
* `H` display command history, numbered and sorted in descending order. Use `!<num>` to execute a command from history instead of typing it all again, for example `!2`
* `q` quit the debugger

### perl -de 0

This allows us to start an interactive Perl debugger, where we can write snippets of Perl code, see variable results, etc without having to write and rewrite experimental Perl programs

```
$ perl -de 0

Loading DB routines from perl5db.pl version 1.39_10
Editor support available.

Enter h or 'h h' for help, or 'man perldebug' for more help.

main::(-e:1):	0
  DB<1> $a = 5

  DB<2> p $a
5
  DB<3> @arr = (3, 4, 2)

  DB<4> x \@arr
0  ARRAY(0x2a49e00)
   0  3
   1  4
   2  2
  DB<5> q
```

**Further Reading**

* [perldebtut](http://perldoc.perl.org/perldebtut.html) - debug intro guide
* [perldebug](http://perldoc.perl.org/perldebug.html) - more detailed guide
* Common errors and warnings
    * [common gotchas for perl on stackoverflow](http://stackoverflow.com/questions/166653/common-gotchas-for-perl)
    * [faq on perldoc](http://perldoc.perl.org/index-faq.html)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="resources-list"></a>Perl resources list

* [Perl curated resources](https://github.com/learnbyexample/scripting_course/blob/master/Perl_curated_resources.md)

[Back to Table of Contents](#table-of-contents)
<br><br>
# <a name="todo"></a>To Do

* Real world examples
* Reference Sheet
* etc
