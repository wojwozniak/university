### Setup
- `ip link set enp0s3 name enp0`

### Tutorial 1
- 192.168.5.1

Pakiety 1–3: to klasyczne trzyetapowe nawiązywanie połączenia TCP (SYN, SYN-ACK, ACK)

Pakiet 4: żądanie HTTP (GET) — zawiera dane, zaczyna się od bajtu 1

Pakiet 5: potwierdzenie odebrania HTTP request (Ack=127)

Pakiet 6: odpowiedź HTTP (574 bajty payload)

Pakiet 7: potwierdzenie odbioru odpowiedzi HTTP

Pakiety 8–11: zamknięcie połączenia (FIN, ACK, FIN, ACK)

### Tutorial 2

Po prostu lecimy jak napisane, wszystko widać

### Tutorial 3

Szukany datagram zaczyna się od 03 77 a kończy na 6c 00