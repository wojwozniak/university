### Dlaczego nie: Worker.prototype = Person.prototype ?

Zmiany w dziedziczącym Worker wpłyną na Person - nieintuicyjne i niepożądane

### Dlaczego nie: Worker.prototype = new Person() ?

Korzystamy z konstruktora Person więc de facto tworzymy Person. Nie przekażemy argumentów konstruktora odpowiednich dla Worker

### Worker.prototype = Object.create(Person.prototype)

Poprawna wersja z wykładu izoluje prototyp, zmiany w dziedziczącym prototypie nie wpłyną na prototyp rodzica