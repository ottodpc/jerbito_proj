open Markov

(**** SIMPLE_0 ****)
let simple_0 = "x x y x z x y z z"
let words_0 = [ "x"; "x"; "y"; "x"; "z"; "x"; "y"; "z"; "z" ]

let build_assoc_0 =
  [
    ("START", [ "x" ]);
    ("x", [ "y"; "z"; "y"; "x" ]);
    ("y", [ "z"; "x" ]);
    ("z", [ "STOP"; "z"; "x" ]);
  ]

(* add_follower_assoc "x" "y" build_assoc_0 *)
let add_follower_assoc_0 =
  [
    ("START", [ "x" ]);
    ("x", [ "y"; "y"; "z"; "y"; "x" ]);
    ("y", [ "z"; "x" ]);
    ("z", [ "STOP"; "z"; "x" ]);
  ]

(* add_follower_assoc "a" "x" build_assoc_0 *)
let add_follower_assoc_0_1 =
  [
    ("START", [ "x" ]);
    ("x", [ "y"; "z"; "y"; "x" ]);
    ("y", [ "z"; "x" ]);
    ("z", [ "STOP"; "z"; "x" ]);
    ("a", [ "x" ]);
  ]

let compute_distribution_0 =
  { occurrences = 9; followers = [ ("z", 3); ("y", 2); ("x", 4) ] }

(* build_table_map words_0 |> bindings_map *)
let build_table_map_0 =
  [
    ("x", { occurrences = 1; followers = [ ("x", 1) ] });
    ("y", { occurrences = 2; followers = [ ("z", 1); ("x", 1) ] });
    ("z", { occurrences = 2; followers = [ ("x", 1); ("STOP", 1) ] });
  ]

(**** SIMPLE_1 ****)
let simple_1 =
  "I am a man and my dog is a good dog and a good dog makes a good man"

let words_1 =
  [
    "I";
    "am";
    "a";
    "man";
    "and";
    "my";
    "dog";
    "is";
    "a";
    "good";
    "dog";
    "and";
    "a";
    "good";
    "dog";
    "makes";
    "a";
    "good";
    "man";
  ]

let build_assoc_1 =
  [
    ("START", [ "I" ]);
    ("I", [ "am" ]);
    ("am", [ "a" ]);
    ("a", [ "good"; "good"; "good"; "man" ]);
    ("man", [ "STOP"; "and" ]);
    ("and", [ "a"; "my" ]);
    ("my", [ "dog" ]);
    ("dog", [ "makes"; "and"; "is" ]);
    ("is", [ "a" ]);
    ("good", [ "man"; "dog"; "dog" ]);
    ("makes", [ "a" ]);
  ]

(* add_follower_assoc "man" "dog" build_assoc_1 *)
let add_follower_assoc_1 =
  [
    ("START", [ "I" ]);
    ("I", [ "am" ]);
    ("am", [ "a" ]);
    ("a", [ "good"; "good"; "good"; "man" ]);
    ("man", [ "dog"; "STOP"; "and" ]);
    ("and", [ "a"; "my" ]);
    ("my", [ "dog" ]);
    ("dog", [ "makes"; "and"; "is" ]);
    ("is", [ "a" ]);
    ("good", [ "man"; "dog"; "dog" ]);
    ("makes", [ "a" ]);
  ]

let compute_distribution_1 =
  {
    occurrences = 19;
    followers =
      [
        ("my", 1);
        ("man", 2);
        ("makes", 1);
        ("is", 1);
        ("good", 3);
        ("dog", 3);
        ("and", 2);
        ("am", 1);
        ("a", 4);
        ("I", 1);
      ];
  }

let build_table_map_1 =
  [
    ("I", { occurrences = 1; followers = [ ("am", 1) ] });
    ("a", { occurrences = 4; followers = [ ("man", 1); ("good", 3) ] });
    ("and", { occurrences = 1; followers = [ ("my", 1) ] });
    ( "dog",
      { occurrences = 3; followers = [ ("makes", 1); ("is", 1); ("and", 1) ] }
    );
    ("man", { occurrences = 1; followers = [ ("STOP", 1) ] });
  ]

(**** SIMPLE_2 ****)
let simple_2 =
  "a good dad is proud of his son and a good son is proud of his dad"

let words_2 =
  [
    "a";
    "good";
    "dad";
    "is";
    "proud";
    "of";
    "his";
    "son";
    "and";
    "a";
    "good";
    "son";
    "is";
    "proud";
    "of";
    "his";
    "dad";
  ]

let build_assoc_2 =
  [
    ("START", [ "a" ]);
    ("a", [ "good"; "good" ]);
    ("good", [ "son"; "dad" ]);
    ("dad", [ "STOP"; "is" ]);
    ("is", [ "proud"; "proud" ]);
    ("proud", [ "of"; "of" ]);
    ("of", [ "his"; "his" ]);
    ("his", [ "dad"; "son" ]);
    ("son", [ "is"; "and" ]);
    ("and", [ "a" ]);
  ]

(* add_follower_assoc "dad" "dog" build_assoc_2 *)
let add_follower_assoc_2 =
  [
    ("START", [ "a" ]);
    ("a", [ "good"; "good" ]);
    ("good", [ "son"; "dad" ]);
    ("dad", [ "dog"; "STOP"; "is" ]);
    ("is", [ "proud"; "proud" ]);
    ("proud", [ "of"; "of" ]);
    ("of", [ "his"; "his" ]);
    ("his", [ "dad"; "son" ]);
    ("son", [ "is"; "and" ]);
    ("and", [ "a" ]);
  ]

