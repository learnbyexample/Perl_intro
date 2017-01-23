# Scalar Variables

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

