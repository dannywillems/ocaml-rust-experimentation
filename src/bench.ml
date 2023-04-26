open Core_bench

let bench_rust = Bench.Test.create ~name:"Bench Rust unit" (fun () -> Stubs_rust.unit_call ())
let bench_c = Bench.Test.create ~name:"Bench C unit" (fun () -> Stubs_c.unit_call ())

let () = Command_unix.run (Core_bench.Bench.make_command [ bench_rust; bench_c ])
