
let verbose = ref true

let main () =
  let cmd = Array.to_list (Sys.argv) in
  let cmd = List.tl cmd in
  let cmd = Filename.quote_command (List.hd cmd) (List.tl cmd) in
  Fmt.(pf stderr "LAUNCH: command %s\n%!" cmd);
  let st = Unix.system cmd in
  begin match st with
    Unix.WEXITED 0 -> Ok ()
  | Unix.WEXITED n -> exit n
  | WSIGNALED n ->
     failwith (Printf.sprintf "LAUNCH: command killed by signal %d" n)
  | WSTOPPED n ->
     failwith (Printf.sprintf "LAUNCH: command stopped by signal %d" n)
  end

let _ =
  try main () with
    exc -> Fmt.(pf stderr "%a\n%!" exn exc); exit 1
