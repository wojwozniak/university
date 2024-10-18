// Korzystamy z dostępnego w każdej funkcji obiektu arguments (jest to tablica zawierająca wszystkie argumenty przekazane do funkcji)
function sum() {
    let sum = 0;
    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

console.log(sum(1,2,3,4,5));