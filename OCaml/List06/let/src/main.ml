open Ast

let parse (s : string) : expr =
  Parser.main Lexer.read (Lexing.from_string s)

type value =
  | VInt of int
  | VBool of bool
  | VUnit

let eval_op (op : bop) (val1 : value) (val2 : value) : value =
  match op, val1, val2 with
  | Add,  VInt  v1, VInt  v2 -> VInt  (v1 + v2)
  | Sub,  VInt  v1, VInt  v2 -> VInt  (v1 - v2)
  | Mult, VInt  v1, VInt  v2 -> VInt  (v1 * v2)
  | Div,  VInt  v1, VInt  v2 -> VInt  (v1 / v2)
  | And,  VBool v1, VBool v2 -> VBool (v1 && v2)
  | Or,   VBool v1, VBool v2 -> VBool (v1 || v2)
  | Leq,  VInt  v1, VInt  v2 -> VBool (v1 <= v2)
  | Eq,   VUnit,    VUnit    -> VBool true
  | Eq,   _,        _        -> VBool (val1 = val2)
  | _,    _,        _        -> failwith "type error"

let rec subst (x : ident) (s : expr) (e : expr) : expr =
  match e with
  | Binop (op, e1, e2) -> Binop (op, subst x s e1, subst x s e2)
  | If (b, t, e) -> If (subst x s b, subst x s t, subst x s e)
  | Var y -> if x = y then s else e
  | Let (y, e1, e2) ->
      Let (y, subst x s e1, if x = y then e2 else subst x s e2)
  | _ -> e

let reify (v : value) : expr =
  match v with
  | VInt a -> Int a
  | VBool b -> Bool b
  | VUnit -> Unit

let rec eval (e : expr) : value =
  match e with
  | Int i -> VInt i
  | Bool b -> VBool b
  | Unit -> VUnit
  | Binop (op, e1, e2) ->
      eval_op op (eval e1) (eval e2)
  | If (b, t, e) ->
      (match eval b with
           | VBool true -> eval t
           | VBool false -> eval e
           | _ -> failwith "type error")
  | Let (x, e1, e2) ->
      eval (subst x (reify (eval e1)) e2)
  | Var x -> failwith ("unknown var " ^ x)

let interp (s : string) : value =
  eval (parse s)


(* 
  Zadanie 1 
  Funkcja closed sprawdzająca czy nie ma w wyrażeniu zmiennych wolnych 
*)
let closed (e : expr) : bool =
  (* Wewnątrz robimy funkcję rekurencyjną z listą etykiet *)
  (* Nie ma żadnego "popowania" 
    -> tylko wrzucamy na stos etykiety dla odpowiednich podwyrażeń *)
  let rec closed_with_env (env : string list) (e : expr) : bool =
    match e with
    | Int _ -> true
    | Bool _ -> true
    | Unit -> true
    | Var x -> List.mem x env (* Dotrzemy do zmiennej - sprawdzamy czy była zdefiniowana *)
    | Binop (_, e1, e2) -> closed_with_env env e1 && closed_with_env env e2
    | If (cond, e1, e2) ->
        closed_with_env env cond && closed_with_env env e1 && closed_with_env env e2
    | Let (x, e1, e2) ->
        closed_with_env env e1 && closed_with_env (x :: env) e2 (* Definiujemy - wrzucamy na stos *)
  in
  closed_with_env [] e

let c (str:string) = closed (parse str)