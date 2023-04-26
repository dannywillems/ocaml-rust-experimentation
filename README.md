## OCaml/Rust experimentation

### Install

```
opam switch create ./ 4.14.0
opam install ocamlformat.0.24.1 merlin core core_bench core_unix
dune exec ./src/bench.exe
```

### See generated code

```
rustup install nightly
cargo +nightly expand
```

Rusult from d09829a:
```rust
#![feature(prelude_import)]
#[prelude_import]
use std::prelude::rust_2021::*;
#[macro_use]
extern crate std;
use ocaml;
#[no_mangle]
pub extern "C" fn caml_rust_unit_call_stubs(_: ocaml::Raw) -> ocaml::Raw {
    #[inline(always)]
    fn inner(gc: &mut ocaml::Runtime) {
        {
            let _ = &gc;
        }
        {}
    }
    {
        let gc = unsafe { ::ocaml::Runtime::recover_handle() };
        #[cfg(not(feature = "no-std"))] ::ocaml::inital_setup();
        {
            {
                let res = inner(gc);
                #[allow(unused_unsafe)]
                let mut gc_ = unsafe { ocaml::Runtime::recover_handle() };
                unsafe { ocaml::IntoValue::into_value(res, &gc_).raw() }
            }
        }
    }
}
#[no_mangle]
pub extern "C" fn caml_rust_add_int_stubs(x: ocaml::Raw, y: ocaml::Raw) -> ocaml::Raw {
    #[inline(always)]
    fn inner(gc: &mut ocaml::Runtime, x: isize, y: isize) -> isize {
        {
            let _ = &gc;
        }
        { x + y }
    }
    {
        let gc = unsafe { ::ocaml::Runtime::recover_handle() };
        #[cfg(not(feature = "no-std"))] ::ocaml::inital_setup();
        {
            {
                let x = ocaml::FromValue::from_value(unsafe { ocaml::Value::new(x) });
                let y = ocaml::FromValue::from_value(unsafe { ocaml::Value::new(y) });
                let res = inner(gc, x, y);
                #[allow(unused_unsafe)]
                let mut gc_ = unsafe { ocaml::Runtime::recover_handle() };
                unsafe { ocaml::IntoValue::into_value(res, &gc_).raw() }
            }
        }
    }
}
```
