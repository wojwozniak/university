# Funkcja kompresująca tekst
def kompresja(tekst):
    skompresowany = []
    count = 1

    for i in range(1, len(tekst)):
        if tekst[i] == tekst[i - 1]:
            count += 1
        else:
            skompresowany.append((count, tekst[i - 1]))
            count = 1

    skompresowany.append((count, tekst[-1]))
    return skompresowany


# Funkcja dekompresująca tekst skompresowany
def dekompresja(tekst_skompresowany):
    tekst = ""
    for (count, char) in tekst_skompresowany:
        tekst += char * count
    return tekst

# Testy
print("Test 1: tekst 'suuuuper'")
txt1 = "suuuuper"
cmp1 = kompresja(txt1)
print(cmp1)
dmp1 = dekompresja(cmp1)
print(dmp1)

print("Test 2: tekst 'Test kompresowania tekstu.'")
txt2 = "Test kompresowania tekstu."
cmp2 = kompresja(txt2)
print(cmp2)
dmp2 = dekompresja(cmp2)
print(dmp2)