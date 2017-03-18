# <a name="executing-external-commands"></a>Executing external commands

* [system](#system)
* [backticks](#backticks)

The sample output shown in this section will be different based on your username and working directories

<br>

### <a name="system"></a>system

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

<br>

### <a name="backticks"></a>backticks

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

* [stackoverflow](https://stackoverflow.com/questions/3854651/how-can-i-store-the-result-of-a-system-command-in-a-perl-variable) - for more ways of working with external commands

