// Metoda forEach - wykonuje podaną funkcję dla każdego elementu tablicy
function forEach(tablica, funkcja) {
    for (let i = 0; i < tablica.length; i++) {
        funkcja(tablica[i]);
    }
}

// Metoda map - tworzy nową tablicę zawierającą wyniki działania podanej funkcji na każdym elemencie
function map(tablica, funkcja) {
    const nowaTablica = [];
    for (let i = 0; i < tablica.length; i++) {
        nowaTablica.push(funkcja(tablica[i]));
    }
    return nowaTablica;
}

// Metoda filter - tworzy nową tablicę zawierającą elementy spełniające warunek zdefiniowany w funkcji
function filter(tablica, funkcja) {
    const nowaTablica = [];
    for (let i = 0; i < tablica.length; i++) {
        if (funkcja(tablica[i])) {
            nowaTablica.push(tablica[i]);
        }
    }
    return nowaTablica;
}

var a = [1, 2, 3, 4];

// Wywołanie metody forEach
forEach(a, _ => { console.log(_); });
// [1,2,3,4]

// Wywołanie metody filter
var wynikFilter = filter(a, _ => _ < 3);
console.log(wynikFilter);
// [1,2]

// Wywołanie metody map
var wynikMap = map(a, _ => _ * 2);
console.log(wynikMap);
// [2,4,6,8]