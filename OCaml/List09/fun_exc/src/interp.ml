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
  | VClosure _ | VRecClosure _ -> "<fun>"

type 'a comp = 'a option

let return (v : 'a) : 'a comp =
  Some v

let bind (c : 'a comp) (f : 'a -> 'b comp) : 'b comp =
  match c with
  | Some v -> f v
  | None -> None

let (let* ) = bind

let int_op op v1 v2 =
  match v1, v2 with
  | VInt x, VInt y -> Some (VInt (op x y))
  | _ -> failwith "type error"

let cmp_op op v1 v2 =
  match v1, v2 with
  | VInt x, VInt y -> Some (VBool (op x y))
  | _ -> failwith "type error"

let bool_op op v1 v2 =
  match v1, v2 with
  | VBool x, VBool y -> Some (VBool (op x y))
  | _ -> failwith "type error"

let eval_op (op : bop) : value -> value -> value comp =
  match op with
  | Add  -> int_op ( + )
  | Sub  -> int_op ( - )
  | Mult -> int_op ( * )
  | Div  -> int_op ( / )
  | And  -> bool_op ( && )
  | Or   -> bool_op ( || )
  | Eq   -> fun v1 v2 -> Some (VBool (v1 = v2))
  | Neq  -> fun v1 v2 -> Some (VBool (v1 <> v2))
  | Leq  -> cmp_op ( <= )
  | Lt   -> cmp_op ( < )
  | Geq  -> cmp_op ( >= )
  | Gt   -> cmp_op ( > )

let rec eval_env (env : env) (e : expr) : value comp =
  match e with
  | Int i -> return (VInt i)
  | Bool b -> return (VBool b)
  | Binop (op, e1, e2) ->
      bind (eval_env env e1) (fun v1 -> (* let* v1 = eval_env env e1 in *)
      bind (eval_env env e2) (fun v2 ->
      eval_op op v1 v2))
  | If (b, t, e) ->
      let* v = eval_env env b in
      (match v with
      | VBool true -> eval_env env t
      | VBool false -> eval_env env e
      | _ -> failwith "type error")
  | Var x ->
      let v =
        match M.find_opt x env with
        | Some v -> v
        | None -> failwith "unknown var"
      in
      return v
  | Let (x, e1, e2) ->
      let* v1 = eval_env env e1 in
      eval_env (env |> M.add x v1) e2
  | Pair (e1, e2) ->
      let* v1 = eval_env env e1 in
      let* v2 = eval_env env e2 in
      return (VPair (v1, v2))
  | Unit -> return VUnit
  | Fst e ->
      let* v = eval_env env e in
      (match v with
        | VPair (v1, _) -> return v1
        | _ -> failwith "Type error")
  | Snd e ->
      let* v = eval_env env e in
      (match v with
      | VPair (_, v2) -> return v2
      | _ -> failwith "Type error")
  | Match (e1, x, y, e2) ->
      let* v1 = eval_env env e1 in
      (match v1 with
      | VPair (v1, v2) ->
        eval_env (env |> M.add x v1 |> M.add y v2) e2
      | _ -> failwith "Type error")
  | IsPair e ->
      let* v = eval_env env e in
      let v =
        match v with
        | VPair _ -> VBool true
        | _ -> VBool false
      in
      return v
  | Fun (x, e) -> return (VClosure (x, e, env))
  | Funrec (f, x, e) -> return (VRecClosure (f, x, e, env))
  | App (e1, e2) ->
      let* v1 = eval_env env e1 in
      let* v2 = eval_env env e2 in
      (match v1 with
        | VClosure (x, body, clo_env) ->
            eval_env (M.add x v2 clo_env) body
        | VRecClosure (f, x, body, clo_env) as c ->
            eval_env (clo_env |> M.add x v2 |> M.add f c) body
        | _ -> failwith "not a function")
  | Throw -> None
  | Try (e1, e2) ->
      (match eval_env env e1 with
        | Some v1 -> Some v1
        | None -> eval_env env e2)

let eval e = eval_env M.empty e

let interp (s : string) : value =
  match eval (parse s) with
  | Some v -> v
  | None -> failwith "unhandled exception"
