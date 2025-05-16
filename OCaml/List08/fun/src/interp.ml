open Ast

let parse (s : string) : expr =
  Parser.main Lexer.read (Lexing.from_string s)

module M = Map.Make(String)

type env = value M.t

and value =
  | VInt of int
  | VBool of bool
  | VUnit
  | VPair of value * value
  | VClosure of ident * expr * env
  | VRecClosure of ident * ident * expr * env

let rec show_value v =
  match v with
  | VInt n -> string_of_int n
  | VBool v -> string_of_bool v
  | VUnit -> "()"
  | VPair (v1,v2) -> "(" ^ show_value v1 ^ ", " ^ show_value v2 ^ ")"
  | VClosure _ 
  | VRecClosure _ -> "<fun>"

  let eval_op (op : bop) (val1 : value) (val2 : value) : value =
  match op, val1, val2 with
  | Add,  VInt  v1, VInt  v2 -> VInt  (v1 + v2)
  | Sub,  VInt  v1, VInt  v2 -> VInt  (v1 - v2)
  | Mult, VInt  v1, VInt  v2 -> VInt  (v1 * v2)
  | Div,  VInt  v1, VInt  v2 -> VInt  (v1 / v2)
  | And,  VBool v1, VBool v2 -> VBool (v1 && v2)
  | Or,   VBool v1, VBool v2 -> VBool (v1 || v2)
  | Leq,  VInt  v1, VInt  v2 -> VBool (v1 <= v2)
  | Lt,   VInt  v1, VInt  v2 -> VBool (v1 < v2)
  | Gt,   VInt  v1, VInt  v2 -> VBool (v1 > v2)
  | Geq,  VInt  v1, VInt  v2 -> VBool (v1 >= v2)
  | Neq,  _,        _        -> VBool (val1 <> val2)
  | Eq,   _,        _        -> VBool (val1 = val2)
  | _,    _,        _        -> failwith "type error"


let rec eval_env (env : env) (e : expr) : value =
  match e with
  | Int i -> VInt i
  | Bool b -> VBool b
  | Binop (op, e1, e2) ->
      eval_op op (eval_env env e1) (eval_env env e2)
  | If (b, t, e) ->
      (match eval_env env b with
        | VBool true -> eval_env env t
        | VBool false -> eval_env env e
        | _ -> failwith "type error")
  | Var x ->
     (match M.find_opt x env with
       | Some v -> v
       | None -> failwith "unknown var")
  | Let (x, e1, e2) ->
      eval_env (M.add x (eval_env env e1) env) e2
  | Pair (e1, e2) -> VPair (eval_env env e1, eval_env env e2)
  | Unit -> VUnit
  | Fst e ->
      (match eval_env env e with
        | VPair (v1, _) -> v1
        | _ -> failwith "Type error")
  | Snd e ->
      (match eval_env env e with
        | VPair (_, v2) -> v2
        | _ -> failwith "Type error")
  | Match (_e1, _x, _y, _e2) ->
      failwith "Not implemented"
  | IsPair e ->
      (match eval_env env e with
        | VPair _ -> VBool true
        | _ -> VBool false)
  | Fun (x, e) -> VClosure (x, e, env)
  | Funrec (f, x, e) -> VRecClosure (f, x, e, env)
  | App (e1, e2) ->
      let v1 = eval_env env e1 in
      let v2 = eval_env env e2 in
      (match v1 with
        | VClosure (x, body, clo_env) ->
            eval_env (M.add x v2 clo_env) body
        | VRecClosure (f, x, body, clo_env) as c ->
            eval_env (clo_env |> M.add x v2 |> M.add f c) body
        | _ -> failwith "not a function")

let eval = eval_env M.empty

let interp (s : string) : value =
  eval (parse s)

(* Constant propagation environment: maps identifiers to simplified expressions *) 
type cp_env = expr M.t


(* Zadanie 1 - pomocnicza *)
 let eval_bop (op : bop) (e1 : expr) (e2 : expr) : expr option = 
  match op, e1, e2 with 
  | Add, Int n1, Int n2 -> Some (Int (n1 + n2)) 
  | Sub, Int n1, Int n2 -> Some (Int (n1 - n2)) 
  | Mult, Int n1, Int n2 -> Some (Int (n1 * n2)) 
  | Div, Int n1, Int n2 when n2 <> 0 -> Some (Int (n1 / n2)) 
  | And, Bool b1, Bool b2 -> Some (Bool (b1 && b2)) 
  | Or, Bool b1, Bool b2 -> Some (Bool (b1 || b2)) 
  | Eq, Int n1, Int n2 -> Some (Bool (n1 = n2)) 
  | Neq, Int n1, Int n2 -> Some (Bool (n1 <> n2)) 
  | Leq, Int n1, Int n2 -> Some (Bool (n1 <= n2)) 
  | Lt, Int n1, Int n2 -> Some (Bool (n1 < n2))
  | Gt, Int n1, Int n2 -> Some (Bool (n1 > n2)) 
  | Geq, Int n1, Int n2 -> Some (Bool (n1 >= n2)) 
  | _ -> None

(* Zad 1 - main *) 
let rec cp_env (env : cp_env) (e : expr) : expr = 
  match e with 
  | Int _ 
  | Bool _ 
  | Unit -> e 
  | Var x -> 
    (match M.find_opt x env with 
    | Some e' -> e' 
    | None -> Var x
    ) 
  | Binop (op, e1, e2) -> 
    let e1' = cp_env env e1 in 
      let e2' = cp_env env e2 in 
        (match eval_bop op e1' e2' with 
        | Some e' -> e' 
        | None -> Binop (op, e1', e2')
        ) 
  | If (cond, t, f) -> 
    let cond' = cp_env env cond in 
      (match cond' with 
      | Bool true -> cp_env env t 
      | Bool false -> cp_env env f 
      | _ -> If (cond', cp_env env t, cp_env env f)
      )
  | Let (x, e1, e2) -> 
    let e1' = cp_env env e1 in 
      (match e1' with 
      | Int _ 
      | Bool _ -> cp_env (M.add x e1' env) e2 
      | _ -> let env' = M.add x (Var x) env in Let (x, e1', cp_env env' e2)
      ) 
  | Pair (e1, e2) -> Pair (cp_env env e1, cp_env env e2) 
  | Fst e -> let e' = cp_env env e in 
    (match e' with 
    | Pair (e1, _) -> e1 
    | _ -> Fst e'
    ) 
  | Snd e -> let e' = cp_env env e in 
    (match e' with 
    | Pair (_, e2) -> e2 
    | _ -> Snd e'
    ) 
  | IsPair e -> let e' = cp_env env e in 
    (match e' with 
    | Pair _ -> Bool true 
    | Int _ 
    | Bool _ 
    | Unit 
    | Var _ -> Bool false 
    | _ -> IsPair e'
    ) 
  | Fun (x, body) -> Fun (x, cp_env env body) 
  | Funrec (f, x, body) -> Funrec (f, x, cp_env env body) 
  | App (e1, e2) -> App (cp_env env e1, cp_env env e2) 
  | Match (e1, x, y, e2) -> Match (cp_env env e1, x, y, cp_env env e2)

let cp (e : expr) : expr = cp_env M.empty e