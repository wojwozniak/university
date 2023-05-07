/
  Zadanie 1, Lista 10
  Autor: Wojciech Woźniak
  Wersja 1.0 (2023-05-07)
  Kompilacja: ruby main.rb
/
 

# Prosta przykładowa klasa Collection      
# przechowująca kolekcje elementów
class Collection
  def initialize(*elements)
    @data = elements
  end
  
  def swap(i, j)
    @data[i], @data[j] = @data[j], @data[i]
  end
  
  def length
    @data.length
  end
  
  def get(i)
    @data[i]
  end
  
end

# Testy dla klasy Collection
# Test metody swap: zamiana miejscami elementów w tablicy
# Oczekiwany output: [3, 2, 1]
# Realny output: [3, 2, 1]
def test_swap
    collection = Collection.new(1, 2, 3)
    collection.swap(0, 2)
    puts "Test metody swap"
    puts "Oczekiwany output: [3, 2, 1]"
    puts "Realny output: #{collection.instance_variable_get(:@data)}"
end

# Test metody length: zwracanie długości tablicy
# Oczekiwany output: 3
# Realny output: 3
def test_length
    collection = Collection.new(1, 2, 3)
    puts "Test metody length"
    puts "Oczekiwany output: 3"
    puts "Realny output: #{collection.length}"
end
  
# Test metody get: zwracanie elementu o danym indeksie
# Oczekiwany output: 2
# Realny output: 2
def test_get
    collection = Collection.new(1, 2, 3)
    puts "Test metody get"
    puts "Oczekiwany output: 2"
    puts "Realny output: #{collection.get(1)}"
end

# Wywołanie testów
def run_tests
    test_swap()
    test_length()
    test_get()
end



