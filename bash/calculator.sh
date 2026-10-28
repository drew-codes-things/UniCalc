#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Error: expected 3 arguments <a> <op> <b>"
    exit 1
fi

a="$1"
op="$2"
b="$3"

number_re='^-?[0-9]+(\.[0-9]+)?$|^-?\.[0-9]+$'
if ! [[ "$a" =~ $number_re && "$b" =~ $number_re ]]; then
    echo "Error: invalid number"
    exit 1
fi

case "$op" in
    "+") expr_str="$a + $b" ;;
    "-") expr_str="$a - $b" ;;
    "*") expr_str="$a * $b" ;;
    "/")
        is_zero=$(echo "$b == 0" | bc -l)
        if [ "$is_zero" -eq 1 ]; then
            echo "Error: division by zero"
            exit 1
        fi
        expr_str="$a / $b"
        ;;
    *)
        echo "Error: unknown operator"
        exit 1
        ;;
esac

result=$(echo "scale=10; $expr_str" | bc -l)
if [[ "$result" == *.* ]]; then
    result=$(echo "$result" | sed -E 's/0+$//; s/\.$//')
fi
echo "$result"
