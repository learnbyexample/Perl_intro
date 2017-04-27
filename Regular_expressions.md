# <a name="regular-expressions"></a>Regular Expressions

* [Pattern matching and extraction](#pattern-matching-and-extraction)
* [Transliteration operator](#transliteration-operator)
* [Search and Replace](#search-and-replace)
* [split](#split)


Regular expression look-up tables

| Special characters | Description |
| ------------- | ----------- |
| ^ | anchor, match from beginning of string |
| $ | anchor, match end of string |
| . | Match any character except newline character \n |
| &#124; | OR operator for matching multiple patterns |
| () | for grouping patterns and also extraction |
| [] | Character class to match one character among many |
| &#92;^ | use \ to match special characters like ^ |

<br>

| Quantifiers | Description |
| ------------- | ----------- |
| * | Match zero or more times the preceding character |
| + | Match one or more times the preceding character |
| ? | Match zero or one times the preceding character |
| {n} | Match exactly n times |
| {n,} | Match atleast n times |
| {n,m} | Match atleast n times but not more than m times |

<br>

| Character classes | Description |
| ------------- | ----------- |
| [aeiou] | Match any vowel |
| \[^aeiou] | ^ inverts selection, so this matches any consonant |
| [a-f] | Match any of abcdef character |
| \d | Match a digit, same as [0-9] |
| \D | Match non-digit, same as \[^0-9] or \[^\d] |
| \w | Match alphanumeric and underscore character, same as [a-zA-Z_] |
| \W | Match non-alphanumeric and underscore character, same as \[^a-zA-Z_] or \[^\w] |
| \s | Match white-space character, same as [\ \t\r\n\f] |
| \S | Match non white-space character, same as \[^\s] |
| \t | Match horizontal tab character |
| \h | Match horizontal space characters |
| \H | Match other than horizontal space characters |

<br>

| Miscellaneous | Description |
| ------------- | ----------- |
| \b | word boundary |
| \B | not a word boundary |
| \U | uppercases pattern until end of string or \L or \E |
| \L | lowercases pattern until end of string or \U or \E |
| \u | uppercases only next character |
| \l | lowercases only next character |
| \Q | quote metacharacters until end of string or \E |
| \E | terminate case conversion or quoted section |

* `\u \U \l \L \Q \E` will work in any double quoted strings
* example: `$book = "\uelantris"` is equivalent to `$book = "Elantris"`
<br>

| Modifier | Description |
| ------------- | ----------- |
| g | global, match all patterns in string, not just the first |
| i | Ignore case |
| m | multiline mode, ^ and $ anchors work on internal lines |
| s | singleline mode, . will also match \n |
| e | evaluate replacement string as an expression |
| r | return substituted string without modifying the variable |

<br>

| Variable | Description |
| ------------- | ----------- |
| $1, $2, $3 etc | Matched patterns grouped inside () |
| \1, \2, \3 etc | backreferencing while defining match pattern |
| $` | String before matched pattern |
| $& | Matched pattern |
| $' | String after matched pattern |

<br>

### <a name="pattern-matching-and-extraction"></a>Pattern matching and extraction

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $string = "This is a sample string";

# positive and negative match examples
print "\$string: $string\n\n";
print "\$string has the pattern 'is'\n" if($string =~ m/is/);
print "\$string does not have the pattern 'this'\n" if($string !~ m/this/);
print "\$string has the pattern 'this' when matching case-insensitively\n\n" if($string =~ m/this/i);

# check out what happens when \b is not used
if($string =~ m/\bis/)
{
    # single quotes used to clarify space character in output
    print "Pattern specified:             '\\bis'\n";
    print "String before matched pattern: '$`'\n";
    print "String matching pattern:       '$&'\n";
    print "String after matched pattern:  '$''\n\n";
}

# assigning matched pattern to variables
my ($word1) = $string =~ m/(s[a-z]*e)/i;
print "Word starting with 's' and ending with 'e': $word1\n";
my (@all_words) = $string =~ m/([a-z]+)/gi;
print "All words in \$string: ";
print "'$_' " foreach(@all_words);
print "\n\n";

# what happens when output is saved in scalar context
# again, single quotes used to clarify output
my $match_output = $string =~ m/is/;
print "Output when pattern matches: '$match_output'\n";
$match_output = $string =~ m/line/;
print "Output when pattern does not match: '$match_output'\n";
```

* General syntax for pattern matching: `$var =~ m/PATTERN/MODIFIER`
* `$var =~ m` portion of the syntax can be ignored if matching against `$_` variable
* logically invert match pattern, use: `$var !~ m/PATTERN/MODIFIER`
* when pattern doesn't match, `undef` value is returned which acts as a logical false condition

```
$ ./regex_match.pl
$string: This is a sample string

$string has the pattern 'is'
$string does not have the pattern 'this'
$string has the pattern 'this' when matching case-insensitively

Pattern specified:             '\bis'
String before matched pattern: 'This '
String matching pattern:       'is'
String after matched pattern:  ' a sample string'

Word starting with 's' and ending with 'e': sample
All words in $string: 'This' 'is' 'a' 'sample' 'string' 

Output when pattern matches: '1'
Output when pattern does not match: ''
```

<br>

### <a name="transliteration-operator"></a>Transliteration operator

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $greeting = '===== Have a great day =====';
$greeting =~ tr/=/*/;
print "$greeting\n";

# s modifier lets you 'squash' repetitive character sequences
my $lose = "Don't loose hope :)";
$lose =~ tr/a-zA-Z//s;
print "$lose\n";

# d modifier is used to delete characters
# c modifier complements the searchlist
my $sentence = "Th'i1s is34 a; senten6#ce";
$sentence =~ tr/a-zA-Z //cd;
print "$sentence\n";

# r modifier lets you retain original variable untouched and assign modified string to another variable
my $uppercase_quote = 'SIMPLICITY IS THE ULTIMATE SOPHISTICATION';
my $lowercase_quote = $uppercase_quote =~ tr/A-Z/a-z/r;
print "$lowercase_quote\n";

# tr can be used to count matching characters
my $mixed_str  = 'He has 5 cricket bats, 2 sets of stumps and a glove set';
my $letter_cnt = $mixed_str =~ tr/a-zA-Z//;
my $digit_cnt  = $mixed_str =~ tr/0-9//;
print "\$mixed_str: $mixed_str\n";
print "\$mixed_str has $letter_cnt letters and $digit_cnt digits\n";
```

* General syntax for transliteration: `$var =~ tr/SEARCHLIST/REPLACEMENTLIST/MODIFIER`
* `$var =~ ` portion of the syntax can be ignored for `$_` variable
* `tr` works by replacing SEARCHLIST by corresponding character in REPLACEMENTLIST
* for modifiers `d` and `s`, REPLACEMENTLIST is optional
* `tr` doesn't allow regular expression elements other than the range operator (ex: `0-9`, `a-f`, etc)

```
$ ./regex_tr.pl
***** Have a great day *****
Don't lose hope :)
This is a sentence
simplicity is the ultimate sophistication
$mixed_str: He has 5 cricket bats, 2 sets of stumps and a glove set
$mixed_str has 40 letters and 2 digits
```

<br>

### <a name="search-and-replace"></a>Search and Replace

```perl
#!/usr/bin/perl
use strict;
use warnings;

my $str = 'sample string';
$str =~ s/sample/test/;
print "simple replace:              $str\n";

# different delimiters like |,#,% etc can be used instead of /
my $date = '25/04/2016';
$date =~ s|/|-|g;
print "using different delimiter:   $date\n";

# use \ when you need to match special characters
my $greeting = '***** Have a great day *****';
$greeting =~ s/\*/=/g;
print "replacing special character: $greeting\n";

# pattern extraction
my $words = 'night and day';
$words =~ s/(\w+)( and )(\w+)/$3$2$1/;
print "swapping words:              $words\n\n";

# changing case of matched pattern
my $sentence = 'thIs iS a saMple StrIng';
print "\$sentence:     $sentence\n";
$sentence =~ s/^([a-z])(.*)/\U$1\L$2/;
print "Changing case: $sentence\n\n";

# e modifier
my $numbers = '34 28 91 42 5';
print "\$numbers:  $numbers\n";
$numbers =~ s/(\d+)/$1%5/ge;
print "numbers%5: $numbers\n\n";

# one can also call subroutines with e modifier
# use r modifier to retain original variable and assign output to another
$numbers = '1 2 3 4 5';
my $numbers_factorial = $numbers =~ s/(\d+)/num_fact($1)/ger;
print "\$numbers: $numbers\n";
print "numbers!: $numbers_factorial\n\n";

sub num_fact
{
    my ($num) = @_;
    return ($num == 0) ? 1 : $num * num_fact($num - 1);
}

# backreferencing in defining match pattern
my $line = 'Can you spot the the mistakes? I i seem to not';
print "\$line:     $line\n";
$line =~ s/\b(\w+) \1/$1/gi;
print "corrected: $line\n";
```

* General syntax: `$var =~ s/PATTERN/REPLACEMENTPATTERN/MODIFIER`
* `$var =~ ` portion of the syntax can be ignored for `$_` variable

```
$ ./regex_search_replace.pl
simple replace:              test string
using different delimiter:   25-04-2016
replacing special character: ===== Have a great day =====
swapping words:              day and night

$sentence:     thIs iS a saMple StrIng
Changing case: This is a sample string

$numbers:  34 28 91 42 5
numbers%5: 4 3 1 2 0

$numbers: 1 2 3 4 5
numbers!: 1 2 6 24 120

$line:     Can you spot the the mistakes? I i seem to not
corrected: Can you spot the mistakes? I seem to not
```

<br>

### <a name="split"></a>split

```perl
#!/usr/bin/perl
use strict;
use warnings;

# extracing words from a sentence
my $string = 'This is a sample string';
my @words = split /\s+/, $string;
print "\$string: $string\n";
print "words:   ".join(', ', @words)."\n\n";

# extracting letters from a word
my @letters = split //, $words[0];
print "splitting '$words[0]' into letters: @letters\n";

# saving even the pattern used to split
my $data = 'Rahul : 75 : 68 : 90';
my @columns = split /(\W+)/, $data;
print "\$data:    $data\n";
print "columns: ";
print "'$_' " foreach(@columns);
print "\n\n";

# using a count value to limit number of splits
my $info = '46 ways to publish a novel';
my @info_split = split /\s+/, $info, 2;
print "\$info:           $info\n";
print "\$info_split[0] = $info_split[0]\n";
print "\$info_split[1] = $info_split[1]\n";
```

* General syntax for split: `@output_var = split /PATTERN/, $var[, count]`
* `, $var[, count]` part of syntax can be ignored for `$_` variable

```
$ ./regex_split.pl
$string: This is a sample string
words:   This, is, a, sample, string

splitting 'This' into letters: T h i s
$data:    Rahul : 75 : 68 : 90
columns: 'Rahul' ' : ' '75' ' : ' '68' ' : ' '90' 

$info:           46 ways to publish a novel
$info_split[0] = 46
$info_split[1] = ways to publish a novel
```

**Further Reading**

* [perlrequick - quick tutorial](http://perldoc.perl.org/perlrequick.html)
* [perlretut - longer tutorial](http://perldoc.perl.org/perlretut.html)
* [perlreref - quick reference](http://perldoc.perl.org/perlreref.html)
* [Handy Perl regular expressions](http://www.catonmat.net/blog/perl-one-liners-explained-part-seven/)
* Practice and general regex tutorials (i.e they may not be Perl specific)
    * [online regex tester](https://regex101.com/#pcre) - [PCRE](http://www.pcre.org/), shows explanations, has reference guides and ability to save and share regex
    * [regexone](http://regexone.com/) - interative tutorial
    * [regexcrossword](https://regexcrossword.com/) - practice by solving crosswords, read 'How to play' section before you start

