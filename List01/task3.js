/** Zadanie 3
 * Napisać program, który wyznacza zbiór 
 * liczb pierwszych między 2 a 100000. 
 * Zastosować metodę najprostszą algorytmicznie, 
 * niekoniecznie wydajną obliczeniowo 
 * (za wydajny algorytm nie będzie
 * dodatkowych punktów)
 */



/**
 * @param {number} upperBound górna granica przedziału
 * @returns {Array} ciąg liczb spełniających warunek
 */
const firsts = (upperBound) => {
    let output = [];
    for(let i = 2; i<= upperBound; i++) {
        let flag = true;
        for(let y = 2; y * y <= i; y++) {
            if(i % y === 0) {
                flag = false;
                break;
            }
        }

        if(flag) output.push(i);
    }
    return output;
};

console.log(firsts(100000));