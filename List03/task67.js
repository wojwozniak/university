// Zadanie 6

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
function useIterator() {
    var fibIterator = createFibIterator();
    for (var result; (result = fibIterator.next(), !result.done);) {
        console.log(result.value);
    }
}
// useIterator();

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
function useGenerator() {
    for (var i of fibGenerator()) {
        console.log(i);
    }
}

// useGenerator();


// Zadanie 7
function* take(it, top) {
    for (let i = 0; i < top; i++) {
        const { value, done } = it.next();
        if (done) {
            break;
        }
        yield value;
    }
}

// Użycie generatora z limitem
function useLimitedGenerator() {
    for (let num of take(fibGenerator(), 10)) {
        console.log(num);
    }
}
useLimitedGenerator();