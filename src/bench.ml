open Core_bench

let bench = Bench.Test.create ~name:"Bench unit" (fun () -> Stubs.unit_call ())
let () = Command_unix.run (Core_bench.Bench.make_command [ bench ])
