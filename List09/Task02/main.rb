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


# Obliczenie objętości figury między powierzchnią a płaszczyzną xy dla z=1/2



# Obliczenie linii poziomicy dla wartości z=1/2 w przedziale x: 0 do 1 i y: 0 do 1
puts "Obliczenie linii poziomicy dla wartości z=1/2 w przedziale x: 0 do 1 i y: 0 do 1"
puts "Oczekiwany output: [[0.707106781186548,0.707106781186548],[0.700000000000001,0.7141421356237308], [0.6931972057930319,0.7213203435596425], [0.686592294034003,0.7286403486601181], [0.6801804793453329,0.7361018038650837], [0.6739572383563089,0.7437047620909091], [0.6679183427733793,0.7514495763074173], [0.6620598451114869,0.7593369471878772], [0.6563770871643722,0.7673678821226834], [0.6508656671843195,0.7755437933489398] ..."
# puts f.contour_line(0, 1, 0, 1, 1, 0.01)