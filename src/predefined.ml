let print_quote words =
  let rec print ppf = function
    | [] -> ()
    | ("\"" | "(" as o) :: rest ->
        Format.fprintf ppf "%s%a" o print rest
    | w :: ("!" | "?" | "." | ";" | ":" | "\"" | ")" | "," as t) :: rest ->
        Format.fprintf ppf "%s%s %a" w t print rest
    | w :: rest ->
        Format.fprintf ppf "%s %a" w print rest in
  Format.printf
    "%a @."
    print words

let simple_0 =
  "I am a man and my dog is a good dog and a good dog makes a good man"

let simple_1 =
  "a good dad is proud of his son and a good son is proud of his dad"

let simple_2 =
  "a good woman is proud of her daughter and a good daughter is proud of her \
   mom"

let simple_3 =
  "there is a beer in a fridge in a kitchen in a house in a land where there \
   is a man who has a house where there is no beer in the kitchen"

let multi_1 = "A good dad is proud of his son. A good son is proud of his dad."

let multi_2 =
  "A good woman is proud of her daughter. A good daughter is proud of her mom."

let multi_3 =
  "In a land of myths, and a time of magic, the destiny of a great kingdom \
   rests on the shoulders of a young man."

let grimms_travelling_musicians =
  "An honest farmer had once an ass that had been a faithful servant ..."

let grimms_cat_and_mouse_in_partnership =
  "A certain cat had made the acquaintance of a mouse, and ..."

let the_war_of_the_worlds_chapter_one =
  "No one would have believed in the last years ..."

let some_cookbook_sauce_chapter =
  "Wine Chaudeau: Into a lined saucepan put ½ bottle Rhine ..."

