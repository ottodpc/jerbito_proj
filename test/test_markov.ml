open Exemples

let is_alphanum_t () =
  Alcotest.(check bool) "is_alphanum" true (Markov.is_alphanum 'a');
  Alcotest.(check bool) "is_alphanum" true (Markov.is_alphanum 'c');
  Alcotest.(check bool) "is_alphanum" true (Markov.is_alphanum 'd');
  Alcotest.(check bool) "is_alphanum" true (Markov.is_alphanum '3');
  Alcotest.(check bool) "is_alphanum" true (Markov.is_alphanum '9')

let is_not_alphanum_t () =
  Alcotest.(check bool) "is_not_alphanum" false (Markov.is_alphanum '.');
  Alcotest.(check bool) "is_not_alphanum" false (Markov.is_alphanum '#');
  Alcotest.(check bool) "is_not_alphanum" false (Markov.is_alphanum '}');
  Alcotest.(check bool) "is_not_alphanum" false (Markov.is_alphanum ' ')

let words_t () =
  Alcotest.(check (list string)) "simple_0" words_0 (Markov.words simple_0);
  Alcotest.(check (list string)) "simple_1" words_1 (Markov.words simple_1);
  Alcotest.(check (list string)) "simple_2" words_2 (Markov.words simple_2);
  Alcotest.(check (list string)) "simple_3" words_3 (Markov.words simple_3)

let add_follower_assoc_t () =
  Alcotest.(check (list (pair string (list string))))
    "simple_0"
    (add_follower_assoc_0 |> sort_assoc)
    (Markov.add_follower_assoc "x" "y" build_assoc_0 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_1"
    (add_follower_assoc_1 |> sort_assoc)
    (Markov.add_follower_assoc "man" "dog" build_assoc_1 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_2"
    (add_follower_assoc_2 |> sort_assoc)
    (Markov.add_follower_assoc "dad" "dog" build_assoc_2 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_3"
    (add_follower_assoc_3 |> sort_assoc)
    (Markov.add_follower_assoc "a" "dog" build_assoc_3 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_01"
    (add_follower_assoc_0_1 |> sort_assoc)
    (Markov.add_follower_assoc "a" "x" build_assoc_0 |> sort_assoc)

let build_table_assoc_t () =
  Alcotest.(check (list (pair string (list string))))
    "simple_0"
    (build_assoc_0 |> sort_assoc)
    (Markov.build_table_assoc words_0 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_1"
    (build_assoc_1 |> sort_assoc)
    (Markov.build_table_assoc words_1 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_2"
    (build_assoc_2 |> sort_assoc)
    (Markov.build_table_assoc words_2 |> sort_assoc);
  Alcotest.(check (list (pair string (list string))))
    "simple_3"
    (build_assoc_3 |> sort_assoc)
    (Markov.build_table_assoc words_3 |> sort_assoc)

let compute_distribution_t () =
  Alcotest.(check (list (pair string int)))
    "simple_0"
    (compute_distribution_0.followers |> List.sort compare)
    (Markov.(compute_distribution words_0).followers |> List.sort compare);
  Alcotest.(check (list (pair string int)))
    "simple_1"
    (compute_distribution_1.followers |> List.sort compare)
    (Markov.(compute_distribution words_1).followers |> List.sort compare);
  Alcotest.(check (list (pair string int)))
    "simple_2"
    (compute_distribution_2.followers |> List.sort compare)
    (Markov.(compute_distribution words_2).followers |> List.sort compare);
  Alcotest.(check (list (pair string int)))
    "simple_3"
    (compute_distribution_3.followers |> List.sort compare)
    (Markov.(compute_distribution words_3).followers |> List.sort compare)

let build_table_map_t () =
  Alcotest.(check (list (pair string (list (pair string int)))))
    "simple_0"
    (build_table_map_0 |> sort_map)
    (Markov.(build_table_map words_0 |> Markov.bindings_map) |> sort_map)

(* Run it *)
let () =
  let open Alcotest in
  run "Projet : markov"
    [
      ( "is_alphanum",
        [
          test_case "true" `Quick is_alphanum_t;
          test_case "false" `Quick is_not_alphanum_t;
        ] );
      ("words", [ test_case "simple" `Quick words_t ]);
      ("add_follower_assoc", [ test_case "simple" `Quick add_follower_assoc_t ]);
      ("build_table_assoc", [ test_case "simple" `Quick build_table_assoc_t ]);
      ( "compute_distribution",
        [ test_case "simple" `Quick compute_distribution_t ] );
      ( "build_table_map",
        [ test_case "simple" `Quick build_table_map_t ] );
    ]
