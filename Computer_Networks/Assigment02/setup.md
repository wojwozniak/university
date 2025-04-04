# Setup

## Dla każdego
```
C:\Users\wozni\Desktop\C\Uni\Computer_Networks\Assigment02\solution

mkdir folder

sudo mount -t vboxsf solution folder
```

- `ip link set enpxsy name CARDNAME`
- `ip link set up dev CARDNAME`
- `ip addr add IP dev CARDNAME`
- `ip route add DEST via ADDR`; DEST can be `default`

## Sieci
- local0 - 172.16.0.0/16
- local1 - 192.168.2.0/24
- local2 - 10.0.0.0/8
- local3 - 192.168.5.0/24

### A: local0

```
ip link set enp0s3 name enp-rem0
ip link set up dev enp-rem0
ip addr add 172.16.1.13/16 dev enp-rem0

nano /etc/frr/daemons
systemctl start frr
vtysh
configure terminal
router rip
version 2
network 172.16.0.0/16
exit
exit
show running-config
copy running-config startup-config
exit

cd folder
./router 1 172.16.0.0/16 distance 4
```

### B: local0 local1 local2

```
ip link set enp0s3 name enp-rem0
ip link set up dev enp-rem0
ip addr add 172.16.1.14/16 dev enp-rem0

ip link set enp0s8 name enp-rem1
ip link set up dev enp-rem1
ip addr add 192.168.2.10/24 dev enp-rem1

ip link set enp0s9 name enp-rem2
ip link set up dev enp-rem2
ip addr add 10.0.1.2/8 dev enp-rem2

nano /etc/frr/daemons
systemctl start frr
vtysh
configure terminal
router rip
version 2
network 172.16.0.0/16
network 192.168.2.0/24
network 10.0.0.0/8
exit
exit
show running-config
copy running-config startup-config
exit

cd folder
./router 3 172.16.0.0/16 distance 4 192.168.2.0/24 distance 2 10.0.0.8/8 distance 3
```

### C: local1 local3

```
ip link set enp0s3 name enp-rem1
ip link set up dev enp-rem1
ip addr add 192.168.2.5/24 dev enp-rem1

ip link set enp0s8 name enp-rem3
ip link set up dev enp-rem3
ip addr add 192.168.5.5/24 dev enp-rem3

nano /etc/frr/daemons
systemctl start frr
vtysh
configure terminal
router rip
version 2
network 192.168.2.0/24
network 192.168.5.0/24
exit
exit
show running-config
copy running-config startup-config
exit

cd folder
./router 2 192.168.2.0/24 distance 2 192.168.5.0/24 distance 2
```

### D: local2 local3

```
ip link set enp0s3 name enp-rem2
ip link set up dev enp-rem2
ip addr add 10.0.1.1/8 dev enp-rem2

ip link set enp0s8 name enp-rem3
ip link set up dev enp-rem3
ip addr add 192.168.5.43/24 dev enp-rem3

nano /etc/frr/daemons
systemctl start frr
vtysh
configure terminal
router rip
version 2
network 192.168.5.0/24
network 10.0.0.0/8
exit
exit
show running-config
copy running-config startup-config
exit

cd folder
./router 2 10.0.0.0/8 distance 3 192.168.5.0/24 distance 2
```
