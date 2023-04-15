import javax.swing.*;
import java.awt.event.*;

public class Editor {

    // Zmienna przechowująca dane książki
    private Ksiazka ksiazka;

    // Konstruktor - zapisuje książkę i renderuje edytor
    public Editor(Ksiazka ksiazka) {
        this.ksiazka = ksiazka;
        renderEditor();
    }

    // Metoda renderująca edytor
    private void renderEditor() {
        JFrame mainFrame = new JFrame("Editor");
        JButton editButton = new JButton("Edytuj książkę");

        // Sprawdzamy czy przycisk został kliknięty
        editButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Wypisujemy
                System.out.println("Wywołujemy edytor dla:");
                System.out.println(ksiazka);
                KsiazkaEditor.callEditor(ksiazka);
            }
        });

        // Renderujemy okno
        JPanel panel = new JPanel();
        panel.add(editButton);
        mainFrame.add(panel);
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}