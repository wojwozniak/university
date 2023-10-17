// Zwykły iterator
function createFibIterator() {
    let a = 0, b = 1;

    return {
        next: function () {
            const value = a;
            const temp = a + b;
            a = b;
            b = temp;

            return {
                value: value,
                done: false
            };
        }
    };
}

// Użycie zwykłego iteratora
var fibIterator = createFibIterator();
for (var result; (result = fibIterator.next(), !result.done);) {
    console.log(result.value);
}

// Generator
function* fibGenerator() {
    let a = 0, b = 1;

    while (true) {
        yield a;
        const temp = a + b;
        a = b;
        b = temp;
    }
}

// Użycie generatora
for (var i of fibGenerator()) {
    console.log(i);
}