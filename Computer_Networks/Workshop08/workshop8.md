Zrobione na chalvirbian

# Setup

V2 i V3 uruchom nie jako sudo! Inaczej telnet będzie chciał się łączyć z rootem i jest złe hasło

V1:
```
ip link set enp0s3 name enp-rem0
ip link set up dev enp-rem0
ip addr add 172.20.0.1/16 dev enp-rem0
```

V2:
```
sudo ip link set enp0s3 name enp-rem0
sudo ip link set up dev enp-rem0
sudo ip addr add 172.20.0.2/16 dev enp-rem0

sudo ip link set enp0s8 name enp-loc0
sudo ip link set up dev enp-loc0
sudo ip addr add 192.168.1.254/24 dev enp-loc0
```

V3:
```
sudo ip link set enp0s3 name enp-loc0
sudo ip link set up dev enp-loc0
sudo ip addr add 192.168.1.1/24 dev enp-loc0
sudo ip route add default via 192.168.1.254
```

I rzeczywiście się tak dzieje; wytłumaczenie takie same jak kiedyś -> V1 nie wie gdzie jest V3

# Tutorial 1

Wszystkie komendy z sudo

Nie jesteśmy w stanie podejrzeć danych bo zaszyfrowane

Przerywanie telneta: `~.`

Podglądanie plików dziwnie działa

`scp .ssh/id_rsa.pub 192.168.1.254:keyfile`

I dalej coś dziwnie się dzieje ale też działa

# Tutorial 2

Update 1
```
#!/usr/sbin/nft -f
flush ruleset
table inet my_table {
    chain my_input_rules {
        type filter hook input priority filter;
        log
        drop
    }
    chain my_forward_rules {
        type filter hook forward priority filter;
        log
        drop
    }
    chain my_output_rules {
        type filter hook output priority filter;
        accept
    }
}
```
Update 2 -> zawartość my_input_rules -> jedna linijka (druga)

```
chain my_input_rules {
    type filter hook input priority filter;
    ct state established,related accept
    log
    drop
}
```
Update 3 (linijki 3,4)

```
chain my_input_rules {
    type filter hook input priority filter;
    ct state established,related accept
    iif lo accept
    ip protocol icmp icmp type echo-request accept
    log
    drop
}
```
Update 4 (linijka 5)

```
chain my_input_rules {
    type filter hook input priority filter;
    ct state established,related accept
    iif lo accept
    ip protocol icmp icmp type echo-request accept
    ct state new tcp dport 22 accept
    log
    drop
}
```