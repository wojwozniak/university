var n = 1;

console.log(typeof n);
console.log(typeof Object.getPrototypeOf(n));

n.foo = "foo";
console.log(n.foo);

// Javascript ma koercję prymitywów do obiektów - prototypem liczby będzie object. Mimo tego nie można dodać żadnych propów