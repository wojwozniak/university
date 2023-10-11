/*
* Wojciech Woźniak
* Lista 4: Zadanie 2
* (Korzystam z .NET SDK 7.0.201)
* * Użycie:
* > Przenosimy plik do pustego folderu
* > Przechodzimy w terminalu do tego folderu
* > Wywołujemy "dotnet new console", co wygeneruje pliki pomocnicze
* > Usuwamy plik Program.cs (inaczej będzie się
* pojawiać w konsoli również "Hello World")
* > Od teraz możemy kompilować za pomocą "dotnet run Task2.cs"
*/

using System;
using System.Collections;
using System.Collections.Generic;

/* Klasa SłowaFibonacciego implementująca 
interfejs IEnumerable<string> */
public class SlowaFibonacciego : IEnumerable<string> {
    private int n;

    // Konstruktor
    public SlowaFibonacciego(int n) {
        this.n = n;
    }

    // Implementacja interfejsu IEnumerable<string>
    public IEnumerator<string> GetEnumerator() {
        int i = 0;
        string s1 = "b";
        string s2 = "a";
        string current = "";

        while (i < n) {
            if (i == 0) {
                current = s1;
            } else if (i == 1) {
                current = s2;
            } else {
                current = s1 + s2;
                s1 = s2;
                s2 = current;
            }
            i++;
            yield return current;
        }
    }

    IEnumerator IEnumerable.GetEnumerator() {
        return GetEnumerator();
    }
}

/* Test SłowaFibonacciego jak w przykładzie */
public class Program {
    public static void Main() {
        SlowaFibonacciego sf = new SlowaFibonacciego(200);
        foreach (string s in sf)
            Console.WriteLine(s);
    }
}