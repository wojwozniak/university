def Czebyszew(n, x):
    if n == 0:
        return 1
    if n == 1:
        return x
    if n % 2 == 0:
        half_pow = Czebyszew(n / 2, x)
        return half_pow * half_pow
    else:
        half_pow = Czebyszew((n - 1) / 2, x)
        return x * half_pow * half_pow