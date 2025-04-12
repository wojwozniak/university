# Działanie programu "własnego języka"
- Zaczynamy w mainie -> wywołujemy lexing na wejściowym programie
- Lexer przekształca kod źródłowy na sekwencję tokenów, po czym przekazuje je do parsera
- Parser otrzymuje tokeny od lexera i buduje drzewo AST (składni abstrakcyjnej) na podstawie gramatyki języka
- AST jest wynikiem pracy parsera - zapisywana jest struktura programu w formie drzewa
- W mainie możemy dalej robić coś z AST - na przykład ewaluować

- dune jest wykorzystywany do zbudowania projektu