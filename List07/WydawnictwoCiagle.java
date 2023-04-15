// Klasa WydawnictwoCiagle rozszerzająca klasę Ksiazka
public class WydawnictwoCiagle extends Ksiazka {

    // Klasa dodaje jedną zmienną - numer wydania
    private int numer;

    // Konstruktor klasy WydawnictwoCiagle
    public WydawnictwoCiagle(String tytul, String autor, int rokWydania, int numer) {
        // Wywołanie konstruktora klasy nadrzędnej
        super(tytul, autor, rokWydania);

        // Ustawienie numeru wydania
        this.numer = numer;
    }

    public int getNumer() {
        return numer;
    }

    public void setNumer(int numer) {
        this.numer = numer;
    }

    // Metoda toString() zwracająca informacje o obiekcie
    public String toString() {
        return super.toString() + ", numer " + numer;
    }
}
