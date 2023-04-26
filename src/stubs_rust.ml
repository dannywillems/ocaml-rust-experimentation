module Stubs = struct
  external unit_call : unit -> unit = "caml_rust_unit_call_stubs"
end

let unit_call = Stubs.unit_call
