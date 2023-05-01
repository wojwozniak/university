/
  Zadanie 1, Lista 9
  Autor: Wojciech Woźniak
  Kompilacja: ruby main.rb
/

/ Definicja klasy Function /
class Function

  # Konstruktor klasy Function
  def initialize(&block)
    @func = block
  end
  
  # Definicja metody value
  def value(x)
    @func.call(x)
  end
  
  # Funkcja zwracająca miejsce zerowe funkcji
  def zero(a, b, e)

    # Krawędzie przedziału
    x1 = a
    x2 = b

    # Dopóki przedział jest większy niż zadana dokładność
    while (x2 - x1).abs > e

      # Obliczamy środek przedziału
      x3 = (x1 + x2) / 2

      x4 = @func.call(x3)

      # Jeśli środek jest miejscem zerowym, zwracamy go
      if x4 == 0
        return x4
      # Jeśli wartość funkcji w środku i na początku przedziału
      # jest mniejsza od zera, 
      # przesuwamy do środka prawą krawędź przedziału
      elsif @func.call(x1) * x4 < 0
        x2 = x3
      # w.p.p przesuwamy lewą krawędź przedziału
      else
        x1 = x3
      end
    end

    # Zwracamy nil w przypadku,
    # gdy nie znajdziemy miejsca zerowego
    nil
  end
  
  # Funkcja obliczająca pole powierzchni funkcji
  # w przedziale [a, b]
  def field(a, b)
    # Zmienna przechowująca sumę pól prostokątów
    sum = 0.0

    # Liczba podprzedziałów (im większa, 
    # tym dokładniejszy wynik, ale wolniej)
    n = 1000

    # Długość podprzedziału
    dx = (b - a) / n

    # Sumujemy pola prostokątów 
    # wyznaczonych przez podprzedziały
    # (Średnia wartości dla krańców podprzedziałów)
    (0...n).each do |i|
      x1 = a + i * dx
      x2 = x1 + dx
      sum += (x2 - x1) * (@func.call(x1) + @func.call(x2)) / 2.0
    end

    # Zwracamy sumę pól prostokątów
    sum
  end
  
  # Funkcja obliczająca przybliżoną wartość pochodnej
  def deriv(x)
    # Wartość przybliżenia
    h = 0.0001

    # Zwracamy przybliżenie pochodnej
    (@func.call(x + h) - @func.call(x)) / h
  end
end


# Testowanie klasy Function

# Definicja funkcji x^2 * sin(x)
f = Function.new { |x| x**2 * Math.sin(x) }

# Obliczenie wartości funkcji w punkcie x=0
puts "Obliczenie wartości funkcji w punkcie x=0"
puts f.value(0)

# Obliczenie wartości funkcji w punkcie x=1
puts "Obliczenie wartości funkcji w punkcie x=1"
puts f.value(1)

# Obliczenie miejsca zerowego w przedziale [-1, 1]
puts "Obliczenie miejsca zerowego w przedziale [-1, 1]"
puts f.zero(-1, 1, 0.0001)

# Obliczenie pola powierzchni między wykresem a osią OX w przedziale [0, Math::PI]
puts "Obliczenie pola powierzchni między wykresem a osią OX w przedziale [0, Math::PI]"
puts f.field(0, Math::PI)

# Obliczenie przybliżonej wartości pochodnej w punkcie x=2
puts "Obliczenie przybliżonej wartości pochodnej w punkcie x=2"
puts f.deriv(2)