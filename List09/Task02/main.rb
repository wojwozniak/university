/
  Zadanie 2, Lista 9
  Autor: Wojciech Woźniak
  Kompilacja: ruby main.rb
/

/ Definicja klasy Function2D /
class Function2D

    # Konstruktor klasy Function2D
    def initialize(&block)
        @func = block
    end
    
    # Metoda value - oblicza wartość funkcji w punkcie (x,y)
    def value(x, y)
        @func.call(x, y)
    end
    
    # Metoda volume - oblicza przybliżoną objętość między wykresem funkcji a leżącym na płaszczyźnie OXOY prostokątem [a, b] ×[c, d]
    def volume(a, b, c, d)
        # Ilość podziałów prostokąta
        n = 1000
        # Szerokość i wysokość podprzedziału
        width = (b - a).to_f / n
        height = (d - c).to_f / n
        # Suma objętości podprzedziałów
        sum = 0.0
        # Wartość funkcji w punkcie (a, c)
        x = a
        y = c
  
      # Obliczamy sumę objętości podprzedziałów
      n.times do
            m.times do
                volume = @func.call(x, y) * width * height
                sum += volume
                y += height
            end
        x += width
      end
  
        # Zwracamy sumę objętości podprzedziałów
        return sum
    end
    
    # Metoda contour_line
    def contour_line(a, b, c, d, height, step_size)

        # Lista par (x,y) takich, że f.value(x,y) ~= height
        contour_line = []

        # Wartość funkcji w punkcie (a, c)
        x = a
        y = c
    
        # Przesuwamy się po siatce o podany krok i sprawdzamy,
        # czy wartość funkcji jest zbliżona do wartości oczekiwanej
        while x <= b
            while y <= d
            value = @func.call(x, y)
            if (value - height).abs <= step_size
                contour_line << [x, y]
            end
            y += step_size
            end
            x += step_size
            y = c
        end
  
      # Zwracamy listę punktów na konturze
      return contour_line
    end
end

/ Testowanie klasy Function2D /
# Definicja funkcji x^2 + y^2
f = Function2D.new { |x, y| x**2 + y**2 }

# Obliczenie wartości funkcji w punkcie (0,0)
puts "Obliczenie wartości funkcji w punkcie (0,0)"
puts "Oczekiwany output: '0'"
puts f.value(0, 0)

# Obliczenie wartości funkcji w punkcie (1,2)
puts "Obliczenie wartości funkcji w punkcie (1,2)"
puts "Oczekiwany output: '5'"
puts f.value(1, 2)
