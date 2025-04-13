type bop =
  (* arithmetic *)
  | Add | Sub | Mult | Div
  (* logic *)
  | And | Or
  (* comparison *)
  | Eq | Leq

type ident = string

type expr = 
  | Int   of int
  | Binop of bop * expr * expr
  | Bool  of bool
  | Unit
  | If    of expr * expr * expr
  | Let   of ident * expr * expr
  | Var   of ident
  | Pair  of expr * expr
  | Match of expr * ident * ident * expr (* match p with (x, y) -> e *)