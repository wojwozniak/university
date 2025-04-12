open Ast


(* Zadanie 5 - wszystkie int na float i operatory floatowe *)
let parse (s : string) : expr =
    Parser.main Lexer.read (Lexing.from_string s)

let eval_bop (op : bop) (v1 : float) (v2 : float) : float =
    match op with
    | Add -> v1 +. v2
    | Sub -> v1 -. v2
    | Mult -> v1 *. v2
    | Div -> v1 /. v2
    | Pow -> v1 ** v2

let eval_uop (op: uop) (v1: float) : float =
    match op with
        | Log -> log v1

let rec eval (e : expr) : float =
    match e with
    | Float f -> f
    | Unop (op, e1) -> eval_uop op (eval e1)
    | Binop (op, e1, e2) -> eval_bop op (eval e1) (eval e2)

let interp (s : string) : float =
    eval (parse s)

