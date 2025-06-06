type bop =
  (* arithmetic *)
  | Add | Sub | Mult | Div
  (* comparison *)
  | Eq | Leq

type ident = string

type expr = 
  | Int   of int
  | Binop of bop * expr * expr
  | Bool  of bool
  | If    of expr * expr * expr
  | Let   of ident * expr * expr
  | Var   of ident
  | Unit
  | Pair  of expr * expr
  | Fst   of expr
  | Snd   of expr
  | Match of expr * ident * ident * expr
  | NumberP of expr 
  | BooleanP of expr 
  | PairP of expr 
  | UnitP of expr
  | Fold of expr * ident * ident * expr * expr (* Zad 4 *)