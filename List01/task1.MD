# Zadanie 1
a) 10   
Wynik: 10 - brak operacji, po prostu wartość liczbowa 10    
b) (+ 5 3 4)    
Wynik: 12 - wywołanie funkcji dodawania z arg. 5, 3, 4  
c) (- 9 1)  
Wynik: 8 - -,,- 
d) (/ 6 2)  
Wynik: 3 - -,,-     
e) (+ (* 2 4) (- 4 6) )  
Wynik: 6 - napierw wykonane zostaną operacje w wewnętrznych nawiasach, które zwrócą 8,-2, potem -,,-        
f) ( define a 3)    
Wynik: brak - powstanie zmienna a=3, interpreter nic nie wypisze    
g) ( define b (+ a 1) )     
Wynik: brak - b=4, -,,-     
h) (+ a b (* a b ) )        
Wynik: 3*4+3+4 = 19     
i) (= a b )     
Wynik: #f - 3!=4        
j) (if ( and ( > b a ) (< b (* a b ) ) )        
b               
a )             
Wynik: 4 - if sprawdza dwa warunki - są prawdziwe więc zwraca b          
k) ( cond [(= a 4) 6]       
[(= b 4) (+ 6 7 a ) ]       
[ else 25])     
Wynik: 16 - cond to if, else if... - pierwszy warunek zwróci fałsz, trugi prawdę, wynik 6+7+3 = 16      
m) (+ 2 (if ( > b a ) b a ) )       
Wynik: 6 - if zwraca prawdę - zwracamy b (4) i dodajemy 2       
n) (* ( cond [( > a b ) a ]     
[(< a b ) b ]       
[ else -1])     
(+ a 1) )       
Wynik: 16 - cond zwróci b, następnie mnożymy 4*(a+1)        