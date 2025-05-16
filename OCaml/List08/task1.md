# Zadanie 1 / Lista 8

Najpierw powtórzenie składni by rozumieć to lepiej.


### Wyrażenia z in :((
Wyrażenie

```ml
let e1' = ...1 in
  let e2' = ...2 in
    <expression>
```

buduje scope wyrażenia dla expression. Można powiedzieć, że kompilator:
- Oblicza ...1, zapisuje jako e1'
- Oblicza ...2, zapisuje jako e2' (mogąc korzystać z e1')
- Przechodzi do expression mając do użytku e1' i e2'


a więc, zwerbalizujmy co robi poniższe wyrażenie, część funkcji `cp_env`:

```ml
| Binop (op, e1, e2) -> 
    let e1' = cp_env env e1 in 
      let e2' = cp_env env e2 in 
        (match eval_bop op e1' e2' with 
        | Some e' -> e' 
        | None -> Binop (op, e1', e2')
        ) 
```

- Najpierw matchujemy nasze wyrażenie - case Binopa
- Obliczamy e1', przekazujemy niżej
- Obliczamy e2', przekazujemy razem z e1' niżej
- Matchujemy eval_bop op e1' e2'
- Mamy opcje Some lub None - w związku z naszą niecodzienną pomocniczą


## Rozwiązanie


```ml
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
```