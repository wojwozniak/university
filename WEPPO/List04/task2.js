function isPropertyInObjectOrPrototype(obj, propertyName) {
    return obj.hasOwnProperty(propertyName) || (propertyName in obj);
}

var q = {
    surname: 'kowalski',
};

var p = Object.create(q);
p.name = 'jan';

console.log("Pola/funkcje w obiekcie 'p':");
for (var key in p) {
    if (isPropertyInObjectOrPrototype(p, key)) {
        console.log(key);
    }
}

console.log("\nPola/funkcje w obiekcie 'p' i jego prototypach:");
for (var key in p) {
    if (isPropertyInObjectOrPrototype(p, key)) {
        console.log(key);
    }
    var prototype = Object.getPrototypeOf(p);
    while (prototype) {
        if (isPropertyInObjectOrPrototype(prototype, key)) {
            console.log(key);
        }
        prototype = Object.getPrototypeOf(prototype);
    }
}