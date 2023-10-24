// Funkcja z wykładu
function getLastProto(o) { 
    var p = o; 
    do { 
        o = p; 
        p = Object.getPrototypeOf(o);
    } while (p); 
 
    return o; 
}

// Test 1
var obiekt1 = { a: 1 };
var wynik1 = getLastProto(obiekt1);
console.log(wynik1); // Wynik: Object

// Test 2
var obiekt2 = [1, 2, 3];
var wynik2 = getLastProto(obiekt2);
console.log(wynik2); // Wynik: Array

// Test 3
var b = {
    x: 10,
    y: 20
};

var p = Object.create(b);
p.z = 30;

var wynik = getLastProto(p);
console.log(wynik); // Wynik: b