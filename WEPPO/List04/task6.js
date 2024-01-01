function Tree(val, left, right) {
    this.left = left;
    this.right = right;
    this.val = val;
}

/*
// Depth-first iterator z wykładu
Tree.prototype[Symbol.iterator] = function* () {
    yield this.val;
    if (this.left) yield* this.left;
    if (this.right) yield* this.right;
}

// Przykład użycia
var root = new Tree(1,
    new Tree(2, new Tree(3)), new Tree(4));
for (var e of root) {
    console.log(e);
}

*/

Tree.prototype[Symbol.iterator] = function* () {
    const queue = [];
    queue.push(this);
    while (queue.length > 0) {
        const node = queue.shift();
        yield node.val;

        if (node.left) {
            queue.push(node.left);
        }
        if (node.right) {
            queue.push(node.right);
        }
    }
};

// Przykład użycia
var root = new Tree(1, new Tree(2, new Tree(3)), new Tree(4));

// val: 1
// left 2, left 3
// right 4

for (var e of root) {
    console.log(e);
}

// 1 2 4 3, tak jak chcieliśmy

// co by się stało, gdyby zamiast kolejki użyć stosu (dodawanie elementów na koniec stosu, ściągane elementów z końca stosu)?

// Wtedy pójdziemy od prawej strony: 1 4 2 3 w tym przykładzie