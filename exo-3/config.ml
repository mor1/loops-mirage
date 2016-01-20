1(* This is the configuration file, used by the `mirage` command-line
   tool to generate an application.

   Usage: mirage configure --help
*)

open Mirage

(* Declare where the unikernel code is *)
let main = foreign
    "Unikernel.Main"              (* the name of the functor *)
    (console @-> stackv4 @-> job) (* the functor signature *)

let packages =  ["mirage-http"] (* additional OPAM packages needed *)
let libraries = ["mirage-http"] (* additional OCamlfind libraries needed *)

(* Register the application *)
let () =
  let stack = generic_stackv4 default_console tap0 in
  register "exo-3" ~packages ~libraries [ main $ default_console $ stack ]
