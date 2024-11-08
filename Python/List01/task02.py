def is_palindrom(text):
    # 97-122 ASCII a-z
    reworked = ''.join(c.lower() for c in text if 97 <= ord(c.lower()) <= 122)
    return reworked == reworked[::-1]


# Testy
print(is_palindrom("Eine güldne, gute Tugend: Lüge nie!"))
print(is_palindrom("Míč omočím."))
print(is_palindrom("Kobyła ma mały bok."))