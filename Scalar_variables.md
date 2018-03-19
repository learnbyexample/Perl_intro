# <a name="scalar-variables"></a>Scalar Variables

**Table of Contents**

* [Numbers](#numbers)
* [Strings](#strings)

<br>

* A scalar variable holds a single value, i.e number/string/reference
    * references are covered in a [later chapter](./Reference_special_variables.md)
* these have `$` symbol prefixed to variable name
* Perl automatically infers and converts the values based on context - for ex: numbers present in string form
    * as per `perldoc`, the techinal jargon is **contextually polymorphic language**

<br>

## <a name="numbers"></a>Numbers

* Integer examples

```perl
#!/usr/bin/perl
use strict;
use warnings;

# variables have to be explicitly declared when using strict pragma
my $num1 = 7;
my $num2 = 42;
my $sum  = $num1 + $num2;

print "$num1 + $num2 = $sum\n";
```

* For now, we'll use the `my` keyword for variable declaration and revisit the topic in a [later chapter](./Subroutines_variable_scope.md)

```bash
$ ./integers.pl
7 + 42 = 49

$ # some more examples
$ perl -de0

DB<1> p 9/5
1.8
DB<2> p int(9/5)
1
DB<3> p 9%5
4
DB<4> p 2 ** 5
32
```

* Floating point examples
* the [E scientific notation](https://en.wikipedia.org/wiki/Scientific_notation#E_notation) can be used as well

```bash
$ perl -de0

DB<1> $appx_pi = 22 / 7 
DB<2> $area = 42.16
DB<3> p $appx_pi + $area
45.3028571428571

DB<4> p 3.982e5 + 9.32e-1
398200.932
DB<5> p 2.13e21 + 5.23e22
5.443e+22
```

* Binary, Octal and Hexadecimal
* these get converted to integer

```bash
$ perl -de0

DB<1> $oct_num = 012
DB<2> $hex_num = 0xF
DB<3> $bin_num = 0b101

DB<4> p $oct_num + $hex_num + $bin_num
30

DB<5> p $hex_num * 3
45
```

* Using `_` for readability

```bash
$ perl -de0

DB<1> $amt = 1_000_000
DB<2> p $amt
1000000

DB<3> p 0xff_ab1
1047217

DB<4> p 1_00.3_352
100.3352

DB<5> p 0b1010_0011
163
```

**Further Reading**

* [perldoc - Scalar values](https://perldoc.perl.org/perldata.html#Scalar-values)
* [Perl operators](https://perldoc.perl.org/perlop.html)
* [Perl built-in functions](https://perldoc.perl.org/perlfunc.html)

<br>

## <a name="strings"></a>Strings

Let's see some strings now

* single quoted strings
* no interpolation or escape sequences
    * except for allowing `\'` when single quote itself is needed

```bash
$ perl -de0

DB<1> $greeting = 'Hello World'
DB<2> p $greeting
Hello World

DB<3> $regex = 'foo\d+'
DB<4> p $regex
foo\d+

DB<5> $msg = 'It\'s so good'   
DB<6> p $msg 
It's so good
```

* double quoted strings
* allows interpolation and escape sequences
    * See [perldoc - Quote and Quote-like Operators](https://perldoc.perl.org/perlop.html#Quote-and-Quote-like-Operators) for details

```bash
$ perl -de0

DB<1> $greeting = 'Hello World'
DB<2> p "$greeting. How are you?"
Hello World. How are you?

DB<3> $fav_books = "Harry Potter\nSherlock Holmes\nStormlight Archive"
DB<4> p $fav_books
Harry Potter
Sherlock Holmes
Stormlight Archive

DB<5> $c = 5
DB<6> p "I want $c apples"
I want 5 apples

DB<7> $prefix = 'hand'
DB<8> p "${prefix}y ${prefix}ful ${prefix}book"
handy handful handbook
```

* string operators
* `.` for string concatenation and `x` for string repetition

```bash
$ perl -de0

DB<1> $s1 = 'good'
DB<2> $s2 = 'day'
DB<3> p $s1 . $s2
goodday

DB<4> $fmt = '-' x 25
DB<5> p "$fmt\n\t$s1 $s2\n$fmt"
-------------------------
        good day
-------------------------
```

* quote operators, allows to use different delimiters
* `q` for single quoted strings and `qq` for double quoted strings

```bash
$ perl -de0

DB<1> p q/It's so good/
It's so good

DB<2> $f1 = 'mango'      
DB<3> $f2 = 'orange'
DB<4> p qq(I like "$f1" and "$f2")
I like "mango" and "orange"
```

