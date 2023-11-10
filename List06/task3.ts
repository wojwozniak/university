// Metoda forEach - wykonuje podaną funkcję dla każdego elementu tablicy
// Przyjmujemy tablicę typu T oraz funkcję przyjmującą element typu T i zwracającą void
function forEach<T>(tablica: T[], funkcja: (element: T) => void): void {
    for (let i = 0; i < tablica.length; i++) {
        funkcja(tablica[i]);
    }
}

// Metoda map - tworzy nową tablicę zawierającą wyniki działania podanej funkcji na każdym elemencie
// Przyjmujemy tablicę typu T oraz funkcję przyjmującą element typu T i zwracającą element typu R
function map<T, R>(tablica: T[], funkcja: (element: T) => R): R[] {
    const nowaTablica: R[] = [];
    for (let i = 0; i < tablica.length; i++) {
        nowaTablica.push(funkcja(tablica[i]));
    }
    return nowaTablica;
}

// Metoda filter - tworzy nową tablicę zawierającą elementy spełniające warunek zdefiniowany w funkcji
// Przyjmujemy tablicę typu T oraz funkcję przyjmującą element typu T i zwracającą boolean
function filter<T>(tablica: T[], funkcja: (element: T) => boolean): T[] {
    const nowaTablica: T[] = [];
    for (let i = 0; i < tablica.length; i++) {
        if (funkcja(tablica[i])) {
            nowaTablica.push(tablica[i]);
        }
    }
    return nowaTablica;
}

const d = [1, 2, 3, 4];

// Wywołanie metody forEach
forEach(d, _ => { console.log(_); });
// [1,2,3,4]

// Wywołanie metody filter
var wynikFilter = filter(d, _ => _ < 3);
console.log(wynikFilter);
// [1,2]

// Wywołanie metody map
var wynikMap = map(d, _ => _ * 2);
console.log(wynikMap);
// [2,4,6,8]