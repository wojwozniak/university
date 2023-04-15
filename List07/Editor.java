import javax.swing.*;
import java.awt.*;

public class Editor {

    // Konstruktor - zapisuje książkę i renderuje edytor
    public Editor(Ksiazka ksiazka, Czasopismo czasopismo) {

        // Tworzymy okno edytora
        JFrame mainFrame = new JFrame("Edytor");
        mainFrame.setPreferredSize(new Dimension(400, 300));
        mainFrame.setLayout(new BorderLayout());

        // Tworzymy etykietę z tytułem książki i napisy
        JLabel titleLabel = new JLabel("Prosty edytor");
        titleLabel.setFont(new Font("Arial", Font.BOLD, 20));
        JLabel subtitleLabel = new JLabel("Kliknij przyciski poniżej by edytować");
        JLabel subtitle2Label = new JLabel("wypisane wcześniej książki");

        // Dodajemy panel z napisami
        JPanel centerPanel = new JPanel();
        centerPanel.setLayout(new BoxLayout(centerPanel, BoxLayout.PAGE_AXIS));
        centerPanel.add(subtitleLabel);
        centerPanel.add(subtitle2Label);

        // Tworzymy panel z przyciskami
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));

        // Przycisk edycji magazynu
        JButton editMagazineButton = new JButton("Edytuj magazyn");
        editMagazineButton.addActionListener(e -> {
            // Wypisujemy dane i wywołujemy edytor
            System.out.println("Wywołujemy edytor dla:");
            System.out.println(czasopismo);
            CzasopismoEditor.callEditor(czasopismo);
        });

        // Przycisk edycji książki
        JButton editBookButton = new JButton("Edytuj książkę");
        editBookButton.addActionListener(e -> {
            // Wypisujemy dane i wywołujemy edytor
            System.out.println("Wywołujemy edytor dla:");
            System.out.println(ksiazka);
            KsiazkaEditor.callEditor(ksiazka);
        });

        // Przycisk zamknięcia
        JButton closeButton = new JButton("Zamknij");
        closeButton.addActionListener(e -> mainFrame.dispose());

        // Dodajemy przyciski do panelu
        buttonPanel.add(editMagazineButton);
        buttonPanel.add(editBookButton);
        buttonPanel.add(closeButton);

        // Dodajemy komponenty do głównego panelu
        mainFrame.add(titleLabel, BorderLayout.NORTH);
        mainFrame.add(centerPanel, BorderLayout.CENTER);
        mainFrame.add(buttonPanel, BorderLayout.SOUTH);

        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainFrame.pack();
        mainFrame.setVisible(true);
    }
}