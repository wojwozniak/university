# Warsztaty 4

## Setup
### Komendy do setupu
- `ip link set enpxsy name CARDNAME`
- `ip link set up dev CARDNAME`
- `ip addr add IP dev CARDNAME`
- `ip route add DEST via ADDR`; DEST can be `default`

### Setup kart sieciowych
- enp0s3 dla sieci środkowej
- enp0s8 dla sieci z mniejszym numerem
- enp0s9 dla sieci z większym numerem

### V1
```
ip link set enp0s3 name enp-all

ip link set enp0s8 name enp-rem1
ip link set up dev enp-rem1
ip addr add 192.168.1.1/24 dev enp-rem1

ip link set enp0s9 name enp-rem4
ip link set up dev enp-rem4
ip addr add 192.168.4.1/24 dev enp-rem4

```

### V2
```
ip link set enp0s3 name enp-all

ip link set enp0s8 name enp-rem1
ip link set up dev enp-rem1
ip addr add 192.168.1.2/24 dev enp-rem1

ip link set enp0s9 name enp-rem2
ip link set up dev enp-rem2
ip addr add 192.168.2.2/24 dev enp-rem2
```

### V3

```
ip link set enp0s3 name enp-all

ip link set enp0s8 name enp-rem2
ip link set up dev enp-rem2
ip addr add 192.168.2.3/24 dev enp-rem2

ip link set enp0s9 name enp-rem3
ip link set up dev enp-rem3
ip addr add 192.168.3.3/24 dev enp-rem3
```


### V4

```
ip link set enp0s3 name enp-all

ip link set enp0s8 name enp-rem3
ip link set up dev enp-rem3
ip addr add 192.168.3.4/24 dev enp-rem3

ip link set enp0s9 name enp-rem4
ip link set up dev enp-rem4
ip addr add 192.168.4.4/24 dev enp-rem4
```

## Tutorial 1
### Default routes
1,2,3,4
```
ip route add default via 192.168.1.2
ip route add default via 192.168.2.3
ip route add default via 192.168.3.4
ip route add default via 192.168.4.1
```
### Poleceniem ping sprawdź, że z każdej maszyny osiągalne są są wszystkie interfejsy innych maszyn. Prześledź w Wiresharku ścieżki komunikatów ICMP echo request i ICMP echo reply. Czy zawsze suma tych ścieżek daje pełny cykl? Dlaczego?

Nie zawsze - jeśli np z V1 spingujemy adres V2 to nie użyjemy default tylko zwrócimy bezpośrednio do V1

### Traceroute odpowiedź z innego adresu

Nie widzę tego - zapytać?

### Usuń trasy domyślne

`ip route del default` na każdej