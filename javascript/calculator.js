#!/usr/bin/env node
function main() {
  const args = process.argv.slice(2);
  if (args.length !== 3) {
    console.log("Error: expected 3 arguments <a> <op> <b>");
    return 1;
  }

  const a = args[0].trim() === "" ? NaN : Number(args[0]);
  const op = args[1];
  const b = args[2].trim() === "" ? NaN : Number(args[2]);

  if (Number.isNaN(a) || Number.isNaN(b)) {
    console.log("Error: invalid number");
    return 1;
  }

  let result;
  switch (op) {
    case "+":
      result = a + b;
      break;
    case "-":
      result = a - b;
      break;
    case "*":
      result = a * b;
      break;
    case "/":
      if (b === 0) {
        console.log("Error: division by zero");
        return 1;
      }
      result = a / b;
      break;
    default:
      console.log("Error: unknown operator");
      return 1;
  }

  console.log(result);
  return 0;
}

process.exit(main());
