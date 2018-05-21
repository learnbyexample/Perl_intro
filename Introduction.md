# <a name="introduction"></a>Introduction

**Table of Contents**

* [Installation](#installation)
* [Hello World example](#hello-world-example)
* [Running Perl program](#running-perl-program)
* [Using strict and warnings pragmas](#using-strict-and-warnings-pragmas)
* [Perl REPL](#perl-repl)

<br>

From [wikipedia](https://en.wikipedia.org/wiki/Perl)
>Perl is a family of high-level, general-purpose, interpreted, dynamic programming languages. The languages in this family include Perl 5 and Perl 6

[Larry Wall](https://en.wikipedia.org/wiki/Larry_Wall) wrote the language as a **general purpose scripting language**, borrowing features from **C, shell scripting, awk, sed, grep, cut, sort** etc

It is quite easy to learn, especially if one is already familiar with programming and/or shell scripting.  Perl's easy to use and flexible syntax is both a boon and a curse. There's a running joke that Perl programs look the same before and after encryption, so we'll try to stick to a readable and consistent style over smart tricks in this introductory guide

<br>

## <a name="installation"></a>Installation

Get Perl for your OS from official website - https://www.perl.org/get.html

* Examples presented here is for Perl version 5.22.1 and uses **bash** shell
* It is assumed that you are familiar with command line. If not, check out [ryanstutorials - linuxtutorial](https://ryanstutorials.net/linuxtutorial/) and [this curated list](https://github.com/learnbyexample/scripting_course/blob/master/Linux_curated_resources.md)
* You can also try running Perl code online, for ex: [perltuts](http://dev.perltuts.com/try)

<br>

## <a name="hello-world-example"></a>Hello World example

Let's start with simple a Perl program and how to run it

```perl
#!/usr/bin/perl

print "Hello World\n";
```

The first line has two parts

* `/usr/bin/perl` is the path of Perl interpreter
* `#!` called the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)), directs the program loader to use the interpreter path provided

The third line prints the message `Hello World` with a `\n` character to print newline after the message

<br>

## <a name="running-perl-program"></a>Running Perl program

You can write the program using text editor like **gedit**, **[vim](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)** etc

After saving the file, give execute permission and run the program from a terminal

```bash
$ chmod +x hello_world.pl

$ ./hello_world.pl 
Hello World
```

To find out Perl path and Perl version in your system

```bash
$ type perl
perl is /usr/bin/perl

$ perl -v
This is perl 5, version 22, subversion 1 (v5.22.1) built for x86_64-linux-gnu-thread-multi
(with 44 registered patches, see perl -V for more detail)
...
```

**Further Reading**

* [perldoc - Running Perl programs](https://perldoc.perl.org/perlintro.html#Running-Perl-programs) - for more options to run a Perl program

<br>

## <a name="using-strict-and-warnings-pragmas"></a>Using strict and warnings pragmas

To avoid common mistakes and typos, it is helpful to always include these two pragmas

1) `strict`

```perl
#!/usr/bin/perl
use strict;

print "Printing < $uninitialized > variable\n";
```
Let's see what happens when we try to execute this program:

```
$ ./strict.pl
Global symbol "$uninitialized" requires explicit package name (did you forget to declare "my $uninitialized"?) at perl_programs/strict.pl line 4.
Execution of ./strict.pl aborted due to compilation errors.
```

2) `warnings`

```perl
#!/usr/bin/perl
use warnings;

print "\n----------------------------------------\n";
print "Printing < $uninitialized > variable\n";
print "----------------------------------------\n";
```
**warnings** pragma as the name suggests, gives various types of warnings and also has settings to control which warnings to give, raise to fatal, etc

```
$ ./warnings.pl
Name "main::uninitialized" used only once: possible typo at ./warnings.pl line 5.

----------------------------------------
Use of uninitialized value $uninitialized in concatenation (.) or string at ./warnings.pl line 5.
Printing <  > variable
----------------------------------------
```

**Further Reading**

* [perldoc - strict](https://perldoc.perl.org/strict.html)
* [perldoc - warnings](https://perldoc.perl.org/warnings.html)
* [perlmaven - Always use strict and warnings](https://perlmaven.com/always-use-strict-and-use-warnings)
* [perlmaven - Common warnings and error messages](https://perlmaven.com/common-warnings-and-error-messages)

<br>

## <a name="perl-repl"></a>Perl REPL

* Short programs can be directly supplied to `perl` command using `-e` option instead of using code written in a file
    * [perl -e](https://github.com/learnbyexample/Command-line-text-processing/blob/master/perl_the_swiss_knife.md) is often used as an alternate to `sed/awk` for one-liners

```bash
$ perl -e 'print "Hello Perl\n"'
Hello Perl

$ perl -le 'print 25**12'
59604644775390625
```

* Perl doesn't come with REPL(interactive session for exploring, testing, etc) unlike languages like Python.
* However, one could workaround using [debugger](./Debugging.md) command line option along with `-e`

```bash
$ # Note: only relevant details will be shown while using perl -de0
$ # spacing is adjusted to allow better context
$ # use 'h' or 'h h' command to get help
$ # 'p' command is like print, useful to print value of variable/expression
$ # use 'q' to exit the debugger
$ perl -de0

DB<1> print "Hello Perl\n"
Hello Perl

DB<2> $x = 512
DB<4> p $x * 2
1024

DB<5> q
```

**Further Reading**

* [Devel::REPL](https://metacpan.org/pod/Devel::REPL)
* [Carp::REPL](https://www.effectiveperlprogramming.com/2010/06/carprepl/)
* [Reply](https://randomgeekery.org/2014/08/14/repl-in-perl-with-reply/)

