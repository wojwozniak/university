/*
* Wojciech Woźniak
* Lista 3: Zadanie 4
* (Korzystam z .NET SDK 7.0.201)
* * Użycie:
* > Przenosimy plik do pustego folderu
* > Przechodzimy w terminalu do tego folderu
* > Wywołujemy "dotnet new console", co wygeneruje pliki pomocnicze
* > Usuwamy plik Program.cs (inaczej będzie się
* pojawiać w konsoli również "Hello World")
* > Od teraz możemy kompilować za pomocą "dotnet run Task2.cs"
*/

// Deklaracja klasy wektor
public class Wektor {
    /* 
    * Tablica liczb zmiennoprzecinkowych 
    * przechowujących współrzedne wektora
    */
    private float[] wspolrzedne;

    /*
    * Inicjacja klasy wektor - wymuszamy podanie
    * jego wymiarów (na potrzeby tablicy)
    */
    public Wektor(int wymiar) {
        wspolrzedne = new float[wymiar];
    }

    /*
    * Funkcja dzięki której unikamy błędu CS0021
    * i możemy odnosić się do współrzędnych wektorów
    * za pomocą wektor[]
    */
    public float this[int i] {
        get => wspolrzedne[i];
        set => wspolrzedne[i] = value;
    }

    /* 
    * Funkcja zwracająca wymiar danego wektora -
    * bardziej czytelne wywołania w dalszej części programu
    */
    public int Wymiar => wspolrzedne.Length;

    // Deklaracja operacji dodawania wektorów
    public static Wektor operator +(Wektor v1, Wektor v2) {
        // Jeśli wymiary się nie zgadzają nie można dodać wektorów
        if (v1.Wymiar != v2.Wymiar) {
            throw new ArgumentException("Wymiary wektorów się różnią!");
        }

        // Tworzymy nowy wektor o takim samym wymiarze
        var result = new Wektor(v1.Wymiar);

        // Po kolei dodajemy kolejne wartości
        for (int i = 0; i < result.Wymiar; i++) {
            result[i] = v1[i] + v2[i];
        }

        // Zwracamy nowy wektor
        return result;
    }

    // Deklaracja operatora iloczynu skalarnego wektorów
    public static float operator *(Wektor v1, Wektor v2) {
        // Jak wyżej - koniecznie takie same wymiary
        if (v1.Wymiar != v2.Wymiar) {
            throw new ArgumentException("Wymiary wektorów się różnią!");
        }

        // Deklarujemy i inicjujemy zmienną z wynikiem
        float result = 0;

        // Dodajemy iloczyny kolejnych wartości w wektorze
        for (int i = 0; i < v1.Wymiar; i++) {
            result += v1[i] * v2[i];
        }

        // Zwracamy wynik
        return result;
    }

    // Deklaracja operatora mnożenia wektora przez skalars
    public static Wektor operator *(float skalar, Wektor v) {
        // Wynikiem będzie wektor o takim samym wymiarze jak wejściowy
        var result = new Wektor(v.Wymiar);

        // Każdą liczbę w wektorze mnożymy przez skalar
        for (int i = 0; i < v.Wymiar; i++) {
            result[i] = skalar * v[i];
        }

        // Zwracamy nowy wektor
        return result;
    }

    /*
    * Funkcja Norma zwracająca długość wektora.
    * Korzystamy z this, by można było wywołać
    * funkcję jako wektor.Norma() zamiast 
    * przekazywania argumentu.
    * Na koniec rzutujemy Math.sqrt na typ float
    */
    public float Norma() {
        return (float)Math.Sqrt(this * this);
    }
}


// Testy klasy Wektor
class Program {
    public static void Main(string[] args) {
        // Na początku inicjujemy dwa wektory [x,y,z]. 
        Wektor v1 = new Wektor(3);
        v1[0] = 1;
        v1[1] = 2;
        v1[2] = 3;
        Wektor v2 = new Wektor(3);
        v2[0] = 4;
        v2[1] = 5;
        v2[2] = 6;

        // Wektor v3 jest sumą dwóch poprzednich
        Wektor v3 = v1 + v2;
        Console.WriteLine("Test dodawania wektorów:");
        Console.WriteLine($"v1 = {v1[0]}, {v1[1]}, {v1[2]}");
        Console.WriteLine($"v2 = {v2[0]}, {v2[1]}, {v2[2]}");
        Console.WriteLine($"v3 = {v3[0]}, {v3[1]}, {v3[2]}");


        // Test iloczynu skalarnego wektorów
        float product = v1 * v2;
        Console.WriteLine("Test iloczynu skalarnego:");
        Console.WriteLine($"v1 = {v1[0]}, {v1[1]}, {v1[2]}");
        Console.WriteLine($"v2 = {v2[0]}, {v2[1]}, {v2[2]}");
        Console.WriteLine($"v1*v2 = {product}");


        // Test mnożenia wektora przez skalar
        float scalar = 2.5f;
        Wektor v4 = scalar * v1;
        Console.WriteLine("Test mnożenia wektora przez skalar:");
        Console.WriteLine($"v1 = {v1[0]}, {v1[1]}, {v1[2]}");
        Console.WriteLine($"Skalar = {scalar}");
        Console.WriteLine($"v4 = {v4[0]}, {v4[1]}, {v4[2]}");

        
        // Test liczenia długości wektora
        Console.WriteLine("Wektor");
        Console.WriteLine($"v1 = {v1[0]}, {v1[1]}, {v1[2]}");
        Console.WriteLine($"Jego długość = {v1.Norma()}");
    }
}