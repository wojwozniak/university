def konwersja(wyrażenie_infiksowe):
    stos_operatory = []
    wyrażenie_onp = []

    priorytety = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3}

    for element in wyrażenie_infiksowe:
        if isinstance(element, int):
            wyrażenie_onp.append(element)
        elif element == '(':
            stos_operatory.append(element)
        elif element == ')':
            while stos_operatory and stos_operatory[-1] != '(':
                wyrażenie_onp.append(stos_operatory.pop())
            stos_operatory.pop()
        else:
            while (stos_operatory and
                   priorytety.get(element, 0) <= priorytety.get(stos_operatory[-1], 0)):
                wyrażenie_onp.append(stos_operatory.pop())
            stos_operatory.append(element)
    while stos_operatory:
        wyrażenie_onp.append(stos_operatory.pop())

    return wyrażenie_onp


def oblicz(wyrażenie_onp):
    stos = []
    for element in wyrażenie_onp:
        if isinstance(element, int):
            stos.append(element)
        else:
            b = stos.pop()
            a = stos.pop()
            if element == '+':
                stos.append(a + b)
            elif element == '-':
                stos.append(a - b)
            elif element == '*':
                stos.append(a * b)
            elif element == '/':
                stos.append(a / b)
            elif element == '^':
                stos.append(a ** b)
    return stos[0]


wyrażenie_infiksowe = ['(', 2, '+', 3, ')', '*', 4]
wyrażenie_onp = konwersja(wyrażenie_infiksowe)
wynik = oblicz(wyrażenie_onp)

print("Wyrażenie w ONP:", wyrażenie_onp)
print("Wynik obliczeń:", wynik)