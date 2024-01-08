open Custom_identifier

let () =
  Printf.printf "stdout: %s\n" (custom_identifier (Obj.repr stdout));
  Printf.printf "stdin: %s\n" (custom_identifier (Obj.repr stdin));
  Printf.printf "int32: %s\n" (custom_identifier (Obj.repr Int32.zero));
  Printf.printf "int64: %s\n" (custom_identifier (Obj.repr Int64.zero));
  Printf.printf "nativeint: %s\n" (custom_identifier (Obj.repr Nativeint.zero));
  Printf.printf "bigarray: %s\n" (custom_identifier (Obj.repr (Bigarray.Array0.create Bigarray.int32 Bigarray.C_layout)));
  Printf.printf "mutex: %s\n" (custom_identifier (Obj.repr (Mutex.create ())));
  Printf.printf "condition: %s\n" (custom_identifier (Obj.repr (Condition.create ())));
  Printf.printf "mmap: %s\n" (custom_identifier (Obj.repr (Unix.map_file (Unix.openfile "custom_identifier_test.ml" [O_RDONLY] 0) Bigarray.int32 Bigarray.c_layout false [|1|])));
  ()

let () =
  try
    ignore (custom_identifier (Obj.repr 1));
    assert false
  with Invalid_argument _ ->
    ()

let () =
  try
    ignore (custom_identifier (Obj.repr (1, 2, 3)));
    assert false
  with Invalid_argument _ ->
    ()
