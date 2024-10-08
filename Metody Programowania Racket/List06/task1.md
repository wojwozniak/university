# Task 1

```scheme
(map f (map g xs)) === (map (lambda (x) (f (g x))) xs)
```


Let's try to prove this. 

(Proof should be done using induction - it is easily adaptible from the proof below - we just start with empty list, then single element, then n+1 elements.)

We'll start by taking the left-hand side of the equation.

```scheme
(map f (map g xs))
```
 this expression applies function g to all elements of the list xs and returns that list (let's call it xsg).

```scheme
(map f xsg)
```

this expression applies function f to all elements of the list xsg and returns that list (let's call it xsgf).

Now let's take the right-hand side of the equation.

```scheme
(map (lambda (x) (f (g x))) xs)
```
This expression applies the lambda function to all elements of the list xs and returns that list (let's call it xsgf).


Both sides apply first function g, then function f to each element of the list xs. So, they return the same list.


So, the equation is true.