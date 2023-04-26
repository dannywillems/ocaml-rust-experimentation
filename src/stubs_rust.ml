module Stubs = struct
  external unit_call : unit -> unit = "caml_rust_unit_call_stubs"

  external add_int : int -> int -> int = "caml_rust_add_int_stubs"
end

let unit_call = Stubs.unit_call

let add_int x y = Stubs.add_int x y
