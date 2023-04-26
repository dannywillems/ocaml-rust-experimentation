module Stubs = struct
  external unit_call : unit -> unit = "caml_c_unit_call_stubs"

  external two_int_unit : int -> int -> unit = "caml_c_two_int_unit_stubs"

  external add_two_int : int -> int -> int = "caml_c_add_two_int_stubs"

  external three_int_unit : int -> int -> int -> unit
    = "caml_c_three_int_unit_stubs"
end

let unit_call = Stubs.unit_call

let two_int_unit = Stubs.two_int_unit

let three_int_unit = Stubs.three_int_unit

let add_int = Stubs.add_two_int
