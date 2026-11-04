#!/usr/bin/env escript
fail(Msg) ->
    io:format("~s~n", [Msg]),
    halt(1).

format_result(R) ->
    Truncated = trunc(R),
    case R == float(Truncated) of
        true -> io:format("~w~n", [Truncated]);
        false -> io:format("~w~n", [R])
    end.

main(Args) when length(Args) =/= 3 ->
    fail("Error: expected 3 arguments <a> <op> <b>");
main([AStr, Op, BStr]) ->
    case {parse_num(AStr), parse_num(BStr)} of
        {error, _} -> fail("Error: invalid number");
        {_, error} -> fail("Error: invalid number");
        {A, B} ->
            case Op of
                "+" -> format_result(A + B);
                "-" -> format_result(A - B);
                "*" -> format_result(A * B);
                "/" ->
                    case B == 0 of
                        true -> fail("Error: division by zero");
                        false -> format_result(A / B)
                    end;
                _ -> fail("Error: unknown operator")
            end
    end.

parse_num(Str) ->
    case string:to_float(Str) of
        {F, []} -> F;
        {error, _} ->
            case string:to_integer(Str) of
                {I, []} -> float(I);
                _ -> error
            end;
        {_F, _Rest} -> error
    end.
