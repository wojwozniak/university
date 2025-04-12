type bop = Add | Sub | Mult | Div | Pow
type uop = Log

type expr = 
    | Float of float (* Zadanie 5 - Int of int -> Float of float *)
    | Unop of uop * expr
    | Binop of bop * expr * expr
