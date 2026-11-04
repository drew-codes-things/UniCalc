BEGIN {
    if (a == "" || op == "" || b == "") {
        print "Error: expected 3 arguments <a> <op> <b>"
        exit 1
    }
    if (a !~ /^-?([0-9]+\.?[0-9]*|\.[0-9]+)$/ || b !~ /^-?([0-9]+\.?[0-9]*|\.[0-9]+)$/) {
        print "Error: invalid number"
        exit 1
    }

    a = a + 0
    b = b + 0

    if (op == "+") {
        result = a + b
    } else if (op == "-") {
        result = a - b
    } else if (op == "*") {
        result = a * b
    } else if (op == "/") {
        if (b == 0) {
            print "Error: division by zero"
            exit 1
        }
        result = a / b
    } else {
        print "Error: unknown operator"
        exit 1
    }

    if (result == int(result)) {
        printf "%d\n", result
    } else {
        print result
    }
}
