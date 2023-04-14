import javax.swing.*;

// Edytor klasy Książka
public class KsiazkaEditor extends JComponent {

    /*
        Edytor posiada trzy pola - możemy
        edytować tytuł, autora i rok wydania
     */
    private JTextField tytulField;
    private JTextField autorField;
    private JSpinner rokWydaniaSpinner;

    // Konstruktor naszego edytora
    public KsiazkaEditor() {
        // Tworzymy layout - zwykłe okno
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

        // Tworzymy pola tytułu i autora
        tytulField = new JTextField();
        add(new JLabel("Tytuł:"));
        add(tytulField);

        autorField = new JTextField();
        add(new JLabel("Autor:"));
        add(autorField);

        /*
            W przypadku roku wydania będzie spinner,
            pozwalający zmieniać rok wydania o 1
            kliknięciem myszy
        */
        rokWydaniaSpinner = new JSpinner(new SpinnerNumberModel(2023, 0, 9999, 1));
        add(new JLabel("Rok wydania:"));
        add(rokWydaniaSpinner);
    }

    // Getter i setter Książek
    public Ksiazka getKsiazka() {
        String tytul = tytulField.getText();
        String autor = autorField.getText();
        int rokWydania = (int) rokWydaniaSpinner.getValue();

        return new Ksiazka(tytul, autor, rokWydania);
    }

    public void setKsiazka(Ksiazka książka) {
        tytulField.setText(książka.getTytul());
        autorField.setText(książka.getAutor());
        rokWydaniaSpinner.setValue(książka.getRokWydania());
    }
}