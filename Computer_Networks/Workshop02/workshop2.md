# Tutorial 1
Z poprzedniej listy
- `ip link set up dev CARDNAME`
- `ip addr add IP dev CARDNAME`

I nowe

- `ip addr flush dev CARDNAME`

- ICMP -> wbudowany protokół diagnostyczny
- ARP -> pomocniczy protokół do kart MAC

# Wyzwanie

- Wszystkie komendy jak wcześniej

### Ostatnie pytanie wyzwania

Brak NAT -> V0 działa jako router między lokalnymi sieciami a internetem, ale nie ma skonfigurowanego NAT (Network Adress Translation)

```sh
apt install iptables
iptables -t nat -A POSTROUTING -o enp-ext -j MASQUERADE
```