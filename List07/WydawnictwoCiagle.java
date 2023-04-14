


// Klasa WydawnictwoCiagle rozszerzająca klasę Ksiazka
public class WydawnictwoCiagle extends Ksiazka {

    // Klasa dodaje jedną zmienną - numer wydania
    private int numer;

    public WydawnictwoCiagle(String tytul, String autor, int rokWydania, int numer) {
        super(tytul, autor, rokWydania);
        this.numer = numer;
    }

    public String toString() {
        return super.toString() + ", numer " + numer;
    }
}
