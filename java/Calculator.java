public class Calculator {
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Error: expected 3 arguments <a> <op> <b>");
            System.exit(1);
        }

        double a, b;
        try {
            a = Double.parseDouble(args[0]);
            b = Double.parseDouble(args[2]);
        } catch (NumberFormatException e) {
            System.out.println("Error: invalid number");
            System.exit(1);
            return;
        }
        String op = args[1];
        double result;

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
                if (b == 0) {
                    System.out.println("Error: division by zero");
                    System.exit(1);
                    return;
                }
                result = a / b;
                break;
            default:
                System.out.println("Error: unknown operator");
                System.exit(1);
                return;
        }

        if (result == Math.floor(result)) {
            System.out.println((long) result);
        } else {
            System.out.println(result);
        }
    }
}
