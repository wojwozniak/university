# Zadanie 1 / Lista 5

Rozważmy gramatykę nad alfabetem (zbiorem symboli terminalnych) złożonym z nawiasów otwierających i zamykających (Σ = {(,)}) oraz ze zbiorem produkcji:
`P = {S → (S)S, S → (S, S → ϵ}`
Jak można opisać język generowany przez tą gramatykę? Pokaż, że gramatyka ta jest niejednoznaczna. Następnie zaproponuj jednoznaczną gramatykę generującą ten sam język.
Kontekst: gramatyka ta jest związana z problemem parsowania konstrukcji w językach programowania, które dopuszczają konstrukcje postaci if (E) S oraz if (E) S else S.

## Opis

Jest to zbiór nawiasów, gdzie otwierających będzie co najwyżej tyle samo co zamykających.

## Niejednoznaczność

`S -> (S -> ((S)S -> (()`

`S -> (S)S -> ((S)S -> (()`

## Jednoznaczna gramatyka generująca ten sam język

Chyba działa taka:

- S -> (S T
- S -> E
- T-> )S
- T -> E