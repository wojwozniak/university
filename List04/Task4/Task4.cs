/*
* Wojciech Woźniak
* Lista 4: Zadanie 4
* (Korzystam z .NET SDK 7.0.201)
* * Użycie:
* > Przenosimy plik do pustego folderu
* > Przechodzimy w terminalu do tego folderu
* > Wywołujemy "dotnet new console", co wygeneruje pliki pomocnicze
* > Usuwamy plik Program.cs (inaczej będzie się
* pojawiać w konsoli również "Hello World")
* > Od teraz możemy kompilować za pomocą "dotnet run Task4.cs"
*/

using System;
using System.Collections;
using System.Collections.Generic;


// Klasa Produkcji
public class Production {
    // Settery i gettery dla obu stron  
    public string LeftSide { 
        get; 
        set; 
    }
    public List<string> RightSide { 
        get; 
        set; 
    }

    // Konstruktor (inicjacja pól leftSide i rightSide)
    public Production(string leftSide, List<string> rightSide) {
        LeftSide = leftSide;
        RightSide = rightSide;
    }
}

public class Grammar {

    // Settery i gettery dla symbolu startowego i listy produkcji
    public string StartSymbol { 
        get; 
        set; 
    }
    public List<Production> Productions { 
        get; 
        set; 
    }

    // Konstruktor (inicjacja pól startSymbol i productions)
    public Grammar(string startSymbol, List<Production> productions) {
        StartSymbol = startSymbol;
        Productions = productions;
    }

    // Metoda zwracająca listę możliwych produkcji dla danego symbolu
    private List<string> GetPossibleProductions(string symbol) {
        // Lista wynikowa
        List<string> result = new List<string>();

        // Iteracja po wszystkich produkcjach
        foreach (Production production in Productions) {
            // Jeśli lewa strona produkcji jest równa symbolowi
            // to dodajemy prawą stronę do listy wynikowej
            if (production.LeftSide == symbol) {
                result.AddRange(production.RightSide);
            }
        }

        // Zwracamy listę wynikową
        return result;
    }

    // Metoda sprawdzająca czy symbol jest symbolem końcowym
    private bool IsNotEnding(string symbol) {

        // Iteracja po wszystkich produkcjach.
        // Jeśli znajdziemy cokolwiek zwracamy prawdę
        foreach (Production production in Productions) {
            if (production.LeftSide == symbol) {
                return true;
            }
        }

        // w.p.p. zwracamy fałsz
        return false;
    }

    // Metoda generująca losowy wyraz
    private string GenerateRandomWord(string symbol, Random rand) {

        // Pobieramy listę możliwych produkcji dla danego symbolu
        List<string> possibleProductions = GetPossibleProductions(symbol);

        // Jeśli lista jest pusta, to zwracamy symbol
        if (possibleProductions.Count == 0) {
            return symbol;
        }

        // Wybieramy losową produkcję
        // poprzez wylosowanie indeksu z listy możliwych produkcji
        string chosenProduction = possibleProductions[rand.Next(possibleProductions.Count)];

        // Dzielimy produkcję na symbole
        string[] productionSymbols = chosenProduction.Split(' ');

        // Inicjujemy zmienną przechowującą wynik
        string result = "";

        // Iterujemy po symbolach produkcji
        foreach (string productionSymbol in productionSymbols) {
            // Jeśli symbol nie jest symbolem końcowym 
            // to wywołujemy rekurencyjnie tą metodę dla niego
            if (IsNotEnding(productionSymbol)) {
                result += GenerateRandomWord(productionSymbol, rand);
            } else {
                // w.p.p. dodajemy symbol do wyniku
                result += productionSymbol;
            }
        }

        // Zwracamy wygenerowane słowo
        return result;
    }


    // Metoda wywołująca generowanie losowych wyrazów
    public List<string> GenerateRandomWords(int n) {

        // Lista wynikowa
        List<string> result = new List<string>();

        // Generator liczb losowych
        Random rand = new Random();

        // Generujemy n losowych wyrazów
        for (int i = 0; i < n; i++) {
            string word = GenerateRandomWord(StartSymbol, rand);
            result.Add(word);
        }

        // Zwracamy listę wynikową
        return result;
    }
}


// Klasa z testami
class Program {
    static void Main(string[] args) {

        // Tworzymy listę produkcji
        var productions = new List<Production> {
            new Production("S", new List<string> { "a A", "b B" }),
            new Production("A", new List<string> { "a A", "b" }),
            new Production("B", new List<string> { "c", "d B" })
        };

        // Tworzymy gramatykę z wybranym symbolem startowym i listą produkcji
        var grammar = new Grammar("S", productions);

        // Generujemy 5 losowych wyrazów
        List<string> randomWords = grammar.GenerateRandomWords(5);

        // Wyświetlamy wygenerowane wyrazy
        foreach (string word in randomWords) {
            Console.WriteLine(word);
        }
    }
}