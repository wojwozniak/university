# Wyzwanie #1

Krok po kroku potrzebne komendy -> każda jest w tutorialu razem z opisem

### Utwórz dodatkową maszynę wirtualną Virbian2. Podłącz karty sieciowe Adapter1 maszyn Virbian1 i Virbian2 do wirtualnej sieci local1 i następnie uruchom obie maszyny.
Basic setup jak w tutorialu
###  Aktywuj karty sieciowe w obu urządzeniach poleceniem ip i sprawdź stan warstwy fizycznej kart poleceniem ethtool.
Na obu:
- VN>: `sudo ip link set up dev enp0s3`
- VN>: `ethtool enp0s3`
### Karcie sieciowej maszyny Virbian1 przypisz adres IP równy 192.168.100.1, zaś karcie maszyny Virbian2 adres 192.168.100.2. Pamiętaj o masce podsieci /24.
- V1>: `sudo ip addr add 192.168.100.1/24 dev enp0s3`
- V2>: `sudo ip addr add 192.168.100.2/24 dev enp0s3`
### Poleceniem ping sprawdź, czy jedna maszyna jest osiągalna z drugiej. Jaki jest RTT? Obejrzyj przesyłane pakiety Wiresharkiem. Wskaż w pakiecie miejsce w którym przechowywany jest źródłowy i docelowy adres IP.
- V1>: Uruchom wireshark, any
- V1>: `ping 192.168.100.2`, po paru sekundach zatrzymaj
- RTT ~1ms, Źródłowy i docelowy IP w "Internet Protocol Version"
### Wykorzystaj program iperf3, żeby zbadać przepustowość połączenia między maszynami.
- V2>: `sudo iperf3 -s`
- V1>: `sudo iperf3 -c 192.168.0.2` 
### Z maszyny Virbian1 połącz się z serwerem echa maszyny Virbian2. Zaobserwuj przesyłane pakiety w Wiresharkach uruchomionych jednocześnie na obu maszynach.
- V1>: `sudo telnet 192.168.100.2 7`
- Uruchom wiresharki na any na obydwóch maszynach
- V1>: `dowolny tekst`
- Zobaczymy w obydwu wiresharkach ECHO z wysłanym tekstem w formacie hexadecymalnym
### Zdekonfiguruj karty sieciowe obu maszyn i wyłącz wirtualne maszyny.
Na obydwu:
- VN>: `ip addr flush dev enp0s3`
- VN>: `ip link set down dev enp0s3`