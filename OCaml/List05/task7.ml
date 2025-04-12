(* Zadanie 7 / Lista 5 *)
type 'a symbol =
| T of string
| N of 'a

type 'a grammar = ('a * ('a symbol list ) list ) list

let rec generate (grammar : 'a grammar) (nonterm : 'a) : string =
  let productions = List.assoc nonterm grammar in
  let prod_idx = Random.int (List.length productions) in
  let production = List.nth productions prod_idx 
    in let rec process_symbol = function
      | T s -> s (* Symbol terminalny - zwracamy jego wartość *)
      | N nt -> generate grammar nt (* Symbol nieterminalny - rekurencyjnie generujemy *)
  in let strings = List.map process_symbol production in String.concat "" strings;;


let pol : string grammar =
  [ "zdanie", [[ N "grupa - podmiotu "; N "grupa - orzeczenia "]]
  ; "grupa - podmiotu ", [[ N " przydawka "; N " podmiot "]]
  ; "grupa - orzeczenia ", [[ N " orzeczenie "; N " dopelnienie "]]; " przydawka ", [[ T " Piekny "];
  [ T " Bogaty "];
  [ T " Wesoly "]]
  ; " podmiot ", [[ T " policjant "];
  [ T " student "];
  [ T " piekarz "]]
  ; " orzeczenie ", [[ T " zjadl "];
  [ T " pokochal "];
  [ T " zobaczyl "]]
  ; " dopelnienie ", [[ T " zupe ."];
  [ T " sam siebie ."];
  [ T " instytut informatyki ."]]
  ];;
    
  
generate pol "zdanie";;