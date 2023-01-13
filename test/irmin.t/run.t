Test that opam-monorepo can generate a lockfile and build irmin.

  $ opam-monorepo lock
  ==> Using 1 locally scanned package as the target.
  ==> Found 201 opam dependencies for the target package.
  ==> Querying opam database for their metadata and Dune compatibility.
  ==> Calculating exact pins for each of them.
  opam-monorepo: [WARNING] The following packages come from the same repository git+https://github.com/mirage/ocaml-git.git but are associated with different URLs:
  git-unix.3.11.0: https://github.com/mirage/ocaml-git/releases/download/3.11.0/git-3.11.0.tbz
  git-paf.3.11.0: https://github.com/mirage/ocaml-git/releases/download/3.11.0/git-3.11.0.tbz
  git-mirage.3.11.0: https://github.com/mirage/ocaml-git/releases/download/3.11.0/git-3.11.0.tbz
  git.3.11.0: https://github.com/mirage/ocaml-git/releases/download/3.11.0/git-3.11.0.tbz
  carton-lwt.0.6.0: https://github.com/mirage/ocaml-git/releases/download/carton-v0.6.0/git-carton-v0.6.0.tbz
  carton-git.0.6.0: https://github.com/mirage/ocaml-git/releases/download/carton-v0.6.0/git-carton-v0.6.0.tbz
  carton.0.6.0: https://github.com/mirage/ocaml-git/releases/download/carton-v0.6.0/git-carton-v0.6.0.tbz
  The url for the highest versioned package was selected: git-unix.3.11.0: https://github.com/mirage/ocaml-git/releases/download/3.11.0/git-3.11.0.tbz
  ==> Wrote lockfile with 124 entries to $TESTCASE_ROOT/opam-overlays-test-irmin.opam.locked. You can now run opam monorepo pull to fetch their sources.
  $ opam-monorepo pull
  ==> Using lockfile $TESTCASE_ROOT/opam-overlays-test-irmin.opam.locked
  Successfully pulled 124/124 repositories
  $ dune build
  $ dune exec irmin -- --version
  Creating menhirLib.ml...
  Creating menhirLib.mli...
  clang: warning: argument unused during compilation: '-mpopcnt' [-Wunused-command-line-argument]
  clang: warning: argument unused during compilation: '-mpopcnt' [-Wunused-command-line-argument]
  clang: warning: argument unused during compilation: '-mpopcnt' [-Wunused-command-line-argument]
  clang: warning: argument unused during compilation: '-mpopcnt' [-Wunused-command-line-argument]
  unix_tcgetattr_job.c:37:43: warning: passing 'volatile value *' (aka 'volatile long *') to parameter of type 'value *' (aka 'long *') discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
      encode_terminal_status(&job->termios, &Field(res, 0));
                                            ^~~~~~~~~~~~~~
  ./unix_termios_conversion.h:27:69: note: passing argument to parameter 'dst' here
  void encode_terminal_status(struct termios *terminal_status, value *dst);
                                                                      ^
  1 warning generated.
  unix_tcsetattr_job.c:59:27: warning: passing 'volatile value *' (aka 'volatile long *') to parameter of type 'const void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
      memcpy(&job->termios, &Field(termios, 0), NFIELDS * sizeof(value));
      ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:63:33: note: expanded from macro 'memcpy'
                  __builtin___memcpy_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                                ^~~~~~~~~~~
  1 warning generated.
  Generating assets.ml
  Skipping generation of .mli
  extract-from-certdata: [WARNING] Untrusted certificate "Explicitly Distrust DigiNotar Root CA" (serial 02100fffffffffffffffffffffffffffffff)
  yaml_stubs.c:11:10: warning: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
     char* x2 = yaml_get_version_string();
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~
  yaml_stubs.c:46:38: warning: passing 'char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_parser_set_input_string(x22, x23, x24);
                                       ^~~
  ../../vendor/yaml.h:1348:30: note: passing argument to parameter 'input' here
          const unsigned char *input, size_t size);
                               ^
  yaml_stubs.c:165:49: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     int x127 = yaml_alias_event_initialize(x125, x126);
                                                  ^~~~
  ../../vendor/yaml.h:555:69: note: passing argument to parameter 'anchor' here
  yaml_alias_event_initialize(yaml_event_t *event, const yaml_char_t *anchor);
                                                                      ^
  yaml_stubs.c:182:39: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_scalar_event_initialize(x136, x137, x138, x139, x140, x143, x146,
                                        ^~~~
  ../../vendor/yaml.h:581:28: note: passing argument to parameter 'anchor' here
          const yaml_char_t *anchor, const yaml_char_t *tag,
                             ^
  yaml_stubs.c:182:45: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_scalar_event_initialize(x136, x137, x138, x139, x140, x143, x146,
                                              ^~~~
  ../../vendor/yaml.h:581:55: note: passing argument to parameter 'tag' here
          const yaml_char_t *anchor, const yaml_char_t *tag,
                                                        ^
  yaml_stubs.c:182:51: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_scalar_event_initialize(x136, x137, x138, x139, x140, x143, x146,
                                                    ^~~~
  ../../vendor/yaml.h:582:28: note: passing argument to parameter 'value' here
          const yaml_char_t *value, int length,
                             ^
  yaml_stubs.c:212:47: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_sequence_start_event_initialize(x166, x167, x168, x169, x172);
                                                ^~~~
  ../../vendor/yaml.h:604:28: note: passing argument to parameter 'anchor' here
          const yaml_char_t *anchor, const yaml_char_t *tag, int implicit,
                             ^
  yaml_stubs.c:212:53: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_sequence_start_event_initialize(x166, x167, x168, x169, x172);
                                                      ^~~~
  ../../vendor/yaml.h:604:55: note: passing argument to parameter 'tag' here
          const yaml_char_t *anchor, const yaml_char_t *tag, int implicit,
                                                        ^
  yaml_stubs.c:233:46: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_mapping_start_event_initialize(x184, x185, x186, x187, x190);
                                               ^~~~
  ../../vendor/yaml.h:636:28: note: passing argument to parameter 'anchor' here
          const yaml_char_t *anchor, const yaml_char_t *tag, int implicit,
                             ^
  yaml_stubs.c:233:52: warning: passing 'char *' to parameter of type 'const yaml_char_t *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     yaml_mapping_start_event_initialize(x184, x185, x186, x187, x190);
                                                     ^~~~
  ../../vendor/yaml.h:636:55: note: passing argument to parameter 'tag' here
          const yaml_char_t *anchor, const yaml_char_t *tag, int implicit,
                                                        ^
  10 warnings generated.
  duniverse/ocaml-cf/lib_gen/cf_stubs.c:44:40: warning: passing 'unsigned char *' to parameter of type 'char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     _Bool x42 = CFStringGetCString(x34, x35, x36, x39);
                                         ^~~
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFString.h:329:57: note: passing argument to parameter 'buffer' here
  Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding);
                                                          ^
  duniverse/ocaml-cf/lib_gen/cf_stubs.c:126:51: warning: passing 'char *' to parameter of type 'UInt8 *' (aka 'unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     CFStringGetBytes(x134, x137, x138, x141, x144, x147, x148, x151);
                                                    ^~~~
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFString.h:362:148: note: passing argument to parameter 'buffer' here
  CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen);
                                                                                                                                                     ^
  duniverse/ocaml-cf/lib_gen/cf_stubs.c:162:53: warning: passing 'char *' to parameter of type 'const UInt8 *' (aka 'const unsigned char *') converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     CFStringRef x194 = CFStringCreateWithBytes(x183, x184, x185, x188, x191);
                                                      ^~~~
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFString.h:227:72: note: passing argument to parameter 'bytes' here
  CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation);
                                                                         ^
  3 warnings generated.
  Read 101 sample input sentences and 101 error messages.
  Read 101 sample input sentences and 48 error messages.
  Grammar has 56 nonterminal symbols, among which 1 start symbols.
  Grammar has 37 terminal symbols.
  Grammar has 129 productions.
  Built an LR(0) automaton with 194 states.
  The grammar is not SLR(1) -- 5 states have a conflict.
  The construction mode is no-pager.
  Built an LR(1) automaton with 298 states.
  One shift/reduce conflict was silently solved.
  Extra reductions on error were added in 40 states.
  Priority played a role in 0 of these states.
  152 out of 298 states have a default reduction.
  102 out of 298 states are represented.
  44 out of 96 symbols keep track of their start position.
  41 out of 96 symbols keep track of their end position.
  264 specialized copies of 64 functions have been created.
  The StackLang code contains 5161 instructions in 241 blocks.
  The StackLang code comprises 5 mutually recursive groups.
  Read 101 sample input sentences and 48 error messages.
  3.5.1
