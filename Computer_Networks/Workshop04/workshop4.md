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

## Tutorial 2

```
nano /etc/frr/daemons
systemctl start frr
vtysh
show ip route
configure terminal
router ospf
```

### dla V1
```
network 192.168.1.0/24 area 0
network 192.168.4.0/24 area 0
```

### dla V2
```
network 192.168.1.0/24 area 0
network 192.168.2.0/24 area 0
```

### dla V3
```
network 192.168.2.0/24 area 0
network 192.168.3.0/24 area 0
```

### dla V4
```
network 192.168.3.0/24 area 0
network 192.168.4.0/24 area 0
```

```
end
end
show running-config
copy running-config startup-config
```

### Czy OSPF korzysta z warstwy transportowej czy jest bezpośrednio w pakietach IP?

Bezpośrednio w pakietach IP


### Włącz enp-all, przypisz mu adresy, uruchom OSPF dla tej sieci
all

```
ip link set up dev enp-all
```
1-4
```
ip addr add 172.16.16.1/24 dev enp-all
ip addr add 172.16.16.2/24 dev enp-all
ip addr add 172.16.16.3/24 dev enp-all
ip addr add 172.16.16.4/24 dev enp-all
```
all in vtysh
```
configure terminal
router ospf
network 172.16.0.0/16 area 0
end
end
show running-config
copy running-config startup-config
```

### Ścieżka o długości 3
- Wyłączamy enp-all i enp-rem4 w V1
- Wyłączamy enp-all w V2
- sprawdzamy z V1 192.168.3.0

Ścieżki o długości 4 nie da się uzyskać, trzebaby przejść przez jakiś router 2 razy a ospf tego nie zrobi

Jednak sie da:
- V2 rem2
- V3 rem2
- V4 all
- V1 all rem4
- i z 1 ping 4

## Challenge

CV0:
```
ip link set enp0s3 name enp-ext
dhclient -v enp0s3

ip link set enp0s8 name enp-add1
ip link set up dev enp-add1
ip addr add 192.168.0.1/24 dev enp-add1

ip link set enp0s9 name enp-loc1
ip link set up dev enp-loc1
ip addr add 172.18.0.1/16 dev enp-loc1
```

CV1:
```
ip link set enp0s3 name enp-loc1
ip link set up dev enp-loc1
ip addr add 172.18.0.2/16 dev enp-loc1
```

CV2:
```
ip link set enp0s3 name enp-add1
ip link set up dev enp-add1
ip addr add 192.168.0.2/24 dev enp-add1
```

### Sprawdź uzyskany adres

10.0.2.15

### Ustaw domyślną dla V1 przez V0

`ip route add default via 172.18.0.1`

### Co się będzie działo przy pingowaniu 8.8.8.8 / V2?

V2 możemy spingować, 8.8.8.8 nie przez brak NAT

### Konfiguracja NAT

Błąd w komendzie (chyba, u mnie ta z poradnika nie działała)

```
nft add table ip my_table

nft add chain ip my_table my_rules \
{type nat hook postrouting priority srcnat\; }

nft add rule ip my_table my_rules ip saddr 172.18.0.0/16 snat to 10.0.2.15
```

### Ostatnie pytanie

Teraz nie dostaniemy odpowiedzi od V2. Wszystko jest routowane przez 10.0.2.15