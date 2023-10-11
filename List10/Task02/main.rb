/
    Zadanie 2, Lista 10
    Autor: Wojciech Woźniak
    Wersja 1.0 (2023-05-08)
    Kompilacja: ruby main.rb
    Użyto chatGPT do wyszukania informacji
    nt. wyszukiwania interpolacyjnego - treść
    "rozmowy" w pliku gpt.txt
/

/ Definicja klasy Kolekcja /
class Kolekcja

    # Deklarujemy wskaźnik na głowę i ogon listy
    attr_accessor :head, :tail
    
    # Konstruktor
    def initialize
      @head = nil
      @tail = nil
    end
    
    # Metoda dodająca element do listy
    def dodaj_element(element)
        nowy_element = Element.new(element)
        # Jeśli lista jest pusta ustawiamy nowy element
        # jako głowę i ogon listy
        if @head.nil?
            @head = nowy_element
            @tail = nowy_element
        # Sprawdzamy czy element jest mniejszy od głowy listy
        # Jeśli tak to wstawiamy go na początek listy
        elsif element < @head.wartosc
            nowy_element.nastepny = @head
            @head.poprzedni = nowy_element
            @head = nowy_element
        # Sprawdzamy czy element jest większy od ogona listy
        # Jeśli tak to wstawiamy go na koniec listy
        elsif element > @tail.wartosc
            nowy_element.poprzedni = @tail
            @tail.nastepny = nowy_element
            @tail = nowy_element
        # W przeciwnym wypadku wstawiamy element w odpowiednie 
        # miejsce we wnętrzu listy
        else
            aktualny = @head.nastepny
            while aktualny != @tail && aktualny.wartosc < element
                aktualny = aktualny.nastepny
            end
            aktualny.poprzedni.nastepny = nowy_element
            nowy_element.poprzedni = aktualny.poprzedni
            nowy_element.nastepny = aktualny
            aktualny.poprzedni = nowy_element
        end
    end 
end


/ Definicja klasy Element /
class Element

    # Deklarujemy wskaźniki na poprzedni i następny element
    # oraz wartość elementu
    attr_accessor :wartosc, :poprzedni, :nastepny
    
    # Konstruktor
    def initialize(wartosc)
      @wartosc = wartosc
      @poprzedni = nil
      @nastepny = nil
    end
end



/ Testy dla kolekcji /


# Test tworzenia kolekcji i dodawania elementów
# Oczekiwany output: 1 2 3
def test_dodaj_element_i_wypisz
    collection = Kolekcja.new()
    collection.dodaj_element(2)
    collection.dodaj_element(1)
    collection.dodaj_element(3)
    puts "Test dodawania elementów i wypisywania zawartości"
    puts "Oczekiwany output: 1 2 3"
    aktualny = collection.head
    while aktualny != nil
        print aktualny.wartosc, " "
        aktualny = aktualny.nastepny
    end
    puts ""
end

# Test dodawania kolejnych elementów i wypisywania zawartości
# Oczekiwany output: 1 2 3 4 5
def test_dodaj_kolejne_elementy_i_wypisz
    collection = Kolekcja.new()
    collection.dodaj_element(2)
    collection.dodaj_element(1)
    collection.dodaj_element(3)
    collection.dodaj_element(5)
    collection.dodaj_element(4)
    puts "Test dodawania kolejnych elementów i wypisywania zawartości"
    puts "Oczekiwany output: 1 2 3 4 5"
    aktualny = collection.head
    while aktualny != nil
        print aktualny.wartosc, " "
        aktualny = aktualny.nastepny
    end
    puts ""
end

/ Koniec testów dla kolekcji /


/ Klasa Wyszukiwanie /
class Wyszukiwanie

    # Metoda wyszukująca element w kolekcji binarnie
    def self.binarnie(kolekcja, element)
        lewy = 0
        prawy = kolekcja.length - 1
  
        while lewy <= prawy
            srodek = (lewy + prawy) / 2
            if kolekcja[srodek] == element
            return srodek
            elsif kolekcja[srodek] < element
            lewy = srodek + 1
            else
            prawy = srodek - 1
            end
        end
  
      return nil
    end
  
    # Metoda wyszukująca element w kolekcji interpolacyjnie
    def self.interpolacyjnie(kolekcja, element)
        lewy = 0
        prawy = kolekcja.length - 1
    
        while lewy <= prawy && element >= kolekcja[lewy] && element <= kolekcja[prawy]
            srodek = lewy + ((element - kolekcja[lewy]) * (prawy - lewy)) / (kolekcja[prawy] - kolekcja[lewy])
            if kolekcja[srodek] == element
            return srodek
            elsif kolekcja[srodek] < element
            lewy = srodek + 1
            else
            prawy = srodek - 1
            end
        end
    
        return nil
    end
end



/ Testy dla wyszukiwań /



# Test metody binarnie
# Oczekiwany output: 2
def test_binarnie
    collection = [1, 2, 3, 4, 5]
    element = 3
    puts "Test metody binarnie"
    puts "Oczekiwany output: 2"
    puts "Realny output: #{Wyszukiwanie.binarnie(collection, element)}"
end
  
# Test metody binarnie dla brakującego elementu
# Oczekiwany output: nil
def test_binarnie_brakujacy
    collection = [1, 2, 3, 4, 5]
    element = 6
    puts "Test metody binarnie dla brakującego elementu"
    puts "Oczekiwany output: nil (brak widocznego outputu)"
    puts "Realny output: #{Wyszukiwanie.binarnie(collection, element)}"
end
  
# Test metody interpolacyjnie
# Oczekiwany output: 2
def test_interpolacyjnie
    collection = [1, 2, 3, 4, 5]
    element = 3
    puts "Test metody interpolacyjnie"
    puts "Oczekiwany output: 2"
    puts "Realny output: #{Wyszukiwanie.interpolacyjnie(collection, element)}"
end
  
# Test metody interpolacyjnie dla brakującego elementu
# Oczekiwany output: nil
def test_interpolacyjnie_brakujacy
    collection = [1, 2, 3, 4, 5]
    element = 6
    puts "Test metody interpolacyjnie dla brakującego elementu"
    puts "Oczekiwany output: nil (brak widocznego outputu)"
    puts "Realny output: #{Wyszukiwanie.interpolacyjnie(collection, element)}"
end

/ Koniec testów dla wyszukiwań /



/ Wywołanie testów /
def run_tests
    test_dodaj_element_i_wypisz()
    test_dodaj_kolejne_elementy_i_wypisz()
    test_binarnie()
    test_binarnie_brakujacy()
    test_interpolacyjnie()
    test_interpolacyjnie_brakujacy()
end

run_tests()