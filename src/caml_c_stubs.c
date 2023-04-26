#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>

CAMLprim value caml_c_unit_call_stubs(value vunit) {
  CAMLparam1(vunit);
  CAMLreturn(Val_unit);
}

CAMLprim value caml_c_two_int_unit_stubs(value vi1, value vi2) {
  CAMLparam2(vi1, vi2);
  CAMLreturn(Val_unit);
}

CAMLprim value caml_c_three_int_unit_stubs(value vi1, value vi2, value vi3) {
  CAMLparam3(vi1, vi2, vi3);
  CAMLreturn(Val_unit);
}

CAMLprim value caml_c_add_two_int_stubs(value vi1, value vi2) {
  CAMLparam2(vi1, vi2);
  CAMLreturn(Val_int(Int_val(vi1) + Int_val(vi2)));
}
