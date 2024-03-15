# Zadanie 6 / Lista 3

## Treść

Wytłumaczyć różnicę między SRP a ISP

## Odpowiedź

SRP (Single Responsibility Principle) - zasada jednej odpowiedzialności, mówi o tym, że klasa powinna mieć tylko jedną odpowiedzialność.

ISP (Interface Segregation Principle) - klient nie powinien być zmuszony do implementacji interfejsów, których nie używa.

## Rozwiązanie na przykładzie

Mamy klasę Car:

- SRP zmusza nas, byśmy nie trzymali zmiany kierunku w Car - ono tylko rusza lub się zatrzymuje (ruch)
- ISP zmusza nas, żebyśmy nie musieli implementować zatrzymaj, jeśli to auto do crash testów więc zatrzyma się na ścianie