function Foo() {
    var privateVar = 'To jest składowa prywatna';
    this.Bar = function () {
        console.log('Metoda publiczna Bar została wywołana');
        Qux();
    };
    function Qux() {
        console.log(privateVar);
    }
}
var myInstance = new Foo();
myInstance.Bar(); // to git
//myInstance.Qux(); // a to nie