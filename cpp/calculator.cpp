#include <iostream>
#include <string>
#include <cmath>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        std::cout << "Error: expected 3 arguments <a> <op> <b>" << std::endl;
        return 1;
    }

    double a, b, result;
    std::string op = argv[2];

    try {
        a = std::stod(argv[1]);
        b = std::stod(argv[3]);
    } catch (...) {
        std::cout << "Error: invalid number" << std::endl;
        return 1;
    }

    if (op == "+") {
        result = a + b;
    } else if (op == "-") {
        result = a - b;
    } else if (op == "*") {
        result = a * b;
    } else if (op == "/") {
        if (b == 0) {
            std::cout << "Error: division by zero" << std::endl;
            return 1;
        }
        result = a / b;
    } else {
        std::cout << "Error: unknown operator" << std::endl;
        return 1;
    }

    if (result == std::floor(result)) {
        std::cout << (long long)result << std::endl;
    } else {
        std::cout << result << std::endl;
    }
    return 0;
}
