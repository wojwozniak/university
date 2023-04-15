import java.io.Serializable;

// Klasa książka implementująca Serializable
public class Ksiazka implements Serializable {

    /*
        Prywatne zmienne reprezezentujące
        tytuł, autora i rok wydania
     */
    private String tytul;
    private String autor;
    private int rokWydania;

    // Konstruktor klasy
    public Ksiazka(String tytul, String autor, int rokWydania) {
        this.tytul = tytul;
        this.autor = autor;
        this.rokWydania = rokWydania;
    }


    // Settery i gettery
    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getRokWydania() {
        return rokWydania;
    }

    public void setRokWydania(int rokWydania) {
        this.rokWydania = rokWydania;
    }

    // Metoda toString
    public String toString() {
        return tytul + " (" + autor + ", " + rokWydania + ")";
    }
}