let history_of_ocaml = {|
“Caml” was originally an acronym for Categorical Abstract Machine Language. It was a pun on CAM, the Categorical Abstract Machine, and ML, the family of programming languages to which Caml belongs. The name Caml has remained throughout the evolution of the language, even though the present implementation has no relation with the CAM.

Caml was first designed and implemented by INRIA's Formel team, headed by Gérard Huet. Its development now continues within the Cristal team.
The Origin

The Formel team became interested in the ML language in 1980-81. ML was the meta-language of the Edinburgh version of the LCF proof assistant, both designed by Robin Milner. It was implemented by a kind of interpreter written in Lisp by Mike Gordon, Robin Milner and Christopher Wadsworth. LCF itself was written partly in ML and partly in Lisp. In order to be able to use the LCF proof assistant on the various systems in use at Formel at that time (Multics, Berkeley Unix on Vax, Symbolics), Gérard Huet decided to make the ML implementation compatible with various Lisp compilers (MacLisp, FranzLisp, LeLisp, ZetaLisp). This work involved Guy Cousineau and Larry Paulson. The performance of the ML implementation was improved by the addition of a compiler. Guy Cousineau also added algebraic data types and pattern-matching, following ideas from Robin Milner, which he in turn had borrowed from Hope, a programming language designed by Rod Burstall and Dave McQueen. At some point, this implementation was called Le_ML, a name that did not survive. It was used by Larry Paulson to develop Cambridge LCF and by Mike Gordon for the first version of HOL, as recalled in Gordon's short history of HOL.

Around 1984, three events motivated us to get even more involved in the development of ML:

    In Edinburgh, Luca Cardelli developed a much faster implementation of ML using his Functional Abstract Machine (FAM). He also designed his own version of the language, known at that time as Cardelli's ML.
    Robin Milner thought it was a good moment to propose a new definition of ML in order to avoid divergence between various implementations. He defined the core Standard ML language, which was later complemented by a module system designed by Dave McQueen.
    At the same time, Pierre-Louis Curien developed a calculus of categorical combinators, as well as a correspondence between lambda-calculus and categorical combinators, which, as noticed by Guy Cousineau, could be seen as a compilation technique for ML. Indeed, it was quite close to the original implementation technique of Edinburgh ML, but could be described, proved correct, and optimized in a simple way. This led to the definition of the Categorical Abstract Machine (CAM).

This urged Guy Cousineau to develop a new implementation of ML, based on the CAM. However, the language that we ended up implementing was not Standard ML, but... Caml. Why? Our main reason for developing Caml was to use it for sofware development inside Formel. Indeed, it was used for developing the Coq system, which, following Thierry Coquand's thesis in 1985, became the team's main aim. We were reluctant to adopt a standard that could later prevent us from adapting the language to our programming needs. In particular, Philippe Le Chenadec and Michel Mauny developed syntax manipulation tools that appeared useful and were incorporated into Caml. Synchronizing with the Standard ML team before adopting the language modifications that seemed useful to us would have introduced too much delay in our work. Furthermore, our philosophy was in conflict with that of a “standard” language, which is not supposed to evolve too quickly. We did incorporate into Caml most of the improvements brought by Standard ML over Edinburgh ML.
The First Implementation

The first implementation of Caml appeared in 1987 and was further developed until 1992. It was created mainly by Ascander Suarez. After Ascander left in 1988, Pierre Weis and Michel Mauny, carried on with the development and maintenance of the system. This implementation compiled Caml down to LLM3, the virtual machine of the Le_Lisp system.

Guy Cousineau modestly recalls: “I must admit that when the Caml development started, my experience with programming language implementation was very limited. Relying on the LLM3 abstract machine and on the Le_Lisp memory allocation and garbage collection system saved a lot of work but could not lead to high efficiency. The CAM model led to fast closure construction and good environment sharing but was poor at environment access and made optimizations difficult. It also potentially introduced memory leaks, since useless values were kept inside closures. Also, I had not realized that it was more important to have good performance on non-functional programs than on very functional ones. Above all, I had overlooked the importance of portability and openness. In spite of these inadequacies, for which I am initially responsible, Ascander, Pierre and Michel did quite a nice piece of work.”
Caml Light

In 1990 and 1991, Xavier Leroy designed a completely new implementation of Caml, based on a bytecode interpreter written in C. Damien Doligez provided an excellent memory management system. This new implementation, known as Caml Light, was highly portable and easily ran on small desktop machines such as Macs and PCs. It replaced the old Caml implementation and highly helped promote the use of Caml in education and in research teams. Its support for data streams and its parsing facilities, due to Michel Mauny, were issued from a continued effort of the Formel team to promote syntax manipulation tools.
Caml Special Light

In 1995, Xavier Leroy released Caml Special Light, which improved over Caml Light in several ways. First, an optimizing native-code compiler was added to the bytecode compiler. This native-code compiler matched or exceeded the performances of the best existing compilers for functional languages, and enabled Caml to be more competitive performance-wise with mainstream imperative programming languages such as C++. Second, Caml Special Light offered a high-level module system, designed by Xavier Leroy and inspired by the module system of Standard ML. This module system provides powerful abstraction and parameterization facilities for programming in the large.
Objective Caml

Type systems and type inference for object-oriented programming has been a hot area of research since the early 1990's. Didier Rémy, later joined by Jérôme Vouillon, designed an elegant and highly expressive type system for objects and classes. This design was integrated and implemented within Caml Special Light, leading to the Objective Caml language and implementation, first released in 1996 and renamed to OCaml in 2011. Objective Caml was the first language to combine the full power of object-oriented programming with ML-style static typing and type inference. It supports many advanced OO programming idioms (type-parametric classes, binary methods, mytype specialization) in a statically type-safe way, while these idioms cause unsoundness or require run-time type checks in other OO languages such as C++ and Java.

In 2000, Jacques Garrigue extended Objective Caml with several new features, which he had been experimenting with for a few years in the Objective Label dialect of Objective Caml. Among these features were polymorphic methods, labeled and optional function arguments, and polymorphic variants.
The rise of OCaml

Since the late 1990's, OCaml has been steadily gaining in popularity and attracted a significant user base. In addition to impressive programs developed in OCaml, the user community also contributed many high-quality libraries, frameworks and tools in areas ranging from graphical user interfaces and database bindings to Web and network programming, cross-language interoperability and static program analysis. In parallel, the core OCaml development team actively maintains the base system, improving the quality of the implementation and porting it to the latest architectures and systems.
Some Close Relatives

In addition to these mainstream versions of Caml, one should mention many related compilers. Michel Mauny and Daniel de Rauglaudre designed Chamau, which offers unique syntax manipulation facilities which are now offered in the Camlp4 pre-processor for OCaml. Manuel Serrano and Pierre Weis created BIGLOO. Régis Cridlig made Camlot. Jean Goubault-Larrecq wrote HimML, which features implicit hash-consing and efficient operations on sets and maps. Emmanuel Chailloux published CeML. In the Para team, Francis Dupont implemented Caml for parallel machines, while Luc Maranget built Gaml, a compiler for a lazy functional programming language.
Final Quote

In 1996, Guy Cousineau wrote: “Certainly, the history of Caml could have been more linear. However, through trial and error, a capacity for producing high performance, portable, and flexible functional programming language implementations has emerged in France.”
|}
