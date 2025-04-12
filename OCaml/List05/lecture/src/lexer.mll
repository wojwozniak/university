{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let number = '-'? digit+ '.' digit* | '-'? digit+ (* Zadanie 5 - Liczby z kropką lub bez *)

rule read =
    parse
    | white { read lexbuf }
    | "log" { LOG }
    | "**" { POW }
    | "*" { TIMES }
    | "+" { PLUS }
    | "-" { MINUS }
    | "/" { DIV }
    | "e" { E }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | number { FLOAT ( float_of_string (Lexing.lexeme lexbuf)) } (* Zadanie 5 - Int -> Float *)
    | eof { EOF }
