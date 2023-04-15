import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// Klasa edytora książki
public class KsiazkaEditor extends JComponent {

    // Edytowana książka
    private Ksiazka ksiazka;

    // Pola i przyciski
    private JTextField tytulField;
    private JTextField autorField;
    private JTextField rokWydaniaField;
    private JButton zapiszButton;
    private JButton anulujButton;
    private ActionListener actionListener;

    // Konstruktor klasy - generujemy pola i przyciski
    public KsiazkaEditor(Ksiazka ksiazka, ActionListener actionListener) {
        this.ksiazka = ksiazka;

        // Tworzenie pól tekstowych
        tytulField = new JTextField(ksiazka.getTytul(), 20);
        autorField = new JTextField(ksiazka.getAutor(), 20);
        rokWydaniaField = new JTextField(Integer.toString(ksiazka.getRokWydania()), 4);

        // Tworzenie przycisków
        zapiszButton = new JButton("Zapisz");
        anulujButton = new JButton("Anuluj");

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
        zapiszButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ksiazka.setTytul(tytulField.getText());
                ksiazka.setAutor(autorField.getText());
                ksiazka.setRokWydania(Integer.parseInt(rokWydaniaField.getText()));
                JFrame frame = (JFrame) SwingUtilities.getWindowAncestor((Component) e.getSource());
                frame.dispose();
            }
        });

        // Listener anulowania - zamykamy okno
        anulujButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFrame frame = (JFrame) SwingUtilities.getWindowAncestor((Component) e.getSource());
                frame.dispose();
            }
        });
    }

    private void editKsiazka() {
        ksiazka.setTytul(tytulField.getText());
        ksiazka.setAutor(autorField.getText());
        ksiazka.setRokWydania(Integer.parseInt(rokWydaniaField.getText()));
        if (actionListener != null) {
            actionListener.actionPerformed(new ActionEvent(this, ActionEvent.ACTION_PERFORMED, "Książka zmodyfikowana"));
        }
        JFrame frame = (JFrame) SwingUtilities.getWindowAncestor(KsiazkaEditor.this);
        frame.dispose();
    }

    // Funkcja wywołująca renderowanie okna
    public static void callEditor(Ksiazka ksiazka, ActionListener actionListener) {
        KsiazkaEditor editor = new KsiazkaEditor(ksiazka, actionListener);
        JFrame frame = new JFrame("Edycja książki");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(editor);
        frame.pack();
        frame.setVisible(true);
    }
}