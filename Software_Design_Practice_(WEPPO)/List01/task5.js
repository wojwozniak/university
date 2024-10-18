/** Zadanie 5
 * Napisać iteracyjną i rekurencyjną wersję algorytmu wyznaczającego n-tą liczbę Fibbonacciego. Napisać kod który zmierzy czasy wykonania obu wersji i wypisze na konsoli w postaci tabeli dla nod 10 do ...? (no właśnie, do jakiej wielkości nobliczenie czasu jeszcze ma sens dla algorytmu rekurencyjnego?). Pomiary powtórzyć w środowisku node.js, w przeglądarce Chrome oraz w jeszcze jednej, wybranej przez siebie dowolnej przeglądarce. Czy występują jakieś istotne różnice w po- miarach? Uwaga. Do mierzenia czasu wykorzystać metody console.time i console.timeEnd.
 */


/**
 * Funkcja wyznaczająca rekurencyjnie liczby Fibbonaciego
 * @param {number} n - liczba Fibbonaciego do wyznaczenia
 * @returns {number} - n-ta liczba Fibbonaciego 
 */
const fiboRec = (n) => {
    if (n < 2) return n;
    return fiboRec(n - 1) + fiboRec(n - 2);
}

/**
 * Funkcja wyznaczająca iteracyjnie liczby Fibbonaciego
 * @param {number} n - liczba Fibbonaciego do wyznaczenia
 * @returns {number} - n-ta liczba Fibbonaciego 
 */
const fiboIter = (n) => {
    if (n < 2) return n;
    let a = 0, b = 1, c;
    for (let i = 2; i <= n; i++) {
        c = a + b;
        a = b;
        b = c;
    }
    return c;
}


// W przypadku 40-41 już fajnie widać różnicę a jeszcze nie trwa to niesamowicie długo. Brak znaczącej różnicy w czasie wykonania w przeglądarce i node.js
const run = () => {
    console.time('fiboRec n = 41');
    console.log(fiboRec(41));
    console.timeEnd('fiboRec n = 41');

    console.time('fiboIter n = 41');
    console.log(fiboIter(41));
    console.timeEnd('fiboIter n = 41');
}

run();

const outputTable = (n) => {
    if (n < 10) return;
    for (let i = 0; i <= n; i++) {
        console.time(`fiboRec n = ${i}`);
        fiboRec(i);
        console.timeEnd(`fiboRec n = ${i}`);

        console.time(`fiboIter n = ${i}`);
        fiboIter(i)
        console.timeEnd(`fiboIter n = ${i}`);
    }
}

outputTable(30);