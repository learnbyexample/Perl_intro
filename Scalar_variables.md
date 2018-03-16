# <a name="scalar-variables"></a>Scalar Variables

**Table of Contents**

* [Numbers](#numbers)
* [Strings](#strings)

<br>

* A scalar variable holds a single value, i.e number/string/reference
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

* For now, we'll use the `my` keyword for variable declaration and revisit the topic in a later section

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

