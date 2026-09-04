program calculator
    implicit none
    character(len=64) :: a_str, op, b_str
    real(8) :: a, b, result
    integer :: ios1, ios2, nargs

    nargs = command_argument_count()
    if (nargs /= 3) then
        print '(A)', "Error: expected 3 arguments <a> <op> <b>"
        call exit(1)
    end if

    call get_command_argument(1, a_str)
    call get_command_argument(2, op)
    call get_command_argument(3, b_str)

    read(a_str, *, iostat=ios1) a
    read(b_str, *, iostat=ios2) b
    if (ios1 /= 0 .or. ios2 /= 0) then
        print '(A)', "Error: invalid number"
        call exit(1)
    end if

    op = trim(op)

    if (trim(op) == "+") then
        result = a + b
    else if (trim(op) == "-") then
        result = a - b
    else if (trim(op) == "*") then
        result = a * b
    else if (trim(op) == "/") then
        if (b == 0.0d0) then
            print '(A)', "Error: division by zero"
            call exit(1)
        end if
        result = a / b
    else
        print '(A)', "Error: unknown operator"
        call exit(1)
    end if

    if (result == aint(result)) then
        print '(I0)', int(result)
    else
        print '(G0)', result
    end if
end program calculator
