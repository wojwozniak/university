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
  | If    of expr * expr * expr
  | Let   of ident * expr * expr
  | Var   of ident
  | For   of ident * expr * expr * expr (* zad.2 -  ident, target, step, body *)
  | Integral of expr * expr * expr * ident (* zad.2 - from, to, body, by_which *)