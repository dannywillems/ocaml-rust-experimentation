## OCaml/Rust experimentation

### Install

```
opam switch create ./ 4.14.0
opam install ocamlformat.0.24.1 merlin core core_bench core_unix
```

### Bench

```
dune exec ./src/bench.exe -- -q 2
```

Output example (lscpu -> 13th Gen Intel(R) Core(TM) i9-13900K)

```
Estimated testing time 16s (8 benchmarks x 2s). Change using '-quota'.
┌────────────────────────────────┬──────────┬────────────┐
│ Name                           │ Time/Run │ Percentage │
├────────────────────────────────┼──────────┼────────────┤
│ Bench C unit                   │   4.69ns │     11.17% │
│ Bench c add integers           │   4.37ns │     10.40% │
│ Bench C two integers unit      │   4.39ns │     10.46% │
│ Bench C three integers unit    │   4.71ns │     11.22% │
│ Bench Rust unit                │  13.78ns │     32.81% │
│ Bench Rust add integers        │  34.36ns │     81.81% │
│ Bench Rust two integers unit   │  32.29ns │     76.89% │
│ Bench Rust three integers unit │  41.99ns │    100.00% │
└────────────────────────────────┴──────────┴────────────┘
```

Conclusions:
- Rust bindings seem to have a linear (in the argument number) cost overhead

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

It seems ocaml-rs uses ocaml-boxroot, which is a new type of root registration, see https://gitlab.com/ocaml-rust/ocaml-boxroot.
