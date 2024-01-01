/**
 * Funkcja wyznaczająca rekurencyjnie liczby Fibbonaciego
 * @param {number} n - liczba Fibbonaciego do wyznaczenia
 * @returns {number} - n-ta liczba Fibbonaciego 
 */
const fibOld = (n) => {
    if (n < 2) return n;
    return fibOld(n - 1) + fibOld(n - 2);
}

/**
 * Funkcja wyznaczająca rekurencyjnie liczby Fibbonaciego ale z memoizacją
 * @param {number} n - liczba Fibbonaciego do wyznaczenia
 * @param {object} n - obiekt przechowujący wywołania rekursyjne
 * @returns {number} - n-ta liczba Fibbonaciego 
 */
const fib = (n, memo = {}) => {
    if (n in memo) return memo[n];
    if (n <= 2) return n;
    memo[n] = fib(n-1, memo) + fib(n - 2, memo);
    return memo[n];
}

// W przypadku 40-41 już fajnie widać różnicę a jeszcze nie trwa to niesamowicie długo. Brak znaczącej różnicy w czasie wykonania w przeglądarce i node.js
const run = () => {
    console.time('fibOld n = 41');
    console.log(fibOld(41));
    console.timeEnd('fibOld n = 41');

    console.time('fib n = 41');
    console.log(fib(41));
    console.timeEnd('fib n = 41');

    console.time('fib n = 100');
    console.log(fib(100));
    console.timeEnd('fib n = 100');
}

run();

// 165580141
// fibOld n = 41: 2.422s
// 267914296
// fib n = 41: 0.426ms
// 573147844013817200000
// fib n = 100: 0.338ms
// Widać znaczącą różnicę w wydajności