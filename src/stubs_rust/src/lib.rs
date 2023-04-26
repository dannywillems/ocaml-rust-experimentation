use ocaml;

#[ocaml::func]
pub fn caml_rust_unit_call_stubs() {}

#[ocaml::func]
pub fn caml_rust_add_int_stubs(x: isize, y: isize) -> isize {
    x + y
}
