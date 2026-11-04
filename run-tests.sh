#!/usr/bin/env bash
set -u
cd "$(dirname "$0")"

CASES=(
  "5 + 3|8|0"
  "10 - 4|6|0"
  "6 * 7|42|0"
  "20 / 4|5|0"
  "7 / 2|3.5|0"
  "-5 + 3|-2|0"
  "2.5 * 2|5|0"
  "1 / 0|ERROR|1"
  "5 ^ 3|ERROR|1"
  "abc + 1|ERROR|1"
  "5 +|ERROR|1"
)

declare -A RUN BUILD NEEDS
NEEDS[python]=python3;     RUN[python]='python3 python/calculator.py'
NEEDS[javascript]=node;    RUN[javascript]='node javascript/calculator.js'
NEEDS[c]=gcc;              BUILD[c]='gcc -o c/calculator c/calculator.c';                       RUN[c]='c/calculator'
NEEDS[cpp]=g++;            BUILD[cpp]='g++ -o cpp/calculator cpp/calculator.cpp';               RUN[cpp]='cpp/calculator'
NEEDS[java]=javac;         BUILD[java]='javac java/Calculator.java';                            RUN[java]='java -cp java Calculator'
NEEDS[perl]=perl;          RUN[perl]='perl perl/calculator.pl'
NEEDS[bash]=bc;            RUN[bash]='bash bash/calculator.sh'
NEEDS[go]=go;              BUILD[go]='go build -o go/calculator go/calculator.go';               RUN[go]='go/calculator'
NEEDS[rust]=rustc;         BUILD[rust]='rustc -O -o rust/calculator rust/calculator.rs';         RUN[rust]='rust/calculator'
NEEDS[ruby]=ruby;          RUN[ruby]='ruby ruby/calculator.rb'
NEEDS[php]=php;            RUN[php]='php php/calculator.php'
NEEDS[lua]=lua5.4;         RUN[lua]='lua5.4 lua/calculator.lua'
NEEDS[haskell]=runghc;     RUN[haskell]='runghc haskell/calculator.hs'
NEEDS[common-lisp]=sbcl;   RUN[common-lisp]='sbcl --script common-lisp/calculator.lisp'
NEEDS[scheme]=guile;       RUN[scheme]='guile --no-auto-compile scheme/calculator.scm'
NEEDS[erlang]=escript;     RUN[erlang]='escript erlang/calculator.erl'
NEEDS[elixir]=elixir;      RUN[elixir]='elixir elixir/calculator.exs'
NEEDS[fortran]=gfortran;   BUILD[fortran]='gfortran -o fortran/calculator fortran/calculator.f90'; RUN[fortran]='fortran/calculator'
NEEDS[cobol]=cobc;         BUILD[cobol]='cobc -x -free -o cobol/calculator cobol/calculator.cob'; RUN[cobol]='cobol/calculator'
NEEDS[pascal]=fpc;         BUILD[pascal]='fpc -opascal/calculator pascal/calculator.pas';         RUN[pascal]='pascal/calculator'
NEEDS[ada]=gnatmake;       BUILD[ada]='gnatmake -q -o ada/calculator ada/calculator.adb';         RUN[ada]='ada/calculator'
NEEDS[prolog]=swipl;       RUN[prolog]='swipl prolog/calculator.pl --'
NEEDS[tcl]=tclsh;          RUN[tcl]='tclsh tcl/calculator.tcl'
NEEDS[ocaml]=ocaml;        RUN[ocaml]='ocaml ocaml/calculator.ml'
NEEDS[awk]=gawk;           RUN[awk]='AWK'
NEEDS[kotlin]=kotlinc;     RUN[kotlin]='kotlinc -script kotlin/calculator.kts --'
NEEDS[julia]=julia;        RUN[julia]='julia julia/calculator.jl'

ORDER=(python javascript c cpp java perl bash go rust ruby php lua haskell common-lisp scheme erlang elixir fortran cobol pascal ada prolog tcl ocaml awk kotlin julia)

pass=0; fail=0; skipped=()
for lang in "${ORDER[@]}"; do
  if ! command -v "${NEEDS[$lang]}" >/dev/null 2>&1; then skipped+=("$lang"); continue; fi
  if [[ -n "${BUILD[$lang]:-}" ]] && ! ${BUILD[$lang]} >/dev/null 2>&1; then
    echo "FAIL  $lang: build failed"; fail=$((fail + 11)); continue
  fi
  for case in "${CASES[@]}"; do
    IFS='|' read -r expr want_out want_code <<< "$case"
    read -r a op b <<< "$expr"
    if [[ "${RUN[$lang]}" == AWK ]]; then
      out=$(gawk -v "a=$a" -v "op=$op" -v "b=${b:-}" -f awk/calculator.awk 2>/dev/null); code=$?
    elif [[ -z "$b" ]]; then
      out=$(${RUN[$lang]} "$a" "$op" 2>/dev/null); code=$?
    else
      out=$(${RUN[$lang]} "$a" "$op" "$b" 2>/dev/null); code=$?
    fi
    out=$(printf '%s' "$out" | tr -d '\r' | sed 's/^ *//; s/ *$//')
    ok=1
    if [[ "$want_out" == ERROR ]]; then
      [[ "$out" == Error:* && "$code" -ne 0 ]] || ok=0
    else
      [[ "$out" == "$want_out" && "$code" -eq 0 ]] || ok=0
    fi
    if [[ $ok -eq 1 ]]; then pass=$((pass + 1)); else fail=$((fail + 1)); echo "FAIL  $lang: '$expr' -> got '$out' (exit $code), wanted '$want_out' (exit $want_code)"; fi
  done
done

echo
echo "Passed: $pass  Failed: $fail  Skipped (toolchain not installed): ${#skipped[@]} [${skipped[*]}]"
[[ $fail -eq 0 ]]
