fun formatResult(r: Double) {
    if (r == Math.floor(r)) {
        println(r.toLong())
    } else {
        println(r)
    }
}

val cliArgs = args

if (cliArgs.size != 3) {
    println("Error: expected 3 arguments <a> <op> <b>")
    kotlin.system.exitProcess(1)
}

val aNullable = cliArgs[0].toDoubleOrNull()
val op = cliArgs[1]
val bNullable = cliArgs[2].toDoubleOrNull()

if (aNullable == null || bNullable == null) {
    println("Error: invalid number")
    kotlin.system.exitProcess(1)
}

val a: Double = aNullable!!
val b: Double = bNullable!!

when (op) {
    "+" -> formatResult(a + b)
    "-" -> formatResult(a - b)
    "*" -> formatResult(a * b)
    "/" -> {
        if (b == 0.0) {
            println("Error: division by zero")
            kotlin.system.exitProcess(1)
        }
        formatResult(a / b)
    }
    else -> {
        println("Error: unknown operator")
        kotlin.system.exitProcess(1)
    }
}
