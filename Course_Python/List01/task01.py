from decimal import *

def vat_faktura(lista):
    suma = sum(lista)
    podatek = suma * 0.23
    return podatek

def vat_paragon(lista):
    podatek = sum([x * 0.23 for x in lista])
    return podatek

def vat_faktura_dec(lista):
    suma = sum(lista)
    podatek = suma * Decimal('0.23')
    return podatek

def vat_paragon_dec(lista):
    podatek = sum([x * Decimal('0.23') for x in lista])
    return podatek

zakupy = [100.0, 200.0, 50.0]
print(vat_faktura(zakupy) == vat_paragon(zakupy)) # True

zakupy = [0.1, 0.2, 0.3]
print(vat_faktura(zakupy) == vat_paragon(zakupy)) # False

zakupy = [Decimal('0.1'), Decimal('0.2'), Decimal('0.3')]
print(vat_faktura_dec(zakupy) == vat_paragon_dec(zakupy)) # True

# Klasa Decimal sprawia, że działania na ułamkach działają tak jak w rzeczywistości - dostajemy więc true
