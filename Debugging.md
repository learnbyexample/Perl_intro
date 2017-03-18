# <a name="debugging"></a>Debugging

* [Syntax checking](#syntax-checking)
* [Executing program in debug mode](#executing-program-in-debug-mode)
* [Perl interactive mode](#perl-interactive-mode)


<br>

### <a name="syntax-checking"></a>Syntax checking

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

<br>

### <a name="executing-program-in-debug-mode"></a>Executing program in debug mode

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

<br>

### <a name="perl-interactive-mode"></a>Perl interactive mode

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
    * [common gotchas for perl on stackoverflow](https://stackoverflow.com/questions/166653/common-gotchas-for-perl)
    * [faq on perldoc](http://perldoc.perl.org/index-faq.html)

