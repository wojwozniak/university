# Warsztaty 5

## Tutorial 1

- DHCP Discover - `0.0.0.0 -> 255.255.255.255`, UDP port 67 - wysyłamy adres MAC interfejsu i prośbę o konfigurację
- DHCP Request - jw, prośba o adres `10.0.2.15`
- DHCP Offer - oferta adresu `10.0.2.15` od `10.0.2.2`
- DHCP ACK (Acknowledgement) - potwierdzenie przydzielenia od serwera


I na zwrot

- DHCP Release - zwolnienie adresu

## Tutorial 2

```
ip link set enp0s3 name enp0
ip link set up dev enp0

ip addr add 192.168.0.1/24 dev enp0

ip addr add 192.168.0.2/24 dev enp0
```

### Pakiety

- Destination i source to odpowiednie adresy MAC
- W przypadku pingu na broadcast (z flagą -b) wysyłamy na MAC broadcast `ff:ff:ff:ff:ff:ff`


### ip neigh

- Obydwa virbiany mają po wpisie
- Flush je usuwa
- Nowy ping wymusi nowe przypisanie -> request o informację -> ARP na broadcast
- Zmienia się na REACHABLE -> bo pytaliśmy niedawno

### Co jest w pakietach?
- Dane z warstwy 2 (łącza danych)
- Dane można obejrzeć -> ładnie opisane w wiresharku

### Czy zapytania ARP są wysyłane do konkretnego komputera czy na adres rozgłoszeniowy?
- Na broadcast gdy nie mamy sąsiadów -> jeśli mamy to do sąsiada

### Czy odpowiedzi ARP są wysyłane do konkretnego komputera czy na adres rozgłoszeniowy?
- Do konkretnego, pytającego się

## Tutorial 3

Komendy osobno bo inaczej coś się psuje

```
ip addr del 192.168.0.2/24 dev enp0
ip addr add 192.168.0.123/24 dev enp0
```

Opis co się dzieje jest w zadaniu


## Wyzwanie

Robimy setup zgodnie z opisem, pamiętając o UP (bo inaczej tak samo się buguje/blokuje)

### Główne pytanie

#### Jaka jest sugerowana przez V2 zmiana tablicy routingu V1?
- Zmiana default (lub do tej sieci?) na routing bezpośrednio przez 192.168.1.3

#### Dlaczego taka zmiana ma sens?
- Skracamy ścieżkę -> Zamiast przez kilka routerów w tej samej sieci wysyłamy tylko przez 2

#### W jaki sposób V2 mogła wykryć ten problem?

Wysyła od V1 przez V3 -> wie że obydwa są w tej samej sieci, więc mogą komunikować się bezpośrednio