
let verbose = ref true

let main () =
  let cmd = Array.to_list (Sys.argv) in
  let prog = List.hd cmd in
  let cmd = List.tl cmd in
  let cmd = Filename.quote_command (List.hd cmd) (List.tl cmd) in
  Fmt.(pf stderr "%s: command %s\n%!" prog cmd);
  let st = Unix.system cmd in
  begin match st with
    Unix.WEXITED 0 -> Ok ()
  | Unix.WEXITED n -> exit n
  | WSIGNALED n ->
     failwith (Printf.sprintf "%s: command killed by signal %d" prog n)
  | WSTOPPED n ->
     failwith (Printf.sprintf "%s: command stopped by signal %d" prog n)
  end

let _ =
  try main () with
    exc -> Fmt.(pf stderr "%a\n%!" exn exc); exit 1
