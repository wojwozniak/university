// Klasa implementująca zbiór za pomocą tablicy
public class ZbiorTablicowy implements Zbior, Cloneable {

    // Implementacja zbioru za pomocą tablicy
    private Para[] zbiór;
    private int zapełnienie;
    
    // Konstruktor tworzący zbiór o podanym rozmiarze
    // Przechowujemy zapełnienie
    public ZbiorTablicowy(int rozmiar) {
        zbiór = new Para[rozmiar];
        zapełnienie = 0;
    }

    // Implementacja wyszukania
    @Override
    public Para szukaj(String k) {
        for (int i = 0; i < zapełnienie; i++) {
            if (zbiór[i].klucz.equals(k)) {
                return zbiór[i];
            }
        }
        return null;
    }

    // Wstawianie - jeśli zbiór jest przepełniony to IllegalStateException
    @Override
    public void wstaw(Para p) {
        if (zapełnienie == zbiór.length) {
            throw new IllegalStateException("Zbiór jest pełny");
        }

        boolean f = false;
        for (int i = 0; i < zapełnienie; i++) {
            if (zbiór[i].klucz.equals(p.klucz)) {
                zbiór[i] = p;
                f = true;
                break;
            }
        }

        if (!f) {
            zbiór[zapełnienie++] = p;
        }
    }

    // Usuwanie
    @Override
    public void usuń(String k) {
        for (int i = 0; i < zapełnienie; i++) {
            if (zbiór[i].klucz.equals(k)) {
                zbiór[i] = zbiór[zapełnienie - 1];
                zbiór[zapełnienie - 1] = null;
                zapełnienie--;
                break;
            }
        }
    }
    
    /// Nadpisanie wszystkich poar
    @Override
    public void czysc() {
        for (int i = 0; i < zapełnienie; i++) {
            zbiór[i] = null;
        }
        zapełnienie = 0;
    }

    // Zwracanie ilości elementów w zbiorze
    @Override
    public int ile() {
        return zapełnienie;
    }

    // Implementacja klonowania
    @Override
    public ZbiorTablicowy clone() {
        ZbiorTablicowy clonedSet = new ZbiorTablicowy(zbiór.length);
        clonedSet.zapełnienie = this.zapełnienie;
        for (int i = 0; i < this.zapełnienie; i++) {
            clonedSet.zbiór[i] = this.zbiór[i].clone();
        }
        return clonedSet;
    }
}