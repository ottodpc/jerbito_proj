(* Partie I *)
type followers_assoc = (string * string list) list

val is_alphanum : char -> bool
val words : string -> string list

val add_follower_assoc : string -> string -> followers_assoc -> followers_assoc
val build_table_assoc : string list -> followers_assoc
val get_follower_assoc : followers_assoc -> string -> string
val generate_text_assoc : followers_assoc -> string list

(* Partie II *)
type distribution = { occurrences : int; followers : (string * int) list }
type followers_map

val compute_distribution : string list -> distribution
val build_table_map : string list -> followers_map
val get_follower_map : followers_map -> string -> string
val generate_text_map : followers_map -> string list

(* Partie III *)
type kind = Valid | Terminate | Single | Separator

val kind_of_char : char -> kind
val sentences : string -> string list list

type followers_multi

val start : int -> string list
val shift : string list -> string -> string list
val build_table_multi : string list list -> int -> followers_multi
val get_follower_multi : followers_multi -> string list -> string
val generate_text_multi : followers_multi -> string list

(* Pour les tests *)
val bindings_map : followers_map -> (string * distribution) list
val bindings_multi : followers_multi -> (string list * distribution) list
