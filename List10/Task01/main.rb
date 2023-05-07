/
  Zadanie 1, Lista 10
  Autor: Wojciech Woźniak
  Wersja 1.0 (2023-05-07)
  Kompilacja: ruby main.rb
/

# Na początku odpowiadając na pytanie
# z treści zadania - w zależności od danych
# sort2 będzie trochę szybszy (insertion sort)
# sort1 to prosty bubblesort, który dla każdych 
# danych będzie miał złożoność O(n^2), natomiast
# insertion sort ma taką tylko w najgorszym przypadku

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

    def print_all
        puts @data.to_s
    end
end

# Testy dla klasy Collection

# Test metody swap
# Oczekiwany output: [3, 2, 1]
def test_swap
    collection = Collection.new(1, 2, 3)
    collection.swap(0, 2)
    puts "Test metody swap"
    puts "Oczekiwany output: [3, 2, 1]"
    puts "Realny output: #{collection.instance_variable_get(:@data)}"
end

# Test metody length
# Oczekiwany output: 3
def test_length
    collection = Collection.new(1, 2, 3)
    puts "Test metody length"
    puts "Oczekiwany output: 3"
    puts "Realny output: #{collection.length}"
end
  
# Test metody get
# Oczekiwany output: 2
def test_get
    collection = Collection.new(1, 2, 3)
    puts "Test metody get"
    puts "Oczekiwany output: 2"
    puts "Realny output: #{collection.get(1)}"
end





/ Klasa Sorter /
class Sorter

    # Pierwsze sortowanie - bubble sort
    def sort1(collection)
        n = collection.length
        loop do
            swapped = false
    
            (n-1).times do |i|
            if collection.get(i) > collection.get(i+1)
                collection.swap(i, i+1)
                swapped = true
            end
            end
    
            break unless swapped
        end
    
        collection
    end
  
    # Drugie sortowanie - insertion sort
    def sort2(collection)
        n = collection.length
    
        (1...n).each do |i|
            key = collection.get(i)
            j = i - 1
    
            while j >= 0 && collection.get(j) > key
            collection.swap(j, j+1)
            j -= 1
            end
    
            collection.instance_variable_get(:@data)[j+1] = key
        end
    
        collection
    end
end

# Testy dla klasy Sorter


# Test dla sortowania 1
# Oczekiwany output: [1, 2, 3, 4, 5]
def test_sort1()
    puts "Test sort1"

    collection = Collection.new([4, 2, 1, 5, 3])
    Sorter.new.sort1(collection)
    puts "Oczekiwany output: [1, 2, 3, 4, 5]"
    puts "Realny output: "
    puts collection.to_s
end
  
# Test dla sortowania 2
# Oczekiwany output: [1, 2, 3, 4, 5]
def test_sort2()
    puts "Test sort2"

    collection = Collection.new([4, 2, 1, 5, 3])
    Sorter.new.sort2(collection)
    puts "Oczekiwany output: [1, 2, 3, 4, 5]"
    puts "Realny output: "
    puts collection.to_s
end


# Wywołanie testów
def run_tests
    test_swap()
    test_length()
    test_get()
    test_sort1()
    test_sort2()
end

run_tests()