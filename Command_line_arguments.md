# <a name="command-line-arguments"></a>Command line arguments

* [Known number of arguments](#known-number-of-arguments)
* [Varying number of arguments](#varying-number-of-arguments)
* [The $0 argument](#the-$0-argument)
* [Command line switches](#command-line-switches)


<br>

### <a name="known-number-of-arguments"></a>Known number of arguments

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

<br>

### <a name="varying-number-of-arguments"></a>Varying number of arguments

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

<br>

### <a name="the-$0-argument"></a>The $0 argument

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

<br>

### <a name="command-line-switches"></a>Command line switches

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

