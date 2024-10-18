from abc import ABC, abstractmethod


class IShape(ABC):
    @abstractmethod
    def calculate_area(self):
        pass


class Rectangle(IShape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def calculate_area(self):
        return self.width * self.height


class Square(IShape):
    def __init__(self, side_length):
        self.side_length = side_length

    def calculate_area(self):
        return self.side_length * self.side_length


class AreaCalculator:
    def calculate_area(self, shape):
        return shape.calculate_area()


w, h = 4, 5
rect = Rectangle(w, h)
calc = AreaCalculator()
print("prostokąt o wymiarach", w, "na", h,
      "ma pole", calc.calculate_area(rect))

# Przerobiony kod - kwadrat nie dziedziczy z prostokątu (bo ma specjalną własność)
# Zamiast tego obydwa dziedziczą z IShape, która wymusza implementację metody calculate_area
# Dzięki temu możemy użyć AreaCalculator.calculate_area dla obu obiektów
