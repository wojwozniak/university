/*
* Wojciech Woźniak
* Lista 2: Zadanie 1
* dotnet run Task1.cs
* (Korzystam z .NET SDK 7.0.201)
* Przed wywołaniem dotnet run korzystam z "dotnet new console"
*/

// W tej klasie będziemy testować możliwości metod stworzonych na potrzeby tego zadania
public class Program {
    public static void Main() {

        // Testy dla metod z klasy IntStream
        Console.WriteLine("Testy dla podstawowego IntStream");

        // Tworzymy nowy strumień i wypisujemy 10 pierwszych wartości
        IntStream stream = new IntStream();
        for (int i = 0; i < 10; i++) {
            Console.WriteLine(stream.next());
        }
        
        // Wywołujemy koniec strumienia
        Console.WriteLine(stream.eos());
        // Próbujemy wywołać next
        Console.WriteLine(stream.next());
        // Resetujemy strumień i wywołujemy next jeszcze raz
        stream.reset();
        Console.WriteLine(stream.next());


        // Testy dla PrimeStream
        Console.WriteLine("Testy klasy PrimeStream");
        PrimeStream ps = new PrimeStream();
        // Poniższe wywołania powinny zwrócić kolejne liczby pierwsze
        Console.WriteLine(ps.next());
        Console.WriteLine(ps.next());
        Console.WriteLine(ps.next());
        Console.WriteLine(ps.next());
        Console.WriteLine(ps.next());


        // Testy dla RandomStream
        Console.WriteLine("Testy klasy RandomStream");
        RandomStream rs = new RandomStream();
        // Powinna zwrócić 5 losowych liczb
        Console.WriteLine(rs.next());
        Console.WriteLine(rs.next());
        Console.WriteLine(rs.next());
        Console.WriteLine(rs.next());
        Console.WriteLine(rs.next());
        // Wywołanie eos powinno zwrócić false, kolejne wywołanie next nie powinno wymagać użycia metody reset
        Console.WriteLine(rs.eos());
        Console.WriteLine(rs.next());

        // Testy dla RandomWordStream
        Console.WriteLine("Testy klasy RandomWordStream");
        RandomWordStream rws = new RandomWordStream();
        // 6 Wywołań - losowe napisy o długościach odpowiadających kolejnym liczbom naturalnym
        Console.WriteLine(rws.next());
        Console.WriteLine(rws.next());
        Console.WriteLine(rws.next());
        Console.WriteLine(rws.next());
        Console.WriteLine(rws.next());
        Console.WriteLine(rws.next());
    }
}

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
        // Wywołujemy nexta z bazowej klasy i sprawdzamy, czy dał nam liczbę pierwszą - wywołujemy go dopóki tego nie zrobi
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

// Klasa RandomStream dziedzicząca po IntSteam
class RandomStream : IntStream {
    // Losujemy Liczbę całkowitą
    private Random random = new Random();

    // Losujemy też po każdym wywołaniu next
    public override int next() {
        return random.Next();
    }

    // eos ma zawsze zwracać fałsz
    public override bool eos() {
        return false;
    }

    // Reset jest tylko kolejnym losowaniem (mógłby nie robić nic)
    public override void reset() {
        random = new Random();
    }
}

// Klasa RandomWordStream
class RandomWordStream {
    // Na potrzeby tej klasy tworzymy po jednej instancji klas PrimeStream i RandomStream
    private PrimeStream primeStream;
    private RandomStream randomStream;

    public RandomWordStream() {
        primeStream = new PrimeStream();
        randomStream = new RandomStream();
    }

    public string next() {
        // Wyznaczamy długość napisu za pomocą primeStream i rezerwujemy tablicę znaków o takiej długości
        int length = primeStream.next();
        char[] letters = new char[length];

        /* Dla każdej "komórki" losujemy liczbę, 
        * a następnie stosujemy modulo 94 i dodajemy 33 (aby uzyskać wartości w przedziale 33-126). 
        * Następnie rzutujemy tę liczbę na typ char by uzyskać znak który zapisujemy w tej komórce.
        */
        for (int i = 0; i < length; i++) {
            letters[i] = (char)((randomStream.next() % 94) + 33);
        }

        // Zwracamy naszą tablicę znaków jako typ string
        return new string(letters);
    }
}