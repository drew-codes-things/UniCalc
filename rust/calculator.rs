use std::env;
use std::process::exit;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        println!("Error: expected 3 arguments <a> <op> <b>");
        exit(1);
    }

    let a: f64 = match args[1].parse() {
        Ok(v) => v,
        Err(_) => {
            println!("Error: invalid number");
            exit(1);
        }
    };
    let op = &args[2];
    let b: f64 = match args[3].parse() {
        Ok(v) => v,
        Err(_) => {
            println!("Error: invalid number");
            exit(1);
        }
    };

    let result = match op.as_str() {
        "+" => a + b,
        "-" => a - b,
        "*" => a * b,
        "/" => {
            if b == 0.0 {
                println!("Error: division by zero");
                exit(1);
            }
            a / b
        }
        _ => {
            println!("Error: unknown operator");
            exit(1);
        }
    };

    if result == result.trunc() {
        println!("{}", result as i64);
    } else {
        println!("{}", result);
    }
}