let compute_distribution_2 =
  {
    occurrences = 17;
    followers =
      [
        ("son", 2);
        ("proud", 2);
        ("of", 2);
        ("is", 2);
        ("his", 2);
        ("good", 2);
        ("dad", 2);
        ("and", 1);
        ("a", 2);
      ];
  }

let build_table_2 =
  [
    ("a", { occurrences = 1; followers = [ ("good", 1) ] });
    ("and", { occurrences = 1; followers = [ ("a", 1) ] });
    ("dad", { occurrences = 2; followers = [ ("is", 1); ("STOP", 1) ] });
    ("good", { occurrences = 1; followers = [ ("son", 1) ] });
    ("his", { occurrences = 1; followers = [ ("son", 1) ] });
    ("is", { occurrences = 1; followers = [ ("proud", 1) ] });
    ("of", { occurrences = 1; followers = [ ("his", 1) ] });
    ("proud", { occurrences = 1; followers = [ ("of", 1) ] });
  ]

(**** SIMPLE_3 ****)
let simple_3 =
  "there is a beer in a fridge in a kitchen in a house in a land where there \
   is a man who has a house where there is no beer in the kitchen"

let words_3 =
  [
    "there";
    "is";
    "a";
    "beer";
    "in";
    "a";
    "fridge";
    "in";
    "a";
    "kitchen";
    "in";
    "a";
    "house";
    "in";
    "a";
    "land";
    "where";
    "there";
    "is";
    "a";
    "man";
    "who";
    "has";
    "a";
    "house";
    "where";
    "there";
    "is";
    "no";
    "beer";
    "in";
    "the";
    "kitchen";
  ]

let build_assoc_3 =
  [
    ("START", [ "there" ]);
    ("there", [ "is"; "is"; "is" ]);
    ("is", [ "no"; "a"; "a" ]);
    ("a", [ "house"; "man"; "land"; "house"; "kitchen"; "fridge"; "beer" ]);
    ("beer", [ "in"; "in" ]);
    ("in", [ "the"; "a"; "a"; "a"; "a" ]);
    ("fridge", [ "in" ]);
    ("kitchen", [ "STOP"; "in" ]);
    ("house", [ "where"; "in" ]);
    ("land", [ "where" ]);
    ("where", [ "there"; "there" ]);
    ("man", [ "who" ]);
    ("who", [ "has" ]);
    ("has", [ "a" ]);
    ("no", [ "beer" ]);
    ("the", [ "kitchen" ]);
  ]

(* add_follower_assoc "a" "dog" build_assoc_3 *)
let add_follower_assoc_3 =
  [
    ("START", [ "there" ]);
    ("there", [ "is"; "is"; "is" ]);
    ("is", [ "no"; "a"; "a" ]);
    ( "a",
      [ "dog"; "house"; "man"; "land"; "house"; "kitchen"; "fridge"; "beer" ] );
    ("beer", [ "in"; "in" ]);
    ("in", [ "the"; "a"; "a"; "a"; "a" ]);
    ("fridge", [ "in" ]);
    ("kitchen", [ "STOP"; "in" ]);
    ("house", [ "where"; "in" ]);
    ("land", [ "where" ]);
    ("where", [ "there"; "there" ]);
    ("man", [ "who" ]);
    ("who", [ "has" ]);
    ("has", [ "a" ]);
    ("no", [ "beer" ]);
    ("the", [ "kitchen" ]);
  ]

let compute_distribution_3 =
  {
    occurrences = 33;
    followers =
      [
        ("who", 1);
        ("where", 2);
        ("there", 3);
        ("the", 1);
        ("no", 1);
        ("man", 1);
        ("land", 1);
        ("kitchen", 2);
        ("is", 3);
        ("in", 5);
        ("house", 2);
        ("has", 1);
        ("fridge", 1);
        ("beer", 2);
        ("a", 7);
      ];
  }

let build_table_map_3 =
  [
    ( "a",
      {
        occurrences = 3;
        followers = [ ("land", 1); ("kitchen", 1); ("beer", 1) ];
      } );
    ("fridge", { occurrences = 1; followers = [ ("in", 1) ] });
    ("has", { occurrences = 1; followers = [ ("a", 1) ] });
    ("house", { occurrences = 2; followers = [ ("where", 1); ("in", 1) ] });
    ("in", { occurrences = 3; followers = [ ("the", 1); ("a", 2) ] });
    ("is", { occurrences = 1; followers = [ ("a", 1) ] });
    ("kitchen", { occurrences = 1; followers = [ ("STOP", 1) ] });
    ("man", { occurrences = 1; followers = [ ("who", 1) ] });
    ("no", { occurrences = 1; followers = [ ("beer", 1) ] });
    ("there", { occurrences = 2; followers = [ ("is", 2) ] });
    ("where", { occurrences = 1; followers = [ ("there", 1) ] });
  ]

let sort_assoc ll =
  List.sort compare ll
  |> List.map (fun (w, succ) -> (w, List.sort compare succ))

let sort_map ll : (string * (string * int) list) list =
  List.sort (fun (str, _) (str', _) -> String.compare str str') ll
  |> List.map (fun (str, { followers; _ }) ->
         (str, List.sort compare followers))
