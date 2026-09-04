program Calculator;
uses SysUtils;

var
    a, b, result: Double;
    op: string;
    code1, code2: Integer;

begin
    if ParamCount <> 3 then
    begin
        WriteLn('Error: expected 3 arguments <a> <op> <b>');
        Halt(1);
    end;

    Val(ParamStr(1), a, code1);
    op := ParamStr(2);
    Val(ParamStr(3), b, code2);

    if (code1 <> 0) or (code2 <> 0) then
    begin
        WriteLn('Error: invalid number');
        Halt(1);
    end;

    if op = '+' then
        result := a + b
    else if op = '-' then
        result := a - b
    else if op = '*' then
        result := a * b
    else if op = '/' then
    begin
        if b = 0 then
        begin
            WriteLn('Error: division by zero');
            Halt(1);
        end;
        result := a / b;
    end
    else
    begin
        WriteLn('Error: unknown operator');
        Halt(1);
    end;

    if result = Trunc(result) then
        WriteLn(Trunc(result))
    else
        WriteLn(FloatToStr(result));
end.
