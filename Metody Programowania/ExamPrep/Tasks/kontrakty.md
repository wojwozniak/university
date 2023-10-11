1. (parametric->/ c [a b] (-> (-> a b) a b)) 
- P N N P

2. (parametric->/ c [a b c] (-> (-> a b c) (-> ( cons/c a b) c) ))
- P P N P N P (???)

3. (parametric->/ c [a b] (-> ( listof (-> a b)) ( listof a) ( listof b) ) )
- P N N P

4. (parametric->/ c [a b] (-> (-> b ( or/c false/c ( cons/c a b)) ) b ( listof a)) )
- P N N N P   (?)

5. (parametric->/ c [a] (-> (-> a boolean?) ( listof a)  (cons/c ( listof a) ( listof a)) ) )
- P N N P P

6. (parametric->/c [a b] (-> (-> a b) (listof a) (-> b (listof a)) ) ) 
- P N N N P