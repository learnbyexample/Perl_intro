# <a name="file-handling"></a>File handling

* [Reading files](#reading-files)
* [Declaring file encoding and using autodie](#declaring-file-encoding-and-using-autodie)
* [Writing to files](#writing-to-files)
* [Nested file handling](#nested-file-handling)


<br>

### <a name="reading-files"></a>Reading files

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $filename = "hello_world.pl";
my $hello_file = undef;
open($hello_file, "< :encoding(ASCII)", $filename) || die "cannot open $filename for reading";

# read contents of file line by line
while(<$hello_file>)
{
    # $_ gets the line by default
    print $_;
}
close($hello_file) || die "cannot close $filename";
```

* In this tutorial, we'll handle only ASCII file types. We indicate that by `:encoding(ASCII)`
    * for other encoding types and for more discussion on `open` in general, refer to links given later in this section
* `undef` is a way of telling that the variable doesn't have any value yet
* `<` symbol in `open` indicates that we wish to only read the file
* in case file cannot be opened for reading (for ex: file does not exist) `die` will cause the program to exit, along with error message
* `while` is the most frequently used construct to read file contents line by line. It automatically takes care of stopping the loop at end of file

```
$ ./file_reading.pl
#!/usr/bin/perl

print "Hello World\n";
```

<br>

### <a name="declaring-file-encoding-and-using-autodie"></a>Declaring file encoding and using autodie

```perl
#!/usr/bin/perl
use strict;
use warnings;

# automatically handle open/close errors
use autodie;
# declare file encoding for all open functions in this program
use open qw< :encoding(ASCII) >;

my $filename = "file_doesnt_exist.txt";
my $handle = undef;
open($handle, "<", $filename);

# one can also declare another variable instead of using $_
while(my $line = <$handle>)
{
    print $line;
}
close($handle);
```

* this way, code looks cleaner and avoids issues due to missing out on `die` constructs
* `autodie` works on other functions too, refer to link given later in the section

```
$ ./file_reading_error.pl
Can't open 'file_doesnt_exist.txt' for reading: 'No such file or directory' at ./file_reading_error.pl line 12
```

<br>

### <a name="writing-to-files"></a>Writing to files

```perl
#!/usr/bin/perl
use strict;
use warnings;

use autodie;
use open qw< :encoding(ASCII) >;

my $filename = "new_file.txt";
my $out_file = undef;
open($out_file, ">", $filename);

print $out_file "This is a sample line of text\n";
print $out_file "Yet another line\n";

close($out_file);

# sanity check
system("cat new_file.txt");
```

* `>` symbol in `open` indicates that we wish to write to a new file
    * if the file already exists, its contents will get overwritten
    * use `>>` to append to an existing file
* all print statements we have seen prior to this example uses the filehandle `STDOUT` by default and thus we see the print result on terminal
* to print error messages instead of normal output, use the `STDERR` filehandle. We'll see examples in next section
* by using `print $out_file`, printing is redirected to that filehandle instead of default `STDOUT`

```
$ ./file_writing.pl
This is a sample line of text
Yet another line
```

<br>

### <a name="nested-file-handling"></a>Nested file handling

Often, one needs to read one file to get list of filenames for further processing. Nesting `while` loop with filehandles may result in unintended consequences  
In such cases, one can read entire file contents into an array and iterate using `foreach` for one loop and use `while` for the other

```perl
# assign entire contents of file to array variable, each item contains single line from file
my @file_contents = <$file_handle>;
```

This method also allows an easier way to process file lines relative to current line by using `for` loop to iterate using explicit indices

**Further Reading**

* [open](http://perldoc.perl.org/perlopentut.html)
* [why opening files in old way is bad](http://perlmaven.com/open-files-in-the-old-way)
* [autodie](http://perldoc.perl.org/autodie.html)

