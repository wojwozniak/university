// Wojciech Woźniak - Lista 7

import javax.swing.*;
import java.awt.*;

// Klasa edytora czasopisma
public class CzasopismoEditor extends JComponent {

    // Konstruktor klasy - generujemy pola i przyciski
    public CzasopismoEditor(Czasopismo czasopismo) {
        // Tworzenie pól tekstowych
        JTextField tytulField = new JTextField(czasopismo.getTytul(), 20);
        JTextField autorField = new JTextField(czasopismo.getAutor(), 20);
        JTextField rokWydaniaField = new JTextField(Integer.toString(czasopismo.getRokWydania()), 4);
        JTextField numerField = new JTextField(Integer.toString(czasopismo.getNumer()), 4);
        JTextField miesiacField = new JTextField(Integer.toString(czasopismo.getMiesiac()), 4);

        // Tworzenie przycisków
        JButton zapiszButton = new JButton("Zapisz");
        JButton anulujButton = new JButton("Anuluj");

        // Ustawienie layoutu
        setLayout(new BorderLayout());

        // Dodanie pól tekstowych i przycisków do panelu
        JPanel fieldsPanel = new JPanel();
        fieldsPanel.setLayout(new GridLayout(3, 2));
        fieldsPanel.add(new JLabel("Tytuł:"));
        fieldsPanel.add(tytulField);
        fieldsPanel.add(new JLabel("Autor:"));
        fieldsPanel.add(autorField);
        fieldsPanel.add(new JLabel("Rok wydania:"));
        fieldsPanel.add(rokWydaniaField);
        fieldsPanel.add(new JLabel("Miesiac:"));
        fieldsPanel.add(miesiacField);
        fieldsPanel.add(new JLabel("Numer:"));
        fieldsPanel.add(numerField);
        add(fieldsPanel, BorderLayout.CENTER);

        JPanel buttonsPanel = new JPanel();
        buttonsPanel.add(zapiszButton);
        buttonsPanel.add(anulujButton);
        add(buttonsPanel, BorderLayout.SOUTH);

        // Listener zapisu - zapisujemy obiekt i zamykamy okno
        zapiszButton.addActionListener(e -> {
            czasopismo.setTytul(tytulField.getText());
            czasopismo.setAutor(autorField.getText());
            czasopismo.setRokWydania(Integer.parseInt(rokWydaniaField.getText()));
            czasopismo.setMiesiac(Integer.parseInt(miesiacField.getText()));
            czasopismo.setNumer(Integer.parseInt(numerField.getText()));
            JFrame frame = (JFrame) SwingUtilities.getWindowAncestor((Component) e.getSource());
            frame.dispose();

            System.out.println("Czasopismo po edycji:");
            System.out.println(czasopismo);
        });

        // Listener anulowania - zamykamy okno
        anulujButton.addActionListener(e -> {
            JFrame frame = (JFrame) SwingUtilities.getWindowAncestor((Component) e.getSource());
            frame.dispose();
        });
    }

    // Funkcja wywołująca renderowanie okna
    public static void callEditor(Czasopismo czasopismo) {
        CzasopismoEditor editor = new CzasopismoEditor(czasopismo);
        JFrame frame = new JFrame("Edycja czasopisma");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(editor);
        frame.pack();
        frame.setVisible(true);
    }
}