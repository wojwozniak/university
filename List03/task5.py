# Prosty sliding window
def max_sublist_sum(lista):
    if not lista:
        return None

    max_sum = lista[0]
    current_sum = lista[0]
    start = 0
    max_range = (0, 0)

    for i in range(1, len(lista)):
        if lista[i] > current_sum + lista[i]:
            current_sum = lista[i]
            start = i
        else:
            current_sum += lista[i]

        if current_sum > max_sum:
            max_sum = current_sum
            max_range = (start, i)

    return max_range

# Przykładowe użycie:
lista = [1, -2, 3, 4, -5, 6, 7, -8, 7]
wynik = max_sublist_sum(lista)

print("Największa suma podlisty znajduje się między indeksami:", wynik)