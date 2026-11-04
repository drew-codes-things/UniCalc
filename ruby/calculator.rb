#!/usr/bin/env ruby
if ARGV.length != 3
  puts "Error: expected 3 arguments <a> <op> <b>"
  exit 1
end

a_str, op, b_str = ARGV

unless a_str =~ /\A-?(\d+\.?\d*|\.\d+)\z/ && b_str =~ /\A-?(\d+\.?\d*|\.\d+)\z/
  puts "Error: invalid number"
  exit 1
end

a = a_str.to_f
b = b_str.to_f

result = case op
when "+" then a + b
when "-" then a - b
when "*" then a * b
when "/"
  if b == 0
    puts "Error: division by zero"
    exit 1
  end
  a / b
else
  puts "Error: unknown operator"
  exit 1
end

if result == result.to_i
  puts result.to_i
else
  puts result
end
