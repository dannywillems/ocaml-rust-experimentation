module Stubs = struct
  external unit_call : unit -> unit = "caml_rust_unit_call_stubs"

  external add_int : int -> int -> int = "caml_rust_add_int_stubs"

  external two_int_unit : int -> int -> unit = "caml_rust_two_int_unit_stubs"

  external three_int_unit : int -> int -> int -> unit
    = "caml_rust_three_int_unit_stubs"

  external get_u64_max : unit -> int64
    = "caml_rust_get_u64_max_stubs"

end

let unit_call = Stubs.unit_call

let add_int x y = Stubs.add_int x y

let two_int_unit x y = Stubs.two_int_unit x y

let three_int_unit x y z = Stubs.three_int_unit x y z

let get_u64_max = Stubs.get_u64_max
