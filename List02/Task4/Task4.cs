/*
* Wojciech Woźniak
* Lista 2: Zadanie 4
* dotnet run Task4.cs
* (Korzystam z .NET SDK 7.0.201)
* Przed wywołaniem dotnet run korzystam z "dotnet new console"
*/

public class Program {
    public static void Main() {

        /*
        * Testy LazyIntList
        * Wywołanie lista.size() zwraca wartość
        * o 1 większą niż te w przykładzie z listy zadań - wydaje mi się,
        * że było to przeoczenie i moja wersja jest poprawna (powód: indeksowanie od zera)
        * np. wywołanie lista.element(0) sprawi że lista.size() zwróci 1
        */
        Console.WriteLine("Testy LazyIntList");
        LazyIntList lista = new LazyIntList();
        Console.WriteLine(lista.size()); // 0
        Console.WriteLine(lista.element(0)); // 0
        Console.WriteLine(lista.size()); // 1
        Console.WriteLine(lista.element(40)); // 40
        Console.WriteLine(lista.size()); // 41
        Console.WriteLine(lista.element(38)); // 38
        Console.WriteLine(lista.size()); // 41


        // Testy LazyPrimeList
        Console.WriteLine("Testy LazyPrimeList");
        LazyPrimeList lpl = new LazyPrimeList();
        Console.WriteLine(lpl.size()); // 0
        Console.WriteLine(lpl.element(0)); // 2
        Console.WriteLine(lpl.element(1)); // 3
        Console.WriteLine(lpl.size()); // 2
        Console.WriteLine(lpl.element(2)); // 5
        Console.WriteLine(lpl.element(4)); // 11
        Console.WriteLine(lpl.element(10)); // 31
        Console.WriteLine(lpl.size()); // 11
        
    }
}

// Klasa LazyIntList
public class LazyIntList {
    // Deklaracje listy liczb i zmiennej przechowującej indeks ostatniej liczby na liście
    // Deklaruję jako protected bo będę edytował je w LazyPrimeList
    protected List<int> list;
    protected int lastIndex;

    // Gdy lista jest pusta ustawiam indeks na -1
    public LazyIntList() {
        list = new List<int>();
        lastIndex = -1;
    }

    /* Jeśli element znajduje się na liście zwracam jego wartość
    * W przeciwnym wypadku dodaję do listy kolejne elementy dopóki nie dotrę do tego, 
    * którego szukam (i aktualizuję wartość lastIndex)
    */
    public virtual int element(int i) {
        if (i <= lastIndex) {
            return list[i];
        }

        for (int j = lastIndex + 1; j <= i; j++) {
            list.Add(j);
        }
        lastIndex = i;
        return list[i];
    }

    public int size() {
        return list.Count;
    }
}

// Klasa LazyPrimeList dziedzicząca po LazyIntList
class LazyPrimeList : LazyIntList {
    // Korzystam z PrimeStream stworzonego w zadaniu 1 z tej listy
    private PrimeStream ps = new PrimeStream();

    public override int element(int i) {
        // Dodaję kolejne elementy korzystając z PrimeStream i aktualizuję indeks
        // (jeśli jest taka potrzeba)
        while (i >= size()) {
            base.list.Add(ps.next());
            base.lastIndex = i;
        }
        // Zwracam odpowiedni element
        return base.element(i);
    }
}



// LazyPrimeList korzysta z PrimeStream z zadania pierwszego - poniżej znajduje się przekopiowany kod klas IntStream i PrimeStream z tego zadania

// Klasa IntStream
public class IntStream {
    private int current = 0;
    private bool endOfStream = false;

    // Metoda zwracająca kolejną liczbę (lub -1 gdy endOfStream==true)
    public virtual int next() {
        if(!endOfStream) {
            int result = current;
            current++;
            return result;
        } else return -1;
    }

    // Metoda kończąca strumień
    public virtual bool eos() {
        endOfStream = true;
        return endOfStream;
    }

    // Reset strumienia - wartość z powrotem na zero
    public virtual void reset() {
        current = 0;
        endOfStream = false;
    }

    // Przy każdej metodzie dajemy virtual - jest to sposób na uniknięcie błędu CS0506 przy nadpisywaniu metod przez klasy dziedziczące
}

// Klasa PrimeStream dziedzicząca po IntStream
public class PrimeStream : IntStream {
    // Nadpisujemy odziedziczonego nexta
    public override int next() {
        // Wywołujemy nexta z bazowej klasy i sprawdzamy czy dał nam liczbę pierwszą - wywołujemy go dopóki tego nie zrobi
        int nextPrime = base.next();
        while (!isPrime(nextPrime)) {
            nextPrime = base.next();
        }
        return nextPrime;
    }

    // Prosta funkcja sprawdzająca czy przekazana liczba jest liczbą pierwszą
    private bool isPrime(int n) {
        if (n < 2) {
            return false;
        }

        for (int i = 2; i*i <= n; i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}