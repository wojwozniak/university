def eliminator(list):
    lptr = 0
    midpoint = len(list) // 2
    rptr = midpoint
    counter = 0
    while (lptr < midpoint and rptr < len(list)):
        if (2 * list[lptr] <= list[rptr]):
            counter += 2
            lptr += 1
        rptr += 1
    return counter


# Test
list = [1, 2, 3, 4, 5, 6, 7]
print(eliminator(list))
