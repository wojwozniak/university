type bop = Add | Sub | Mult | Div

type expr = 
    | Float of float (* Zadanie 5 - Int of int -> Float of float *)
    | Binop of bop * expr * expr
