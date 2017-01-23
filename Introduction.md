# <a name="introduction"></a>Introduction

* [Installation](#installation)
* [Hello World example](#hello-world-example)
* [Running Perl program](#running-perl-program)
* [Using strict and warnings flags](#using-strict-and-warnings-flags)


From [wikipedia](https://en.wikipedia.org/wiki/Perl)
>Perl is a family of high-level, general-purpose, interpreted, dynamic programming languages. The languages in this family include Perl 5 and Perl 6

[Larry Wall](https://en.wikipedia.org/wiki/Larry_Wall) wrote the language as a **general purpose scripting language**, borrowing features from **C, shell scripting, awk, sed, grep, cut, sort** etc

It is quite easy to learn, especially if one is already familiar with programming and/or shell scripting.  Perl's easy to use and flexible syntax is both a boon and a curse. There's a running joke that Perl programs look the same before and after encryption, so we'll try to stick to a readable and consistent style over smart tricks in this introductory guide

<br>
### <a name="installation"></a>Installation
Get Perl for your OS from official website - https://www.perl.org/get.html

* Examples presented here is for **Unix-like systems**, Perl version 5.18.2 and uses **bash** shell
* You can also try running Perl code online, [tutorialspoint](http://www.tutorialspoint.com/execute_perl_online.php) is one of them
* It is assumed that you are familiar with command line. If not, check out [this basic tutorial on ryanstutorials](http://ryanstutorials.net/linuxtutorial/) and [this list of curated resources for Linux](https://github.com/learnbyexample/scripting_course/blob/master/Linux_curated_resources.md)

<br>
### <a name="hello-world-example"></a>Hello World example
Let's start with simple a Perl program and how to run it

```perl
#!/usr/bin/perl

print "Hello World\n";
```

The first line has two parts

* `/usr/bin/perl` is the path of Perl interpreter
* `#!` called as **[shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))**, directs the program loader to use the interpreter path provided

The third line prints the message `Hello World` with a `\n` character to print newline after the message

<br>
### <a name="running-perl-program"></a>Running Perl program
You can write the program using text editor like **gedit** or **[vim](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)**

After saving the file, give execute permission and run the program from a terminal

```
$ chmod +x hello_world.pl

$ ./hello_world.pl 
Hello World
```

To find out Perl path and Perl version in your system

```
$ type perl
perl is /usr/bin/perl

$ perl -v
This is perl 5, version 18, subversion 2 (v5.18.2) built for x86_64-linux-gnu-thread-multi
(with 44 registered patches, see perl -V for more detail)
...
```

**Further Reading**

* [Running Perl programs](http://perldoc.perl.org/perlintro.html#Running-Perl-programs) - for more options to run a Perl program

<br>
### <a name="using-strict-and-warnings-flags"></a>Using strict and warnings flags

To avoid common programming mistakes and typos, it is helpful to always include these two compilation flags

**strict**

```perl
#!/usr/bin/perl
use strict;

print "Printing < $uninitialized > variable\n";
```
Let's see what happens when we try to execute this program:

```
$ ./strict.pl
Global symbol "$uninitialized" requires explicit package name at ./strict.pl line 4.
Execution of ./strict.pl aborted due to compilation errors.
```

**warnings**

```perl
#!/usr/bin/perl
use warnings;

print "\n----------------------------------------\n";
print "Printing < $uninitialized > variable\n";
print "----------------------------------------\n";
```
While **strict** flag aborts program execution, **warnings** flag executes the program but provides a more helpful message

```
$ ./warnings.pl
Name "main::uninitialized" used only once: possible typo at ./warnings.pl line 5.

----------------------------------------
Use of uninitialized value $uninitialized in concatenation (.) or string at ./warnings.pl line 5.
Printing <  > variable
----------------------------------------
```

**Further Reading**

* [Always use strict and warnings](http://perlmaven.com/always-use-strict-and-use-warnings)
* [Common warnings and error messages](http://perlmaven.com/common-warnings-and-error-messages)
* Perldoc: [strict](http://perldoc.perl.org/strict.html) and [warnings](http://perldoc.perl.org/warnings.html)


