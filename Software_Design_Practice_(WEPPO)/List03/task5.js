function createGenerator(limit) {
    var _state = 0;
    return {
        next: function () {
            return {
                value: _state,
                done: _state++ >= limit // przerabiamy na zmienną przekazywaną jako argument
            };
        }
    };
}

var foo1 = {
    [Symbol.iterator]: createGenerator.bind(null, 5)
};

var foo2 = {
    [Symbol.iterator]: createGenerator.bind(null, 8)
};

// Pierwszy argument to null, bo nie przekazujemy kontekstu (this)

var foo1Results = [];
for (var f of foo1) {
  foo1Results.push(f);
}

var foo2Results = [];
for (var f of foo2) {
  foo2Results.push(f);
}

console.log(foo1Results.length);
console.log(foo2Results.length);