<?php
if ($argc != 4) {
    echo "Error: expected 3 arguments <a> <op> <b>\n";
    exit(1);
}

$aStr = $argv[1];
$op = $argv[2];
$bStr = $argv[3];

if (!is_numeric($aStr) || !is_numeric($bStr)) {
    echo "Error: invalid number\n";
    exit(1);
}

$a = floatval($aStr);
$b = floatval($bStr);

switch ($op) {
    case '+':
        $result = $a + $b;
        break;
    case '-':
        $result = $a - $b;
        break;
    case '*':
        $result = $a * $b;
        break;
    case '/':
        if ($b == 0) {
            echo "Error: division by zero\n";
            exit(1);
        }
        $result = $a / $b;
        break;
    default:
        echo "Error: unknown operator\n";
        exit(1);
}

if ($result == intval($result)) {
    echo intval($result) . "\n";
} else {
    echo $result . "\n";
}
