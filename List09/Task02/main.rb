/
  Zadanie 2, Lista 9
  Autor: Wojciech Woźniak
  Wersja 1.0 (2023-05-07)
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

        # Tworzymy siatkę szescianów o podanym kroku - 
        # możemy zmniejszyć krok, aby zwiększyć dokładność kosztem wydajności

        step_size=0.1
        volume = 0.0
        
        # Przesuwamy się po siatce sześcianów o podany krok
        x = a + step_size / 2.0
        while x <= b
            y = c + step_size / 2.0
            while y <= d
                value = @func.call(x, y)
                volume += (value * step_size**3)
                y += step_size
            end
            x += step_size
        end
        
        return volume
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


# Obliczenie objętości figury między powierzchnią a płaszczyzną XY
puts "Obliczenie objętości figury między powierzchnią a płaszczyzną XY"
puts "Oczekiwany output: '~666'"
puts f.volume(0,10,0,10)


# Obliczenie linii poziomicy w przedziale x: 0 do 1 i y: 0 do 1
puts "Obliczenie linii poziomicy w przedziale x: 0 do 1 i y: 0 do 1"
puts f.contour_line(0, 1, 0, 1, 1, 0.01)