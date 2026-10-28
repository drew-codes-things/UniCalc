#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Error: expected 3 arguments <a> <op> <b>\n");
        return 1;
    }

    char *end_a, *end_b;
    double a = strtod(argv[1], &end_a);
    const char *op = argv[2];
    double b = strtod(argv[3], &end_b);
    double result;

    if (end_a == argv[1] || *end_a != '\0' || end_b == argv[3] || *end_b != '\0') {
        printf("Error: invalid number\n");
        return 1;
    }

    if (strcmp(op, "+") == 0) {
        result = a + b;
    } else if (strcmp(op, "-") == 0) {
        result = a - b;
    } else if (strcmp(op, "*") == 0) {
        result = a * b;
    } else if (strcmp(op, "/") == 0) {
        if (b == 0) {
            printf("Error: division by zero\n");
            return 1;
        }
        result = a / b;
    } else {
        printf("Error: unknown operator\n");
        return 1;
    }

    if (result == (long long)result) {
        printf("%lld\n", (long long)result);
    } else {
        printf("%g\n", result);
    }
    return 0;
}
