#!/usr/bin/env python3
import sys


def main():
    if len(sys.argv) != 4:
        print("Error: expected 3 arguments <a> <op> <b>")
        return 1

    a_str, op, b_str = sys.argv[1], sys.argv[2], sys.argv[3]

    try:
        a = float(a_str)
        b = float(b_str)
    except ValueError:
        print("Error: invalid number")
        return 1

    if op == "+":
        result = a + b
    elif op == "-":
        result = a - b
    elif op == "*":
        result = a * b
    elif op == "/":
        if b == 0:
            print("Error: division by zero")
            return 1
        result = a / b
    else:
        print("Error: unknown operator")
        return 1

    if result == int(result):
        print(int(result))
    else:
        print(result)
    return 0


if __name__ == "__main__":
    sys.exit(main())
