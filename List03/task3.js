function createFs(n) {
    var fs = [];
    for (var i = 0; i < n; i++) {
        fs[i] = (function (j) {
            return function () {
                return j;
            };
        })(i);
    }
    return fs;
}


// Już działa poprawnie
var myfs = createFs(10);
console.log(myfs[0]());
console.log(myfs[2]());
console.log(myfs[7]())