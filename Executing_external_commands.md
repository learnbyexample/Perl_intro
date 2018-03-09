# <a name="executing-external-commands"></a>Executing external commands

**Table of Contents**

* [Issuing commands](#issuing-commands)
* [Saving command output](#saving-command-output)

<br>

The sample output shown in this section will be different based on your username and working directories

<br>

## <a name="issuing-commands"></a>Issuing commands

* Perl has various ways to execute external commands
* Use `system` if the program should wait for the issued command to finish before proceeding
    * accepts single or list of arguments
    * to pass shell meta characters which are to be interpreted before executing the command, use single argument form
    * in list form, user has to perform necessary expansion before passing the command (functions such as `glob` help in that aspect)

```perl
#!/usr/bin/perl
use strict;
use warnings;

# Executing external command: clear
system('clear');

# single quoted strings are not interpolated
system('echo Hello $USER');
```

* The first `system` statement clears the terminal screen
* The second one will print a personalized greeting message using shell environment variable `$USER`

```
$ ./screen_clear.pl
# screen clears followed by below output

Hello learnbyexample
```

Some more examples

```bash
$ # using debugger for interactive session
$ perl -de0

DB<1> system('echo $HOME')
/home/learnbyexample

DB<2> system('seq', '-s,', '10')
1,2,3,4,5,6,7,8,9,10

DB<3> system('seq -s, 10 > out.txt')

DB<4> q

$ cat out.txt
1,2,3,4,5,6,7,8,9,10
```

**Further Reading**

* [perldoc - system](https://perldoc.perl.org/functions/system.html)
* [perldoc - Quote and Quote-like Operators](https://perldoc.perl.org/perlop.html#Quote-and-Quote-like-Operators) for interpolation details
* [stackoverflow - using bash shell with system](https://stackoverflow.com/questions/571368/how-can-i-use-bash-syntax-in-perls-system)
* [stackoverflow - security considerations](https://stackoverflow.com/questions/13023594/executing-system-commands-safely-while-coding-in-perl)

<br>

## <a name="saving-command-output"></a>Saving command output

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

* [stackoverflow - store the result of a system command in a Perl variable](https://stackoverflow.com/questions/3854651/how-can-i-store-the-result-of-a-system-command-in-a-perl-variable)
* [stackoverflow - difference between backticks, system, exec and open](https://stackoverflow.com/questions/799968/whats-the-difference-between-perls-backticks-system-and-exec)

