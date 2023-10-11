# Task 2 - proof that append always return value

Definition of append from lecture

``` scheme
(define (append xs ys)
    (if (empty? xs)
        ys
        (cons (first xs) (append (rest xs) ys))
    )
)
```

We need to prove that (append xs ys) always return some value (a list).

We have 4 base cases:

1) Both lists are empty:
First if evaluates to true, so we return ys (empty list)

2) First list is empty, second has content:
First if evaluates to true, so we return ys (non-empty list)

3) First list has content, second is empty.
First if evaluates to false, so we return 
(cons (first xs) (append (rest xs) ys)) - a list containing first element of xs and the result of appending rest of xs and ys.
Those calls will happen n times, where n is the length of xs. Then if will evaluate to true and function will return ys (empty list).
Finally we will return list containing all elements of xs.

4) Both lists have content.
It will go similar to the previous case. First difference will appear on last if check - it will also evaluate to false (but ys is not empty) - finally we will return list containing all elements of xs and ys.

(Proofs of 3 and 4 should be done using induction - it is easily adaptible from the proof above - we just start with empty list, then single element, then n+1 elements.)