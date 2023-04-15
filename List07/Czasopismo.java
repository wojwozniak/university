
// Deklaracja klasy Czasopismo - rozszerza WydawnictwoCiagle
public class Czasopismo extends WydawnictwoCiagle {

    // Klasa dodaje jedną zmienną - miesiąc wydania czasopisma
    private int miesiac;

    // Konstruktor klasy Czasopismo
    public Czasopismo(String tytul, String autor, int rokWydania, int numer, int miesiac) {

        // Wywołanie konstruktora klasy nadrzędnej
        super(tytul, autor, rokWydania, numer);

        // Ustawienie miesiąca wydania
        this.miesiac = miesiac;
    }

    public int getMiesiac() {
        return miesiac;
    }

    public void setMiesiac(int miesiac) {
        this.miesiac = miesiac;
    }

    // Metoda toString() zwracająca informacje o obiekcie
    public String toString() {
        return super.toString() + ", " + miesiac + "/" + getRokWydania();
    }
}