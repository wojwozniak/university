package List04;

import obliczenia.*;
import obliczenia.dzialania.*;
import obliczenia.operandy.*;
import struktury.*;

public class task4 {
    Wyrazenie w = new Dodawanie(
            new Liczba(7.2),
            new Mnożenie(
                    new Zmienna("x"),
                    new Liczba(2.4)));

    w.ToString();
}
