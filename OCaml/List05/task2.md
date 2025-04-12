# Zadanie 2 / Lista 5
Zaproponuj wyrażenia regularne definiujące następujące języki nad alfabetem
Σ = {0, 1}:
- Wszystkie słowa, w których po wystąpieniu jedynki nie występują żadne zera.
- Wszystkie słowa postaci jak w poprzednim podpunkcie, ale zawierające
co najmniej jedną jedynkę oraz co najmniej jedno zero.
- Dopełnienie języka z poprzedniego podpunktu, tzn. wszystkie słowa nie będące postaci jak w poprzednim podpunkcie.
- Wszystkie słowa zawierajace parzystą liczbę zer i dowolną liczbę jedynek.
- Wszystkie słowa w których nie występują dwie następujące po sobie jedynki, tzn. podciągi postaci 11.

### Wszystkie słowa, w których po wystąpieniu jedynki nie występują żadne zera.

- `/0*1*/`
- gwiazdka to 0 lub więcej powtórzeń poprzedniego symbolu

### Wszystkie słowa postaci jak w poprzednim podpunkcie, ale zawierające co najmniej jedną jedynkę oraz co najmniej jedno zero.

- `/0+1+/`
- + to 1 lub więcej powtórzeń

### Dopełnienie języka z poprzedniego podpunktu, tzn. wszystkie słowa nie będące postaci jak w poprzednim podpunkcie
- Chcemy ciągi samych zer, ciągi samych jedynek, i wszystkie wyrazy w których jedynka występuje po zerze
- `/0* | 1* | (0|1)*0(0|1)*1(0|1)*/`
- | to or; () grupują by zastosować * dla większej ilości znaków
- Najpiew sprawdzamy dla ciągów jednych znaków
- (0|1)* oznacza dowolną ilość zer lub jedynek w ciągu - każde słowo tego alfabetu
- więc trzecia cześć bierze dowolne słowa w których jest conajmniej jedna jedynka za zerem.

### Wszystkie słowa zawierajace parzystą liczbę zer i dowolną liczbę jedynek
- `/(1*01*01*)*1*/`
- Czyli dowolna ilość ciągów jedynek w których jest parzysta ilość zer

### Wszystkie słowa w których nie występują dwie następujące po sobie jedynki, tzn. podciągi postaci 11.
- `/(0 | 10)*1?/`