# <a name="getting-user-input"></a>Getting User input

**Table of Contents**

* [User input](#user-input)
* [chomp](#chomp)

<br>

## <a name="user-input"></a>User input

Let's see how to get input from user

```perl
#!/usr/bin/perl
use strict;
use warnings;

# Ask for user input
print 'Enter a number: ';
my $usr_num = <STDIN>;

my $square_num = $usr_num ** 2;
print "Square of entered number is: $square_num\n";
```

* The input obtained is a string
    * Perl will automatically try to convert to a number as `**` is numeric exponentiation operator
    * will be `0` if it cannot be converted to number - we get a helpful warning message(thanks to `warnings` pragma) that something is probably wrong

```
$ ./user_input.pl
Enter a number: 23
Square of entered number is: 529

$ ./user_input.pl
Enter a number: abc
Argument "abc\n" isn't numeric in exponentiation (**) at ./user_input.pl line 9, <STDIN> line 1.
Square of entered number is: 0
```

**Note** that the warning message printed the user input as `"abc\n"`, meaning our variable has a `\n` character at the end. While it didn't affect the arithmetic operation(thanks to automatic number conversion), it can be problematic as a string input

```perl
#!/usr/bin/perl
use strict;
use warnings;

print "Hi there! What's your name? ";
my $usr_name = <STDIN>;
print 'And your favorite color is? ';
my $usr_color = <STDIN>;

print "\n$usr_name, I like the $usr_color color too :)\n";
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

**Further Reading**

* [perldoc - readline](https://perldoc.perl.org/functions/readline.html)
* [perldoc - I/O Operators](https://perldoc.perl.org/perlop.html#I%2fO-Operators)

<br>

## <a name="chomp"></a>chomp

`chomp` helps to remove trailing input record separator(default is newline) from a string

```perl
#!/usr/bin/perl
use strict;
use warnings;

print "Hi there! What's your name? ";
my $usr_name = <STDIN>;
print 'And your favorite color is? ';
my $usr_color = <STDIN>;

# use chomp to remove trailing input record separator
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

**Note** that `chomp` can be combined with variable assignment too: `chomp(my $usr_color = <STDIN>)`

**Further Reading**

* [perldoc - chomp](https://perldoc.perl.org/functions/chomp.html)
* [perldoc - input record separator](https://perldoc.perl.org/perlvar.html#%24%2f)

