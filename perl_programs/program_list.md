# List of programs

Listed in same order as introduced in the guide

* [hello_world.pl](./hello_world.pl)
* [strict.pl](./strict.pl)
* [warnings.pl](./warnings.pl)
* [screen_clear.pl](./screen_clear.pl)
* [backticks.pl](./backticks.pl)
* [numbers.pl](./numbers.pl)
* [strings.pl](./strings.pl)
* [user_input.pl](./user_input.pl)
* [user_input_str.pl](./user_input_str.pl)
* [user_input_chomp.pl](./user_input_chomp.pl)
* [if_elsif_else.pl](./if_elsif_else.pl)
* [if_oneliner.pl](./if_oneliner.pl)
* [for_loop.pl](./for_loop.pl)
* [while_loop.pl](./while_loop.pl)
* [loop_with_next.pl](./loop_with_next.pl)
* [loop_with_last.pl](./loop_with_last.pl)
* [arrays.pl](./arrays.pl)
* [foreach_loop.pl](./foreach_loop.pl)
* [hashes.pl](./hashes.pl)
* [references.pl](./references.pl)
* [subroutines.pl](./subroutines.pl)
* [variable_scope_1.pl](./variable_scope_1.pl)
* [variable_scope_2.pl](./variable_scope_2.pl)
* [variable_scope_3.pl](./variable_scope_3.pl)
* [regex_match.pl](./regex_match.pl)
* [regex_tr.pl](./regex_tr.pl)
* [regex_search_replace.pl](./regex_search_replace.pl)
* [regex_split.pl](./regex_split.pl)
* [file_reading.pl](./file_reading.pl)
* [file_reading_error.pl](./file_reading_error.pl)
* [file_writing.pl](./file_writing.pl)
* [sum_of_two_numbers.pl](./sum_of_two_numbers.pl)
* [varying_command_line_args.pl](./varying_command_line_args.pl)
* [line_count.pl](./line_count.pl)
* [word_count.pl](./word_count.pl)
* [getopt_std.pl](./getopt_std.pl)
* [syntax_error.pl](./syntax_error.pl)

# Changing shebang

If you need to change the shebang used in these programs from `#!/usr/bin/perl` to `#!/usr/bin/env perl`, use

```
$ sed -i 's|/usr/bin/perl|/usr/bin/env perl|' *.pl
```
