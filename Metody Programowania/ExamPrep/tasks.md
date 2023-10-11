# Zadania na indukcję:
1.  (append (map f xs) (map f ys)) = (map f (append xs ys))
2. (length (append xs ys)) = (+ (length xs) (length ys))
3. (filter p (map f xs)) = (map f (filter (lambda (x) (p (f x))) xs))
niech ns będzie lista liczb całkowitych.
4. (foldr + 0 ns) = (foldl + 0 ns) 
# Zadanie z foldem
1. funkcja zip :: [a] -> [b] -> [(a,b)] czyli z dwoch list produkujemy jedna (o dlugosci rownej dlugosci krotszej z list) zlozona z par elementow na odpawiadajacych sobie pozycjach zip([1,2,3], [a, b]) = [(1,a), (2,b)] 
2. funkcja uzip :: [(a,b)] -> ([a], [b]) czyli operacja przeciwna do operacji zip
3. even_pos :: [a] -> [a] ktora zwraca liste z elementami znajdujacymi sie na parzystych pozycjach even_pos([a,b,c,d,e]) = [b,d]
# Zadania z parametrami
1. (parametric->/ c [a b] (-> (-> a b) a b)) 
2. (parametric->/ c [a b c] (-> (-> a b c) (-> ( cons/c a b) c)))
3. (parametric->/ c [a b] (-> ( listof (-> a b)) ( listof a) ( listof b)))
4. (parametric->/ c [a b] (-> (-> b ( or/c false/c ( cons/c a b))) b ( listof a)))
5. (parametric->/ c [a] (-> (-> a boolean?) ( listof a) ( cons/c ( listof a) ( listof a))))
6. (parametric->/c [a b] (-> (-> a b) (listof a) (-> b (listof a)))) 

# Foldr i foldl
1. Zaimplementuj funkcję foldr przy pomocy foldl
2. Zaimplementuj funkcję foldl przy pomocy foldr


✅