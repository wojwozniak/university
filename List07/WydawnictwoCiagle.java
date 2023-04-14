
public class WydawnictwoCiagle extends Ksiazka {
    private int numer;

    public WydawnictwoCiagle(String tytul, String autor, int rokWydania, int numer) {
        super(tytul, autor, rokWydania);
        this.numer = numer;
    }

    public String toString() {
        return super.toString() + ", numer " + numer;
    }
}
