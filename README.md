<div align="center">

# Polyglot Calculator

**A basic calculator implemented from scratch in 27 different programming languages, built, run, and tested entirely locally.**

[![Languages](https://img.shields.io/badge/languages-27-blue?style=flat-square)]()
[![Tests](https://img.shields.io/badge/tests-297%2F297%20passing-brightgreen?style=flat-square)]()
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

</div>

---

## Overview

Every calculator takes the same three arguments and behaves identically:

```
<a> <op> <b>
```

`a` and `b` are numbers (integers or decimals, may be negative), `op` is one
of `+ - * /`. Whole-number results print without a decimal point. Division
by zero or an unrecognized operator prints an `Error: ...` line and exits
non-zero instead of crashing.

---

## Requirements

- The toolchain for whichever language you want to run (see the table
  below for the exact package)

---

## Running each language

All commands below are run from the project root and compute `5 + 3`.

| Language | Command |
|---|---|
| Python | `python3 python/calculator.py 5 + 3` |
| JavaScript | `node javascript/calculator.js 5 + 3` |
| C | `gcc -o c/calculator c/calculator.c && c/calculator 5 + 3` |
| C++ | `g++ -o cpp/calculator cpp/calculator.cpp && cpp/calculator 5 + 3` |
| Java | `javac java/Calculator.java && java -cp java Calculator 5 + 3` |
| Perl | `perl perl/calculator.pl 5 + 3` |
| Bash | `bash bash/calculator.sh 5 + 3` |
| Go | `go build -o go/calculator go/calculator.go && go/calculator 5 + 3` |
| Rust | `rustc -O -o rust/calculator rust/calculator.rs && rust/calculator 5 + 3` |
| Ruby | `ruby ruby/calculator.rb 5 + 3` |
| PHP | `php php/calculator.php 5 + 3` |
| Lua | `lua5.4 lua/calculator.lua 5 + 3` |
| Haskell | `runghc haskell/calculator.hs 5 + 3` |
| Common Lisp | `sbcl --script common-lisp/calculator.lisp 5 + 3` |
| Scheme | `guile --no-auto-compile scheme/calculator.scm 5 + 3` |
| Erlang | `escript erlang/calculator.erl 5 + 3` |
| Elixir | `elixir elixir/calculator.exs 5 + 3` |
| Fortran | `gfortran -o fortran/calculator fortran/calculator.f90 && fortran/calculator 5 + 3` |
| COBOL | `cobc -x -free -o cobol/calculator cobol/calculator.cob && cobol/calculator 5 + 3` |
| Pascal | `fpc -opascal/calculator pascal/calculator.pas && pascal/calculator 5 + 3` |
| Ada | `gnatmake -q -o ada/calculator ada/calculator.adb && ada/calculator 5 + 3` |
| Prolog | `swipl prolog/calculator.pl -- 5 + 3` |
| Tcl | `tclsh tcl/calculator.tcl 5 + 3` |
| OCaml | `ocaml ocaml/calculator.ml 5 + 3` |
| AWK | `gawk -v a=5 -v op=+ -v b=3 -f awk/calculator.awk` |
| Kotlin | `kotlinc -script kotlin/calculator.kts -- 5 + 3` |
| Julia | `julia julia/calculator.jl 5 + 3` |

---

## Running the tests

```bash
./run-tests.sh
```

`run-tests.sh` runs the same 11 cases (arithmetic, decimals, negatives, division by zero, an unknown operator, a non-numeric argument and a missing argument) against every calculator whose toolchain is on `PATH`, and skips the rest. 27 languages x 11 cases is where the 297 in the badge comes from.

---

## Languages (27)

Python, JavaScript, C, C++, Java, Perl, Bash, Go, Rust, Ruby, PHP, Lua,
Haskell, Common Lisp, Scheme (Guile), Erlang, Elixir, Fortran, COBOL,
Pascal, Ada, Prolog, Tcl, OCaml, AWK, Kotlin, Julia.

---

## Notes

- AWK's arguments are passed as `-v` variables rather than positionally,
  since plain positional arguments are treated as filenames by AWK.
- Ada prints results with a leading space on non-negative numbers, an
  artifact of `Integer'Image` - harmless, still a valid number.
- Swift is not included. The only snap package available for it
  (`swift-lang`) is an unofficial, unverified `devmode` package that does
  not actually provide a working `swift` binary.

---

## License

MIT - made by Drew
