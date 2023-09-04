### Kod parsera który może się pojawić

1) shorthand pod elementy listy dalsze niż czwarty <br>
listy w Rackecie są 0-indexed
```scheme
(define (fifth [xs : (Listof 'a)]) : 'a (list-ref xs 4))
(define (sixth [xs : (Listof 'a)]) : 'a (list-ref xs 5))
```


