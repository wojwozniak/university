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
        return x3
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
    # Ilość podziałów przedziału
    n = 1000
    # Szerokość podprzedziału
    width = (b - a).to_f / n
    # Suma pól podprzedziałów
    sum = 0.0
    # Wartość funkcji w punkcie a
    x = a

    # Obliczamy sumę pól podprzedziałów
    n.times do
      height = @func.call(x)
      sum += height * width
      x += width
    end

    # Zwracamy sumę pól podprzedziałów
    return sum
  end
  
  # Funkcja obliczająca przybliżoną wartość pochodnej
  def deriv(x)
    # Wartość przybliżenia
    h = 0.0001

    # Zwracamy przybliżenie pochodnej
    (@func.call(x + h) - @func.call(x)) / h
  end
end


/ Testowanie klasy Function /

# Definicja funkcji x^2 
f = Function.new { |x| x**2 }

# Obliczenie wartości funkcji w punkcie x=0
puts "Obliczenie wartości funkcji w punkcie x=0"
puts "Oczekiwany output: '0'"
puts f.value(0)

# Obliczenie wartości funkcji w punkcie x=1
puts "Obliczenie wartości funkcji w punkcie x=1"
puts "Oczekiwany output: '1'"
puts f.value(1)

# Obliczenie miejsca zerowego w przedziale [-1, 1]
puts "Obliczenie miejsca zerowego w przedziale [-1, 1]"
puts "Oczekiwany output: '0'"
puts f.zero(-1, 1, 0.0001)

# Obliczenie pola powierzchni między wykresem a osią OX w przedziale [0, 4]
puts "Obliczenie pola powierzchni między wykresem a osią OX w przedziale [0, 4]"
puts "Oczekiwany output: ~'21,3'"
puts f.field(0, 4)

# Obliczenie przybliżonej wartości pochodnej w punkcie x=2
puts "Obliczenie przybliżonej wartości pochodnej w punkcie x=2"
puts "Oczekiwany output: ~'4'"
puts f.deriv(2)