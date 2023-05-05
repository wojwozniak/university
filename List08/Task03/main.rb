
/
    Zadanie 3, Lista 8
    Autor: Wojciech Woźniak
    Kompilacja: ruby main.rb
/

/ Definicja klasy ONP /
class ONP

    /
        Definiujemy zmienną wyrażenie.
        W Ruby nie ma potrzeby definiowania typów zmiennych
        (lub zmiennej w ogóle). Dzięki użyciu attr_accessor
        mamy automatycznie generowane metody get i set.
    /
    attr_accessor :wyrazenie
  
    # Konstuktor klasy ONP - inicjuje wyrażenie
    def initialize(wyrazenie)
      @wyrazenie = wyrazenie
    end
  
    # Definicja metody oblicz
    def oblicz(zmienne)

        # Tworzymy stos
        stos = []
    
        # Iterujemy po każdym elemencie wyrażenia
        @wyrazenie.each do |element|

            # Jeśli element jest liczbą, to wrzucamy go na stos
            if element.is_a?(Numeric)
                stos.push(element)
            
            # w.p.p. tworzymy słownik zmiennych
            elsif element =~ /[a-zA-Z]/
                # Jeśli zmienna jest w słowniku, 
                # to wrzucamy jej wartość na stos
                if zmienne.has_key?(element)
                    stos.push(zmienne[element])
                else
                    puts "Nieznana zmienna: #{element}"
                    return nil
            end

            # Jeśli element jest operatorem, to sprawdzamy czy
            # na stosie jest wystarczająca ilość elementów 
            elsif element =~ /[\+\-\*\/]/
                if stos.size < 2
                    puts "Błąd: zbyt mało elementów na stosie"
                    return nil
            end

            # Zdejmujemy ze stosu dwie ostatnie liczby
            b = stos.pop
            a = stos.pop

            # Wykonujemy odpowiednią operację na liczbach
            case element
                when "+"
                    wynik = a + b
                when "-"
                    wynik = a - b
                when "*"
                    wynik = a * b
                when "/"
                    wynik = a / b
            end

            # Wrzucamy wynik operacji na stos
            stos.push(wynik)

            # Jeśli żaden z powyższych warunków 
            # nie został spełniony to zwroć błąd
            else
                puts "Nieznany element: #{element}"
                return nil
            end

            # Wyświetlamy stan stosu
            puts "Stos: #{stos.join(", ")}"
        end
    
        # Zwróć błąd jeśli został więcej 
        # niż jeden element na stosie
        if stos.size != 1
            puts "Błąd: zbyt wiele elementów na stosie"
            return nil
        end
        
        # Zwróć wynik
        return stos.pop
    end
end

# Funkcja z testami
def test()

    # Test 0
        puts "Test 0"
        wyrazenie = ONP.new([12, 13, '+', 3, 1, '-', '*', 2, '/'])
        zmienne = {}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: 25"
        puts "Wynik: #{wynik}"
    # Koniec testu 0


    # Test 1: Dodawanie dwóch liczb
        puts "Test 1: Dodawanie dwóch liczb"
        wyrazenie = ONP.new([3, 4, '+'])
        zmienne = {}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: 7"
        puts "Wynik: #{wynik}"
    # Koniec testu 1

    
    # Test 2: Mnożenie liczby przez zmienną
        puts "Test 2: Mnożenie liczby przez zmienną"
        wyrazenie = ONP.new(['x', 3, '*'])
        zmienne = {'x' => 4}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: 12"
        puts "Wynik: #{wynik}"
    # Koniec testu 2


    # Test 3: Użycie nieznanej zmiennej
        puts "Test 3: Użycie nieznanej zmiennej"
        wyrazenie = ONP.new(['y', 2, '*'])
        zmienne = {'x' => 4}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: Nieznana zmienna: y"
        puts "Wynik: #{wynik}"
    # Koniec testu 3


    # Test 4: Zbyt mało elementów na stosie
        puts "Test 4: Zbyt mało elementów na stosie"
        wyrazenie = ONP.new([3, '+'])
        zmienne = {}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: Błąd: zbyt mało elementów na stosie"
        puts "Wynik: #{wynik}"
    # Koniec testu 4


    # Test 5: Kilka operacji
        puts "Test 5: Kilka operacji"
        wyrazenie = ONP.new([3, 4, 5, '+', '-'])
        zmienne = {}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: -6"
        puts "Wynik: #{wynik}"
    # Koniec testu 5


    # Test 6: Użycie nieznanej zmiennej
        puts "Test 6: Użycie nieznanej zmiennej"
        wyrazenie = ONP.new(['x', 'y', '*'])
        zmienne = {'x' => 2}
        puts "Wyrażenie: #{wyrazenie.wyrazenie}"
        puts "Zmienne: #{zmienne}"
        wynik = wyrazenie.oblicz(zmienne)
        puts "Oczekiwany wynik: Nieznany element: y"
        puts "Wynik: #{wynik}"
    # Koniec testu 6
end

# Wywołujemy testy
test()
