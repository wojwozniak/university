Zrobione na chalvirbian

# Setup

V1:
```
ip link set enp0s3 name enp-rem0
ip link set up dev enp-rem0
ip addr add 172.20.0.1/16 dev enp-rem0
```

V2:
```
ip link set enp0s3 name enp-rem0
ip link set up dev enp-rem0
ip addr add 172.20.0.2/16 dev enp-rem0

ip link set enp0s8 name enp-loc0
ip link set up dev enp-loc0
ip addr add 192.168.1.254/24 dev enp-loc0
```

V3:
```
ip link set enp0s3 name enp-loc0
ip link set up dev enp-loc0
ip addr add 192.168.1.1/24 dev enp-loc0
ip route add default via 192.168.1.254
```

I rzeczywiście się tak dzieje; wytłumaczenie takie same jak kiedyś -> V1 nie wie gdzie jest V3