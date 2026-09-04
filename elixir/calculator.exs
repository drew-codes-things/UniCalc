defmodule Calculator do
  def fail(msg) do
    IO.puts(msg)
    System.halt(1)
  end

  def format_result(r) do
    if r == Float.round(r) do
      IO.puts(trunc(r))
    else
      IO.puts(r)
    end
  end

  def run(args) do
    case args do
      [a_str, op, b_str] ->
        a = parse_num(a_str)
        b = parse_num(b_str)

        if a == :error or b == :error do
          fail("Error: invalid number")
        else
          case op do
            "+" -> format_result(a + b)
            "-" -> format_result(a - b)
            "*" -> format_result(a * b)
            "/" ->
              if b == 0 do
                fail("Error: division by zero")
              else
                format_result(a / b)
              end
            _ -> fail("Error: unknown operator")
          end
        end

      _ ->
        fail("Error: expected 3 arguments <a> <op> <b>")
    end
  end

  def parse_num(str) do
    case Float.parse(str) do
      {f, ""} -> f
      _ ->
        case Integer.parse(str) do
          {i, ""} -> i * 1.0
          _ -> :error
        end
    end
  end
end

Calculator.run(System.argv())
