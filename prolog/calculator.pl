:- initialization(main, main).

print_result(R) :-
    ( R =:= round(R)
    -> format("~d~n", [round(R)])
    ;  format("~w~n", [R])
    ).

main(Argv) :-
    ( Argv = [AStr, Op, BStr]
    -> ( catch(atom_number(AStr, A), _, fail),
         catch(atom_number(BStr, B), _, fail)
       -> ( Op == '+' -> Result is A + B, print_result(Result)
          ; Op == '-' -> Result is A - B, print_result(Result)
          ; Op == '*' -> Result is A * B, print_result(Result)
          ; Op == '/' ->
              ( B =:= 0
              -> writeln('Error: division by zero'), halt(1)
              ;  Result is A / B, print_result(Result)
              )
          ; writeln('Error: unknown operator'), halt(1)
          )
       ; writeln('Error: invalid number'), halt(1)
       )
    ; writeln('Error: expected 3 arguments <a> <op> <b>'), halt(1)
    ).
