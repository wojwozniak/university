// Wojciech Woźniak - Lista 7

import javax.swing.*;
import java.awt.*;

// Klasa edytora książki
public class KsiazkaEditor extends JComponent {

    // Konstruktor klasy - generujemy pola i przyciski
    public KsiazkaEditor(Ksiazka ksiazka) {
        // Tworzenie pól tekstowych
        JTextField tytulField = new JTextField(ksiazka.getTytul(), 20);
        JTextField autorField = new JTextField(ksiazka.getAutor(), 20);
        JTextField rokWydaniaField = new JTextField(Integer.toString(ksiazka.getRokWydania()), 4);

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
        add(fieldsPanel, BorderLayout.CENTER);
        JPanel buttonsPanel = new JPanel();
        buttonsPanel.add(zapiszButton);
        buttonsPanel.add(anulujButton);
        add(buttonsPanel, BorderLayout.SOUTH);

        // Listener zapisu - zapisujemy obiekt i zamykamy okno
        zapiszButton.addActionListener(e -> {
            ksiazka.setTytul(tytulField.getText());
            ksiazka.setAutor(autorField.getText());
            ksiazka.setRokWydania(Integer.parseInt(rokWydaniaField.getText()));
            JFrame frame = (JFrame) SwingUtilities.getWindowAncestor((Component) e.getSource());
            frame.dispose();

            System.out.println("Książka po edycji:");
            System.out.println(ksiazka);
        });

        // Listener anulowania - zamykamy okno
        anulujButton.addActionListener(e -> {
            JFrame frame = (JFrame) SwingUtilities.getWindowAncestor((Component) e.getSource());
            frame.dispose();
        });
    }

    // Funkcja wywołująca renderowanie okna
    public static void callEditor(Ksiazka ksiazka) {
        KsiazkaEditor editor = new KsiazkaEditor(ksiazka);
        JFrame frame = new JFrame("Edycja książki");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(editor);
        frame.pack();
        frame.setVisible(true);
    }
}