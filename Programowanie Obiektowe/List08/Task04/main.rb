
/
    Zadanie 4, Lista 8
    Autor: Wojciech Woźniak
    Kompilacja: ruby main.rb
/

/ Definicja klasy Jawna /
class Jawna

    # Zmienna text
    attr_reader :text
  
    # Konstuktor
    def initialize(text)
      @text = text
    end
  
    # Metoda zaszyfruj
    def zaszyfruj(key)
        # Mapujemy każdy znak tekstu na odpowiedni znak z klucza
        chars = text.chars.map do |c|
            key[c] || c
        end
        
        # Zwracamy nowy obiekt klasy Zaszyfrowana
        Zaszyfrowana.new(chars.join)
    end
end

/ Definicja klasy Zaszyfrowana /
class Zaszyfrowana
    
    # Zmienna text
    attr_reader :text
  
    # Konstuktor
    def initialize(text)
      @text = text
    end
  
    # Metoda odszyfruj
    def odszyfruj(key)
        # Mapujemy każdy znak tekstu na odpowiedni znak z klucza
        chars = text.chars.map do |c|
            key.invert[c] || c
        end

        # Zwracamy nowy obiekt klasy Jawna
        Jawna.new(chars.join)
    end
end

# Test działania funkcji (z treści zadania)

# Tworzymy klucz
key = {
    'a' => 'b',
    'b' => 'r',
    'r' => 'y',
    'y' => 'u',
    'u' => 'a'
}

puts "Test szyfrowania i odszyfrowania z treści zadania"

j = Jawna.new('ruby')
z = j.zaszyfruj(key)
puts "Szyfrowanie słowa 'ruby'"
puts "Oczekiwane: 'yaru'"
puts z.text

j2 = z.odszyfruj(key)
puts "Odszyfrowanie słowa 'yaru'"
puts "Oczekiwane: 'ruby'"
puts j2.text