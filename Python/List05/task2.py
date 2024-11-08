# Ogólna klasa, z której dziedziczyć będą wszystkie pozostałe
class Formula:
    # Oblicz, str i tautologii nie implementujemy - dodamy je do każdej klasy dziedziczącej
    def oblicz(self, zmienne):
        pass

    def __str__(self):
        pass
    
    def tautologia(self):
        pass

    # dla + oraz * będziemy zwracać odpowiednio Or albo And
    def __add__(self, other):
        return Or(self, other)

    def __mul__(self, other):
        return And(self, other)


# Klasa definiująca zmienną
class Zmienna(Formula):
    # Zawsze domagamy się nazwy
    def __init__(self, nazwa):
        self.nazwa = nazwa

    # Obliczenie zmiennej === zwrócenie jej wartości
    def oblicz(self, zmienne):
        if self.nazwa in zmienne:
            return zmienne[self.nazwa]
        else:
            raise BrakPrzypisaniaError(f'Zmienna "{self.nazwa}" nie ma przypisanej wartości.')

    def __str__(self):
        return self.nazwa

    # Zmienna nie może być tautologią
    def tautologia(self):
        return False


# Klasa stałej, podobna do zmiennej
class Stala(Formula):
    def __init__(self, wartosc):
        self.wartosc = wartosc

    def oblicz(self, zmienne):
        return self.wartosc

    def __str__(self):
        return str(self.wartosc)

    def tautologia(self):
        return self.wartosc

# Definicje Not, Or, And
class Not(Formula):
    def __init__(self, formula):
        self.formula = formula

    def oblicz(self, zmienne):
        return not self.formula.oblicz(zmienne)

    def __str__(self):
        return f'¬{self.formula}'

    def tautologia(self):
        return not self.formula.tautologia()


class Or(Formula):
    def __init__(self, formula1, formula2):
        self.formula1 = formula1
        self.formula2 = formula2

    def oblicz(self, zmienne):
        return self.formula1.oblicz(zmienne) or self.formula2.oblicz(zmienne)

    def __str__(self):
        return f'({self.formula1} ∨ {self.formula2})'

    def tautologia(self):
        return self.formula1.tautologia() or self.formula2.tautologia()


class And(Formula):
    def __init__(self, formula1, formula2):
        self.formula1 = formula1
        self.formula2 = formula2

    def oblicz(self, zmienne):
        return self.formula1.oblicz(zmienne) and self.formula2.oblicz(zmienne)

    def __str__(self):
        return f'({self.formula1} ∧ {self.formula2})'

    def tautologia(self):
        return self.formula1.tautologia() and self.formula2.tautologia()


# Klasa implikacji - zaimplementowana za pomocą tw. de Morgana poznanego na logice
class Implies(Formula):
    def __init__(self, formula1, formula2):
        self.formula1 = formula1
        self.formula2 = formula2

    def oblicz(self, zmienne):
        # a => b jest równoważne (-,a ∨ b)
        return Or(Not(self.formula1), self.formula2).oblicz(zmienne)

    def __str__(self):
        return f'({self.formula1} => {self.formula2})'

    def tautologia(self):
        return Or(Not(self.formula1), self.formula2).tautologia()

# Inne moznaby implementować w ten sam sposób


# Jeszcze definicja bledu
class BrakPrzypisaniaError(Exception):
    pass


# Testy


# Proste zmienne
x = Zmienna("x")
y = Zmienna("y")
true = Stala(True)
false = Stala(False)

# Testujemy czy __mul__ dziala
f21 = x * y
print(f21)

# Zlozone formuly
f1 = And(x, y)
f2 = Or(Not(x), true)

# Wypisanie jako string
print(f'f1 jako string: {f1}')
print(f'f2 jako string: {f2}')

# Obliczanie wartości
zmienne = {"x": True, "y": False}
r1 = f1.oblicz(zmienne)
r2 = f2.oblicz(zmienne)
print(f'Wartość f1: {r1}')
print(f'Wartość f2: {r2}')

# Sprawdzanie tautologii
t1 = f1.tautologia()
t2 = f2.tautologia()
print(f'f1 jest tautologią: {t1}')
print(f'f2 jest tautologią: {t2}')
