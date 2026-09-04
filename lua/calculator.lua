#!/usr/bin/env lua5.4
if #arg ~= 3 then
    print("Error: expected 3 arguments <a> <op> <b>")
    os.exit(1)
end

local a = tonumber(arg[1])
local op = arg[2]
local b = tonumber(arg[3])

if a == nil or b == nil then
    print("Error: invalid number")
    os.exit(1)
end

local result

if op == "+" then
    result = a + b
elseif op == "-" then
    result = a - b
elseif op == "*" then
    result = a * b
elseif op == "/" then
    if b == 0 then
        print("Error: division by zero")
        os.exit(1)
    end
    result = a / b
else
    print("Error: unknown operator")
    os.exit(1)
end

if result == math.floor(result) then
    print(string.format("%d", result))
else
    print(result)
end
