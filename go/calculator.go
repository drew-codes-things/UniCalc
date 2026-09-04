package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Error: expected 3 arguments <a> <op> <b>")
		os.Exit(1)
	}

	a, err1 := strconv.ParseFloat(os.Args[1], 64)
	op := os.Args[2]
	b, err2 := strconv.ParseFloat(os.Args[3], 64)

	if err1 != nil || err2 != nil {
		fmt.Println("Error: invalid number")
		os.Exit(1)
	}

	var result float64

	switch op {
	case "+":
		result = a + b
	case "-":
		result = a - b
	case "*":
		result = a * b
	case "/":
		if b == 0 {
			fmt.Println("Error: division by zero")
			os.Exit(1)
		}
		result = a / b
	default:
		fmt.Println("Error: unknown operator")
		os.Exit(1)
	}

	if result == math.Trunc(result) {
		fmt.Println(int64(result))
	} else {
		fmt.Println(result)
	}
}
