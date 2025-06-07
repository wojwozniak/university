## Tutorial 1

```
ip link set enp0s3 name enp0
ip link set up dev enp0
ip addr add 10.0.0.i/8 dev enp0
```

```
nano /etc/hosts
10.0.0.1 mail.example.com
```

Po założeniu konta nie działało - klinięcie retest, zmiana na imap, 
zmiana z powrotem na pop3 i kolejne zapisanie naprawiło.

I trzeba usunąć leading dots


### Wysyłanie maila

```
telnet mail.example.com 25


HELO virbian2.example.com


MAIL FROM: <student2@mail.example.com>


RCPT TO: <student3@mail.example.com>


DATA


From: student2@mail.example.com
To: student3@mail.example.com
Subject: Test 

Test2
.


QUIT
```

Po zmianie ustawień na szyfrowanie u mnie konieczny restart thunderbirda

Wyslij maila thunderbirdem - bo tam setup szyfrowania

a pozniej komenda

```
openssl s_client -quiet -connect mail.example.com:25 -starttls smtp
```
i jeszcze raz mail jak wyzej. komenda stad bo ofc encoding popsuty w pdfie

## Tutorial 2

haslo: `abc`

pobierz, cd into downloads

jesli pobierzesz jednak z domyslna nazwa to:

```
mv VeraCrypt-1.26.24-x86_64.AppImage veracrypt.deb
mv VeraCrypt-1.26.24-x86_64.AppImage.sig veracrypt.deb.sig
```

to naprawi.

`gpg --verify veracrypt.deb.sig veracrypt.deb`

`gpg --recv-keys 5069A233D55A0EEB174A5FC3821ACD02680D16DE`

## Challenge 1

flagi przy szyfrowaniu to ascii, recipent, sign&encrypt (moga byc chyba osobno?)

reszta dokladnie jak napisane (tylko podkreslnik zle zenkodowany w ostatnim 
poleceniu, dodaj go recznie)


Rozwiazania T1, T2, C1 kompatybilne, wiec zapisane wszystko na V1, V2, V3