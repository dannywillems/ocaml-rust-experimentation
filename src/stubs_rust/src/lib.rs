use ocaml;

#[ocaml::func]
pub fn caml_rust_unit_call_stubs() {}

#[ocaml::func]
pub fn caml_rust_add_int_stubs(x: isize, y: isize) -> isize {
    x + y
}

#[ocaml::func]
pub fn caml_rust_two_int_unit_stubs(_x: isize, _y: isize) {}

#[ocaml::func]
pub fn caml_rust_three_int_unit_stubs(_x: isize, _y: isize, _z: isize) {}
