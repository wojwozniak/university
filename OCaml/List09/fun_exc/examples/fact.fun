let for =
  funrec for a -> fun b -> fun f ->
    if a > b then ()
	else (let x = f a in for (a+1) b f)
in

let fact = fun n ->
  let x = ref 1 in
  let y = for 1 n (fun i -> x := !x * i) in
  !x
in

fact 5
