open Core_bench

let bench_rust =
  Bench.Test.create ~name:"Bench Rust unit" (fun () -> Stubs_rust.unit_call ())

let bench_rust_add_int =
  Bench.Test.create ~name:"Bench Rust add integers" (fun () ->
      Stubs_rust.add_int 42 42)

let bench_rust_two_int_unit =
  Bench.Test.create ~name:"Bench Rust two integers unit" (fun () ->
      Stubs_rust.two_int_unit 42 42)

let bench_rust_three_int_unit =
  Bench.Test.create ~name:"Bench Rust three integers unit" (fun () ->
      Stubs_rust.three_int_unit 42 42 42)

let bench_c =
  Bench.Test.create ~name:"Bench C unit" (fun () -> Stubs_c.unit_call ())

let bench_c_two_int_unit =
  Bench.Test.create ~name:"Bench C two integers unit" (fun () ->
      Stubs_c.two_int_unit 42 42)

let bench_c_three_int_unit =
  Bench.Test.create ~name:"Bench C three integers unit" (fun () ->
      Stubs_c.three_int_unit 42 42 42)

let bench_c_add_int =
  Bench.Test.create ~name:"Bench c add integers" (fun () ->
      Stubs_c.add_int 42 42)

let () =
  Command_unix.run
    (Core_bench.Bench.make_command
       [ bench_c;
         bench_c_add_int;
         bench_c_two_int_unit;
         bench_c_three_int_unit;
         bench_rust;
         bench_rust_add_int;
         bench_rust_two_int_unit;
         bench_rust_three_int_unit ])
