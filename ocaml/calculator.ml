let format_result r =
  if r = Float.of_int (int_of_float r) then
    print_string (string_of_int (int_of_float r))
  else
    print_string (string_of_float r);
  print_newline ()

let () =
  let args = Sys.argv in
  if Array.length args <> 4 then begin
    print_endline "Error: expected 3 arguments <a> <op> <b>";
    exit 1
  end;

  let a_opt = float_of_string_opt args.(1) in
  let op = args.(2) in
  let b_opt = float_of_string_opt args.(3) in

  match a_opt, b_opt with
  | None, _ | _, None ->
    print_endline "Error: invalid number";
    exit 1
  | Some a, Some b ->
    (match op with
     | "+" -> format_result (a +. b)
     | "-" -> format_result (a -. b)
     | "*" -> format_result (a *. b)
     | "/" ->
       if b = 0.0 then begin
         print_endline "Error: division by zero";
         exit 1
       end else
         format_result (a /. b)
     | _ ->
       print_endline "Error: unknown operator";
       exit 1)
