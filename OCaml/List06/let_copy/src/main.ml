open Ast

let parse (s : string) : expr =
  Parser.main Lexer.read (Lexing.from_string s)

type value =
  | VInt of int
  | VBool of bool
  | VUnit
  | VPair of value * value

let rec eval_op (op : bop) (val1 : value) (val2 : value) : value =
  match op, val1, val2 with
  | Add,  VInt  v1, VInt  v2 -> VInt  (v1 + v2)
  | Sub,  VInt  v1, VInt  v2 -> VInt  (v1 - v2)
  | Mult, VInt  v1, VInt  v2 -> VInt  (v1 * v2)
  | Div,  VInt  v1, VInt  v2 -> VInt  (v1 / v2)
  | And,  VBool v1, VBool v2 -> VBool (v1 && v2)
  | Or,   VBool v1, VBool v2 -> VBool (v1 || v2)
  | Leq,  VInt  v1, VInt  v2 -> VBool (v1 <= v2)
  | Eq,   VUnit,    VUnit    -> VBool true
  | Eq,   VPair (a1, b1), VPair (a2, b2) -> 
    VBool (eval_op Eq a1 a2 = VBool true && eval_op Eq b1 b2 = VBool true)
  | Eq,   _,        _        -> VBool (val1 = val2)
  | _,    _,        _        -> failwith "type error"

let rec subst (x : ident) (s : expr) (e : expr) : expr =
  match e with
  | Binop (op, e1, e2) -> Binop (op, subst x s e1, subst x s e2)
  | If (b, t, e) -> If (subst x s b, subst x s t, subst x s e)
  | Var y -> if x = y then s else e
  | Let (y, e1, e2) ->
      Let (y, subst x s e1, if x = y then e2 else subst x s e2)
  | Pair (e1, e2) -> Pair (subst x s e1, subst x s e2)
  | Match (p, x', y', e') ->
      Match (subst x s p, x', y',
            if x = x' || x = y' then e' else subst x s e')
  | _ -> e

let rec reify (v : value) : expr =
  match v with
  | VInt a -> Int a
  | VBool b -> Bool b
  | VUnit -> Unit
  | VPair (v1, v2) -> Pair (reify v1, reify v2)

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
  | Pair (fst, snd) -> VPair (eval fst, eval snd)
  | Var x -> failwith ("unknown var " ^ x)
  | Match (p, x, y, e) ->
    (match eval p with
     | VPair (v1, v2) ->
         let e' = subst y (reify v2) (subst x (reify v1) e) in
         eval e'
     | _ -> failwith "type error")

let interp (s : string) : value =
  eval (parse s)