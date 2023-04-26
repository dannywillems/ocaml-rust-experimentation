#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>

CAMLprim value caml_c_unit_call_stubs(value vunit) {
  CAMLparam1(vunit);
  CAMLreturn(Val_unit);
}
