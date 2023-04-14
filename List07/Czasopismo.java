
// Deklaracja klasy Czasopismo - rozszerza WydawnictwoCiagle
public class Czasopismo extends WydawnictwoCiagle {

    // Klasa dodaje jedną zmienną - miesiąc wydania czasopisma
    private int miesiac;

    public Czasopismo(String tytul, String autor, int rokWydania, int numer, int miesiac) {
        super(tytul, autor, rokWydania, numer);
        this.miesiac = miesiac;
    }

    public String toString() {
        return super.toString() + ", " + miesiac + "/" + getRokWydania();
    }
}