# Zadanie 8 / Lista 3

- Inwersja - gdy trzeba zeswapować element dla posortowania.
- Dla zamiany $a_i$ i $a_n$ mamy $n-i+1$ inwersji

Poniżej przykładowy kod - ale jest to zwykły mergesort który tylko pamięta jedną dodatkową rzecz (którą modyfikuje w jednym przypadku łączenia)

## Algorytm


```py
def merge_sort(arr, left, right):
    inv_count = 0
    if left < right:
        mid = (left + right) // 2
        inv_count += merge_sort_and_count(arr, left, mid)
        inv_count += merge_sort_and_count(arr, mid + 1, right)
        inv_count += merge_and_count(arr, left, mid, right)
    return inv_count

def merge(arr, left, mid, right):
    left_half = arr[left:mid + 1]
    right_half = arr[mid + 1:right + 1]
    
    inv_count = 0
    i = j = 0
    k = left

    while i < len(left_half) and j < len(right_half):
        if left_half[i] <= right_half[j]:
            arr[k] = left_half[i]
            i += 1
        else:
            arr[k] = right_half[j]
            j += 1
            # n - i + 1
            inv_count += len(left_half) - i
        k += 1

    while i < len(left_half):
        arr[k] = left_half[i]
        i += 1
        k += 1

    while j < len(right_half):
        arr[k] = right_half[j]
        j += 1
        k += 1

    return inv_count
```