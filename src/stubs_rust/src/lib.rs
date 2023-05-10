use ocaml;
use u64;

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

#[derive(ocaml::FromValue, ocaml::IntoValue)]
pub struct T {
    f1: u64,
}

#[ocaml::func]
pub fn caml_rust_get_u64_max_stubs(s1: T, s2: T) -> T {
    T { f1: s1.f1 + s2.f1 }
}
