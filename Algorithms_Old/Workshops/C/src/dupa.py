n = 5000
p = 100
m = 1000000
print(f"{n} {p} {m}")
for i in range(p):
    for _ in range(3):
        row = ['.'] * 3
        row[i % 3] = 'x'
        print("".join(row))