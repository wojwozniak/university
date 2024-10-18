/*
* Wojciech Woźniak
* Lista 3: Zadanie 2
* (Korzystam z .NET SDK 7.0.201)
* * Użycie:
* > Przenosimy plik do pustego folderu
* > Przechodzimy w terminalu do tego folderu
* > Wywołujemy "dotnet new console", co wygeneruje pliki pomocnicze
* > Usuwamy plik Program.cs (inaczej będzie się
* pojawiać w konsoli również "Hello World")
* > Od teraz możemy kompilować za pomocą "dotnet run Task2.cs"
*/

/*
* Wymagania na początku listy zakazują korzystania z 
* klas bibliotecznych. W swoim rozwiązaniu korzystam 
* z KeyValuePair - struct domyślnie dostępny w C#.  
* Wydaje mi się, że KeyValuePair nie jest wykluczony 
* przez to wymaganie.
*/

// Definicja klasy MyDictionary
public class MyDictionary<K,V> {
    // Lista par przechowująca klucze i wartości
    private List<KeyValuePair<K,V>> list = new List<KeyValuePair<K,V>>();

    /* 
    * Funkcja Find przyjmująca klucz i zwracająca  
    * wartość dla tego klucza. Jeśli go nie znajdzie
    * to zwraca wyjątek - błąd "nie znaleziono klucza 
    */
    public V Find(K key) {
        foreach (KeyValuePair<K,V> pair in list) {
            if (pair.Key.Equals(key)) {
                return pair.Value;
            }
        }
        throw new KeyNotFoundException("Nie znaleziono klucza!");
    }

    /* 
    * Funkcja dodająca element do listy (po prostu 
    * wywołujemy Add na głównej liście).
    * Próba dodania pary z kluczem w którym się już * znajduje na liście zwraca błąd.
    */
    public void Add(K key, V value) {
        try {
            Find(key);
        } catch (KeyNotFoundException) {
            list.Add(new KeyValuePair<K,V>(key, value));
            return;
        }
        Console.WriteLine("Klucz już się znajduje na liście!");
    }

    /*
    * Przechodzimy przez całą listę i szukamy 
    * elementu, który chcemy usunąć. Jeśli go znajdziemy, wywołujemy remove. W przeciwnym 
    * wypadku wypisujemy "Nie znaleziono klucza"
    */
    public void Remove(K key) {
        foreach (KeyValuePair<K,V> pair in list) {
            if (pair.Key.Equals(key)) {
                list.Remove(pair);
                return;
            }
        }
        Console.WriteLine("Nie znaleziono klucza - nie ma czego usunąć!");
    }
}

// Testy dla klasy MyDictionary
public class Program {
    public static void Main() {
        //Tworzymy słownik i dodajemy pięć wartości
        MyDictionary<int, string> dict = new MyDictionary<int, string>();
        dict.Add(1, "jeden");
        dict.Add(2, "dwa");
        dict.Add(3, "trzy");
        dict.Add(4, "cztery");
        dict.Add(5, "pięć");

        // Próba ponownego przydzielenia klucza zwróci błąd
        dict.Add(1, "nie zadziała");

        /*
        * Wywołujemy find najpierw dla klucza który
        * się znajduje na liście, później usuwamy go 
        * i próbujemy jeszcze raz
        */
        Console.WriteLine(dict.Find(2)); // Output: "dwa"
        dict.Remove(2);
        try {
            Console.WriteLine(dict.Find(2));
        }
        catch (KeyNotFoundException exception) {
            Console.WriteLine(exception.Message); // Output: "Nie znaleziono klucza"
        }
    }
}