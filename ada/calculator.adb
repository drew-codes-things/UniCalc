with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Float_Text_IO;

procedure Calculator is
    A, B, Result : Float;

    procedure Fail (Msg : String) is
    begin
        Put_Line (Msg);
        Set_Exit_Status (Failure);
    end Fail;

begin
    if Argument_Count /= 3 then
        Fail ("Error: expected 3 arguments <a> <op> <b>");
        return;
    end if;

    begin
        A := Float'Value (Argument (1));
        B := Float'Value (Argument (3));
    exception
        when others =>
            Fail ("Error: invalid number");
            return;
    end;

    if Argument (2) = "+" then
        Result := A + B;
    elsif Argument (2) = "-" then
        Result := A - B;
    elsif Argument (2) = "*" then
        Result := A * B;
    elsif Argument (2) = "/" then
        if B = 0.0 then
            Fail ("Error: division by zero");
            return;
        end if;
        Result := A / B;
    else
        Fail ("Error: unknown operator");
        return;
    end if;

    if Result = Float'Truncation (Result) then
        Put_Line (Integer'Image (Integer (Result)));
    else
        declare
            Str : String (1 .. 20);
        begin
            Ada.Float_Text_IO.Put (Str, Result, Aft => 4, Exp => 0);
            Put_Line (Str);
        end;
    end if;
end Calculator;
