# <a name="getting-user-input"></a>Getting User input

* [User input](#user-input)
* [chomp](#chomp)


<br>
### <a name="user-input"></a>User input

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

<br>
### <a name="chomp"></a>chomp

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

