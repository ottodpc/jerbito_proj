[@@@ocaml.warning "-27"]
[@@@ocaml.warning "-69"]

let _ = Random.self_init ()

(* PARTIE A *)
type followers_assoc = (string * string list) list

let is_alphanum (c : char) : bool = failwith "TODO"
let words (str : string) : string list = failwith "TODO"

let add_follower_assoc (word : string) (follower : string)
    (followers : followers_assoc) : followers_assoc =
  failwith "TODO"

let build_table_assoc (words_list : string list) : followers_assoc =
  failwith "TODO"

let get_follower_assoc (table : followers_assoc) (word : string) : string =
  failwith "TODO"

let generate_text_assoc (table : followers_assoc) : string list =
  failwith "TODO"

(* PARTIE B *)

(* module StrMap =  *)

type distribution = { occurrences : int; followers : (string * int) list }
type followers_map = distribution StrMap.t

let compute_distribution (words : string list) : distribution = failwith "TODO"
let build_table_map (words_list : string list) : followers_map = failwith "TODO"

let get_follower_map (table : followers_map) (word : string) : string =
  failwith "TODO"

let generate_text_map (table : followers_map) : string list = failwith "TODO"

(* Partie C *)
type kind = Valid | Terminate | Single | Separator

let kind_of_char (c : char) : kind = failwith "TODO"
let sentences (text : string) : string list list = failwith "TODO"

(* module SLMap = *)

type followers_multi = { prefix_length : int; table : distribution SLMap.t }

let start (n : int) : string list = failwith "TODO"
let shift (words : string list) (next : string) : string list = failwith "TODO"

let build_table_multi (sentences : string list list) (prefix_length : int) :
    followers_multi =
  failwith "TODO"

let get_follower_multi ({ table; _ } : followers_multi) (prefix : string list) =
  failwith "TODO"

let generate_text_multi (table : followers_multi) : string list =
  failwith "TODO"

let bindings_map (table : followers_map) = StrMap.bindings table
let bindings_multi (table : followers_multi) = SLMap.bindings table
