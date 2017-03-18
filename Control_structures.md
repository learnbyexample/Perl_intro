# <a name="control-structures"></a>Control Structures

* [if elsif else](#if-elsif-else)
* [for loop](#for-loop)
* [while loop](#while-loop)
* [next and last](#next-and-last)


<br>

### <a name="if-elsif-else"></a>if elsif else

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

<br>

### <a name="for-loop"></a>for loop

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

<br>

### <a name="while-loop"></a>while loop

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

<br>

### <a name="next-and-last"></a>next and last

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

