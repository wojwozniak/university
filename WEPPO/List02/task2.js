// Punkt 1:
// użycie operatorów . oraz [] do odwoływania się do składowych obiektu.
// – Jakie są różnice między tymi dwoma sposobami?
console.log("Punkt 1:")
console.log("Różnice między operatorem . oraz [] do odwoływania się do składowych obiektu:")

const person = {
    name: "Jan",
    age: 30
};
console.log(person.name);

const propertyName = "age";
console.log(person[propertyName]);

// Rożnice:
// 1. operator . nie może być użyty gdy nazwa właściwości zawiera spacje lub zaczyna się od cyfry
// 2. operator [] pozwala na użycie zmiennych jako nazwy właściwości



// Punkt 2:
// użycie argumentów innego typu niż string dla operatora [] dostępu do składowej obiektu.
// – Co się dzieje jeśli argumentem operatora jest liczba?
// – Co się dzieje jeśli argumentem operatora jest inny obiekt?
// – Jaki wpływ na klucz pod jakim zapisana zostanie wartość ma programista w obu przypadkach?
console.log("Punkt 2:")

console.log("Co się dzieje jeśli argumentem operatora jest liczba?")
// Liczba
const person2 = {
    0: "Jan",
    1: "Kowalski"
};

console.log(person2[0]);
console.log(person2[1]);

console.log("Co się dzieje jeśli argumentem operatora jest inny obiekt?")
// Inny obiekt
const person3 = {
    name: "Jan"
};

const key = {
    prop: "name"
};

console.log(person3[key.prop]);

// Wpływ programisty:
// W obu przypadkach mamy pełną kontrolę nad kluczem pod którym zapisana zostanie wartość.




// Punkt 3:
// użycie argumentów innego typu niż number dla operatora [] dostępu do tablicy.
// – Co się dzieje jeśli argumentem operatora jest napis?
// – Co się dzieje jeśli argumentem operatora jest inny obiekt?
// – Czy i jak zmienia się zawartość tablicy jeśli zostanie do niej dopisana właściwość pod kluczem, który nie jest liczbą?
// – Czy można ustawiać wartość atrybutu length tablicy na inną wartość niż liczba elementów w tej tablicy? Co się dzieje jeśli ustawia się wartość mniejszą niż liczba elementów, a co jeśli ustawia się wartość większą niż liczba elementów?
console.log("Punkt 3:")

console.log("Co się dzieje jeśli argumentem operatora jest napis?")
// Napis
const fruits = ["apple", "banana", "cherry"];
console.log(fruits["1"]); 

console.log("Co się dzieje jeśli argumentem operatora jest inny obiekt?")
// Inny obiekt
const fruits2 = ["apple", "banana", "cherry"];
const key2 = {
  prop: "1"
};
console.log(fruits2[key2.prop]);

console.log("Czy i jak zmienia się zawartość tablicy jeśli zostanie do niej dopisana właściwość pod kluczem, który nie jest liczbą?")
// Dopisanie właściwości
const fruits3 = ["apple", "banana", "cherry"];
fruits["3"] = "orange";
console.log(fruits3);

console.log("Czy można ustawiać wartość atrybutu length tablicy na inną wartość niż liczba elementów w tej tablicy? Co się dzieje jeśli ustawia się wartość mniejszą niż liczba elementów, a co jeśli ustawia się wartość większą niż liczba elementów?")
// Ustawianie wartości atrybutu length
const fruits4 = ["apple", "banana", "cherry"];
console.log(fruits4.length);

fruits4.length = 10;
console.log(fruits4.length);

fruits4.length = 2;
console.log(fruits4.length);

// Jeśli ustawimy wartość mniejszą niż liczba elementów, to tablica zostanie skrócona do tej długości.
// Jeśli ustawimy wartość większą niż liczba elementów, to tablica zostanie wydłużona do tej długości. Nowe elementy będą miały wartość undefined.