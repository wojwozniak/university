/**
 * Zadanie 2
 * Napisać program, który wyznacza zbiór
 * wszystkich liczb natualnych 1 a 100000, 
 * które są podzielne zarówno przez każdą ze swoich 
 * cyfr z osobna jak i przez sumę swoich cyfr.
 */


/**
 * @param {number} upperBound górna granica przedziału
 * @returns {Array} ciąg liczb spełniających warunek
 */
const nums = (upperBound) => {
    // Definiujemy ciąg zwracany przez funkcję
    let output = [];

    // Iterujemy po całym przedziale
    for(let i = 1; i <= upperBound; i++) {

        // Wyznaczamy ilość cyfr w danej liczbie
        let len = i.toString().length;

        // Sprawdzamy podzielność przez każdą z cyfr i liczymy sumę cyfr
        let sum = 0;
        let flag = true;
        for(let y=0; y<len; y++) {
            let num = parseInt(i.toString()[y]);
            if(i % num !== 0) flag = false;
            sum += num;
        }

        // Dodajemy liczbę do ciągu, jeśli spełnia warunki
        if(i % sum === 0 && flag === true) output.push(i);
    }
    return output;
}

console.log(nums(100000));