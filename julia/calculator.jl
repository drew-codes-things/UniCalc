function format_result(r::Float64)
    if r == trunc(r)
        println(Int64(trunc(r)))
    else
        println(r)
    end
end

function main()
    if length(ARGS) != 3
        println("Error: expected 3 arguments <a> <op> <b>")
        exit(1)
    end

    a = tryparse(Float64, ARGS[1])
    op = ARGS[2]
    b = tryparse(Float64, ARGS[3])

    if a === nothing || b === nothing
        println("Error: invalid number")
        exit(1)
    end

    if op == "+"
        format_result(a + b)
    elseif op == "-"
        format_result(a - b)
    elseif op == "*"
        format_result(a * b)
    elseif op == "/"
        if b == 0
            println("Error: division by zero")
            exit(1)
        end
        format_result(a / b)
    else
        println("Error: unknown operator")
        exit(1)
    end
end

main()
