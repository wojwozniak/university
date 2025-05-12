let fix = fun f -> (fun x -> fun y -> f (x x) y) (fun x -> fun y -> f (x x) y) in
let FIB = fun f -> fun x -> if x <= 1 then x else f (x - 1) + f (x - 2) in
let fib = fix FIB in
fib 35
