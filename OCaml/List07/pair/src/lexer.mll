{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let number = '-'? digit+
let char = ['a'-'z' 'A'-'Z' '_']
let ident = char(char|digit)*

rule read =
    parse
    | white { read lexbuf }
    | "*" { TIMES }
    | "+" { PLUS }
    | "-" { MINUS }
    | "/" { DIV }
    | "&&" { AND }
    | "||" { OR }
    | "=" { EQ }
    | "<=" { LEQ }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | "->" { ARR }
    | "if" { IF }
    | "then" { THEN }
    | "let" { LET }
    | "in" { IN }
    | "else" { ELSE }
    | "true" { BOOL true }
    | "false" { BOOL false }
    | "," { COMMA }
    | "()" { UNIT }
    | "fst" { FST }
    | "snd" { SND }
    | "number?" { NUMBERP } 
    | "boolean?" { BOOLEANP } 
    | "pair?" { PAIRP } 
    | "unit?" { UNITP }
    | "match" { MATCH }
    | "with" { WITH }
    | "[" { LBRACK } 
    | "]" { RBRACK } 
    | ";" { SEMI } 
    | "fold" { FOLD } 
    | "and" { ANDKW } 
    | number { INT ( int_of_string (Lexing.lexeme lexbuf)) }
    | ident { IDENT (Lexing.lexeme lexbuf) }
    | eof { EOF }
