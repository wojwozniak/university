# Symulator maszyny RAM

Projekt końcowy - wstęp do C sem. zimowy 2022/23

Link podany w opisie projektu nie działa, skorzystałem więc z [tego](http://www.math.uni.wroc.pl/~msliw/RAMopis.pdf) opisu.

Wykorzystuję głównie listy dwukierunkowe. Możnaby bez problemu wykorzystać jednokierunkowe listy - uznałem jednak, że bardziej logicznie pasują dwukierunkowe.

## Założenia:
- Nietknięte wcześniej komórki mają wartość 0
- Operacje na oddalonych komórkach inicjalizują wszystkie komórki po drodze (symuluję że jest to taśma, musi przejść przez maszynę)
- Pozwalam operacji WRITE wybranie w której komórce zapisać output
- Plik inputu - liczby calkowite oddzielone enterem

## Kod dzieli się on na kilka głównych części
- Główne menu (main)
- Funkcje pomocnicze menu (w tym wczytywanie / zapisywanie do plików) (menu)
- Silnik (zawiera wskaźniki na taśmy wejścia, wyjścia i poleceń) (engine)
- Taśmy (głównie taśma poleceń, taśmy wejścia/wyjścia) (exe)
- Pamięć (akumulator) (memory)
