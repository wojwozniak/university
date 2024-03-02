let sum_square_two_bigger x y z =
  let a = max x (max y z) in
  let b = if (a = x) then max y z else if (a = y) then max x z else max x y in
  (a * a) + (b * b)


let test = sum_square_two_bigger 1 2 3 = 13
let test2 = sum_square_two_bigger 2 3 1 = 13

