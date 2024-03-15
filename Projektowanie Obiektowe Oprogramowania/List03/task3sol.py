# Zad 3 / Lista 3 - w pliku task3 jest treść i bazowy kod,
# w task3sol.cs poprawiona wersja
# a tutaj kompilowalna wersja w Pythonie
class TaxCalculator:
    def calculate_tax(self, price, vat_rate):
        return price * vat_rate


class Item:
    def __init__(self, name="", price=0):
        self._name = name
        self._price = price
        self._vat_rate = 0.22

    @property
    def price(self):
        return self._price

    @property
    def name(self):
        return self._name

    @property
    def vat_rate(self):
        return self._vat_rate

    @vat_rate.setter
    def vat_rate(self, value):
        self._vat_rate = value


class CashRegister:
    def __init__(self):
        self.tax_calc = TaxCalculator()

    def calculate_price(self, items):
        total_price = 0
        for item in items:
            total_price += item.price + \
                self.tax_calc.calculate_tax(item.price, item.vat_rate)
        return total_price

    def print_bill(self, items, sort=False, property=None):
        if sort and property is not None and items.__len__() > 1:
            items.sort(key=lambda x: getattr(x, property))

        for item in items:
            print(
                f"towar {item.name} : cena {item.price} + podatek {self.tax_calc.calculate_tax(item.price, item.vat_rate)}")


# Przykładowe rozszerzenie - zmiana wartości vatu

item = Item(name="Kawa", price=10.0)
item.vat_rate = 0.23
Items = [item]

# Użycie
cr = CashRegister()
cr.calculate_price(Items)
cr.print_bill(Items)


# Użycie
Items = [Item(name="Kawa", price=10.0), Item(name="Herbata", price=5.0)]
cr.print_bill(Items, True, "price")
