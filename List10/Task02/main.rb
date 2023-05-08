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