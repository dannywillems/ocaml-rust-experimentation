let print_obj_info_int () =
  let res = Stubs_rust.add_int 1 1 in
  let reachable_words = Obj.reachable_words (Obj.magic res) in
  let size = Obj.size (Obj.magic res) in
  Printf.printf "Obj.size on int: %d\n" size ;
  Printf.printf "Obj.reachable_words on int: %d\n" reachable_words

let () = print_obj_info_int ()
