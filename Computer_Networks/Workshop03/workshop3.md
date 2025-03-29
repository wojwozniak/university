# Warsztaty 3

## Komendy do setupu
- `ip link set enpxsy name CARDNAME`
- `ip link set up dev CARDNAME`
- `ip addr add IP dev CARDNAME`
- `ip route add DEST via ADDR`; DEST can be `default`

- Pytanie z setupu - dostaję odpowiedzi od 192.168.1.2 - jest to default dla maszyny z której pinguję, więc to do niej idzie pakiet i to ona nie wie gdzie wysłać dalej.

## Tutorial 1
- Na 3 trzeba powtórzyć wszystko od edycji pliku
- Połączone bezpośrednio odległość 1, inne 2
- RIP dajemy adresy sieci do których mamy bezpośredni dostęp (z maską)
- Osiągalne jest wszystko poza `192.168.3.3` (z 1) - tutaj pomoże iptables ogarnięte jak w wyzwaniu warsztatu 2

## Tutorial 2
- Tu wszystko jak w poradniku i logicznie

## Wyzwanie 1
- enp0s3, enp0s8, enp0s9
- chalvirbian ustawiane po kolei, im mniejszy `i` sieci tym mniejszy `i` w nazwie karty
- Każda maszyna dostaje adres w każdej sieci (też lecąc po kolei dla wygody)
- Od teraz musi być robione na `startx`
- Na każdej maszynie 2-4:
  - `nano /etc/frr/daemons` - zmiana ripd na `yes`
  - `systemctl start frr`
  - `vtysh`
  - `configure terminal`
  - `router rip`
  - `version 2`
  - `network NETWORK/MASK` - dla każdej sieci z tej maszyny
  - `no network NETWORK/MASK` - w razie pomyłki
  - `exit`
  - `exit`
  - `show running-config`
  - `copy running-config startup-config`
  - `exit`

- `show ip rip` - wyświetli zbudowane tablice routingu

Po tym konfigu wszystko działa. traceroute bez opcji `-I` ładnie pokazuje trasy (w tym pingując z 1/5 maszynę 3 możemy ztraceroutować dwa różne adresy i dojść różnymi ścieżkami do 3).