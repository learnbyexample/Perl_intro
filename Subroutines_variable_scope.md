# <a name="subroutines-and-variable-scope"></a>Subroutines and Variable Scope

* [Subroutines](#subroutines)
* [Variable Scope](#variable-scope)


<br>

### <a name="subroutines"></a>Subroutines

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

<br>

### <a name="variable-scope"></a>Variable Scope

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

