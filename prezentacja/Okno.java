package prezentacja;

import java.awt.*;
import java.awt.event.*;
import java.io.IOException;
import java.util.logging.*;

public class Okno extends Frame {
    // Deklaracja komponentów GUI
    private TextField licznikTextField, mianownikTextField, wyswietlaczField;
    private Button propozycjaButton, nowaGraButton, zakonczButton, rezygnacjaButton;
    private Scrollbar probyScrollbar, zakresScrollbar;
    private Label opis, licznikLabel, mianownikLabel, wyswietlaczLabel, zakresLabel, probyLabel,
            zgadnietyGornyLimitLabel, zgadnietyDolnyLimitLabel;
    private Wymierna zgadnietyGornyLimit, zgadnietyDolnyLimit;

    // Przechowywanie stanu gry
    private Gra gra;
    private static Logger logger = Logger.getLogger("MyLog");

    // Metoda main - uruchomienie aplikacji
    public static void main(String[] args) {
        Okno okno = new Okno();
        okno.setVisible(true);
        FileHandler fh;
        try {

            fh = new FileHandler("rozgrywka.log", true);
            logger.addHandler(fh);
            SimpleFormatter formatter = new SimpleFormatter();
            fh.setFormatter(formatter);
            logger.info("Log initialized.");

        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Konstruktor klasy Okno - inicjalizacja komponentów GUI
    public Okno() {
        // Obsługa zdarzenia zamknięcia okna - dzięki temu działa przycisk X
        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent we) {
                logger.log(Level.INFO, "Zamknięto aplikację.");
                System.exit(0);
            }
        });

        // Inicjalizacja głównego okna
        setTitle("Zadanie 5 - Gra w odgadywanie liczb wymiernych");
        setSize(600, 300);
        setLayout(null);

        // Inicjalizacja komponentów GUI

        // Przycisk rozpoczęcia gry
        nowaGraButton = new Button("Rozpocznij grę");
        nowaGraButton.setBounds(240, 250, 100, 30);
        add(nowaGraButton);
        nowaGraButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                rozpocznijNowaGre();
            }
        });

        // Przycisk poddania się
        rezygnacjaButton = new Button("Poddaj się");
        rezygnacjaButton.setBounds(360, 250, 100, 30);
        add(rezygnacjaButton);
        rezygnacjaButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                gra.rezygnuj();
                handleWyszarzenie("REZYGNACJA");
                wyswietlaczField.setText("Poddano się! Rozpocznij nową grę!");
                wyswietlaczField.setBackground(Color.RED);
                logger.log(Level.INFO, "Poddano się.");
            }
        });

        // Przycisk zakończenia gry
        zakonczButton = new Button("Zakończ");
        zakonczButton.setBounds(480, 250, 100, 30);
        add(zakonczButton);
        zakonczButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                logger.log(Level.INFO, "Zamknięto aplikację.");
                System.exit(0);
            }
        });

        // Opis
        opis = new Label("Gra w odgadywanie liczb wymiernych - wersja graficzna.");
        opis.setBounds(50, 50, 500, 20);
        add(opis);

        // Label licznika
        licznikLabel = new Label("Licznik:");
        licznikLabel.setBounds(50, 80, 70, 20);
        add(licznikLabel);

        // TextField licznika
        licznikTextField = new TextField("", 10);
        licznikTextField.setBounds(50, 100, 70, 20);
        add(licznikTextField);

        // Label mianownika
        mianownikLabel = new Label("Mianownik:");
        mianownikLabel.setBounds(140, 80, 70, 20);
        add(mianownikLabel);

        // TextField mianownika
        mianownikTextField = new TextField("", 10);
        mianownikTextField.setBounds(140, 100, 70, 20);
        add(mianownikTextField);

        // Label wyświetlacza
        wyswietlaczLabel = new Label("Stan gry:");
        wyswietlaczLabel.setBounds(245, 80, 70, 20);
        add(wyswietlaczLabel);

        // TextField wyświetlacza
        wyswietlaczField = new TextField("Wybierz zakres i rozpocznij grę", 10);
        wyswietlaczField.setBounds(245, 100, 300, 20);
        add(wyswietlaczField);
        wyswietlaczField.setEditable(false);
        wyswietlaczField.setBackground(Color.GREEN);

        // Zgadywanie
        propozycjaButton = new Button("Zgaduj!");
        propozycjaButton.setBounds(50, 130, 160, 40);
        add(propozycjaButton);
        propozycjaButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                obslugaPropozycji();
            }
        });

        // Label zgadnięty górny limit
        zgadnietyGornyLimitLabel = new Label("Zgadnięty górny limit");
        zgadnietyGornyLimitLabel.setBounds(50, 180, 200, 20);
        add(zgadnietyGornyLimitLabel);

        // Label zgadnięty dolny limit
        zgadnietyDolnyLimitLabel = new Label("Zgadnięty dolny limit");
        zgadnietyDolnyLimitLabel.setBounds(50, 200, 200, 20);
        add(zgadnietyDolnyLimitLabel);

        // Label zakresu
        zakresLabel = new Label("Zakres - górna granica (5-20):");
        zakresLabel.setBounds(245, 130, 250, 20);
        add(zakresLabel);

        // Suwak zakresu
        zakresScrollbar = new Scrollbar(Scrollbar.HORIZONTAL, 12, 1, 5, 20);
        zakresScrollbar.setBounds(245, 150, 300, 20);
        add(zakresScrollbar);

        // Label liczby prób
        probyLabel = new Label("Liczba prób:");
        probyLabel.setBounds(245, 180, 100, 20);
        add(probyLabel);

        // Suwak liczby prób
        probyScrollbar = new Scrollbar(Scrollbar.HORIZONTAL, 0, 1, 0, 10);
        probyScrollbar.setBounds(245, 200, 300, 20);
        add(probyScrollbar);

        // Inicjalizacja obiektu Gra
        gra = new Gra();

        handleWyszarzenie("INICJALIZACJA");
        logger.log(Level.INFO, "Zainicjalizowano aplikację.");
    }

    private void handleWyszarzenie(String status) {
        switch (status) {
            case "INICJALIZACJA", "REZYGNACJA",
                    "ZWYCIĘSTWO", "PORAZKA":
                licznikLabel.setEnabled(false);
                licznikTextField.setEnabled(false);
                rezygnacjaButton.setEnabled(false);
                mianownikLabel.setEnabled(false);
                mianownikTextField.setEnabled(false);
                probyLabel.setEnabled(false);
                propozycjaButton.setEnabled(false);
                probyScrollbar.setEnabled(false);
                nowaGraButton.setEnabled(true);
                zakresLabel.setFocusable(true);
                zakresScrollbar.setEnabled(true);
                zgadnietyGornyLimitLabel.setEnabled(false);
                zgadnietyDolnyLimitLabel.setEnabled(false);
                zgadnietyDolnyLimitLabel.setText("Zgadnięty dolny limit");
                zgadnietyGornyLimitLabel.setText("Zgadnięty górny limit");
                break;
            case "KONTYNUACJA":
                licznikLabel.setEnabled(true);
                licznikTextField.setEnabled(true);
                mianownikLabel.setEnabled(true);
                mianownikTextField.setEnabled(true);
                probyLabel.setEnabled(true);
                propozycjaButton.setEnabled(true);
                nowaGraButton.setEnabled(false);
                rezygnacjaButton.setEnabled(true);
                probyScrollbar.setEnabled(true);
                probyScrollbar.setFocusable(false);
                zakresLabel.setFocusable(false);
                zakresScrollbar.setEnabled(true);
                zgadnietyDolnyLimitLabel.setEnabled(true);
                zgadnietyGornyLimitLabel.setEnabled(true);
                break;

            default:
                logger.log(Level.WARNING,
                        "Niepoprawny status gry. Funkcja handleWyszarzenie otrzymała argument " + status);
                throw new IllegalArgumentException(
                        "Niepoprawny status gry. Funkcja handleWyszarzenie otrzymała argument " + status);
        }
    }

    private void rozpocznijNowaGre() {
        int zakres = zakresScrollbar.getValue();
        int out = gra.start(zakres);
        if (out == -1) {
            wyswietlaczField.setText("Błąd losowania liczby! Spróbuj rozpocząć ponownie!");
            wyswietlaczField.setBackground(Color.RED);
            logger.log(Level.FINER, "Błąd losowania liczby!");
        } else {
            wyswietlaczField.setText("Gra aktywna! Liczba prób: " + out);
            wyswietlaczField.setBackground(Color.GREEN);
            logger.log(Level.INFO, "Rozpoczęto nową grę. Zakres: " + zakres + ", liczba prób: " + out);
            handleWyszarzenie("KONTYNUACJA");
        }
    }

    private void obslugaPropozycji() {
        if (gra.czyAktywna()) {
            try {
                int licznik = Integer.parseInt(licznikTextField.getText());
                int mianownik = Integer.parseInt(mianownikTextField.getText());
                if (licznik >= mianownik) {
                    logger.log(Level.FINER, "Licznik musi być mniejszy od mianownika!");
                    wyswietlaczField.setText("Licznik musi być mniejszy od mianownika!");
                    wyswietlaczField.setBackground(Color.RED);
                }
                Wymierna propozycja = new Wymierna(licznik, mianownik);
                String wynik = gra.odgadnij(propozycja);
                if (wynik == "ZWYCIĘSTWO") {
                    wyswietlaczField.setBackground(Color.GREEN);
                    wyswietlaczField.setText("Zwycięstwo! Rozpocznij nową grę!");
                    logger.log(Level.INFO, "Zwycięstwo!");
                    handleWyszarzenie("ZWYCIĘSTWO");
                } else if (wynik == "PORAŻKA") {
                    wyswietlaczField.setBackground(Color.RED);
                    wyswietlaczField.setText("Porażka! Rozpocznij nową grę!");
                    logger.log(Level.INFO, "Porażka!");
                    handleWyszarzenie("PORAZKA");
                } else {
                    wyswietlaczField.setBackground(Color.YELLOW);
                    int porownanie = gra.porownaj(propozycja);
                    if (porownanie < 0) {
                        wyswietlaczField
                                .setText("Podana przez Ciebie liczba " + propozycja.toString() + " " + "(" + propozycja.toFloat() + ") jest za mała!");
                        if (zgadnietyDolnyLimit == null || zgadnietyDolnyLimit.compareTo(propozycja) < 0) {
                            zgadnietyDolnyLimit = propozycja;
                            zgadnietyDolnyLimitLabel
                                    .setText("Zgadnięty dolny limit: " + zgadnietyDolnyLimit.toString() + " (" + zgadnietyDolnyLimit.toFloat() + ")");
                        }

                    } else {
                        wyswietlaczField
                                .setText("Podana przez Ciebie liczba " + propozycja.toString() + " " + "(" + propozycja.toFloat() + ") jest za duża!");
                        if (zgadnietyGornyLimit == null || zgadnietyGornyLimit.compareTo(propozycja) > 0) {
                            zgadnietyGornyLimit = propozycja;
                            zgadnietyGornyLimitLabel
                                    .setText("Zgadnięty górny limit: " + zgadnietyGornyLimit.toString() + " (" + zgadnietyGornyLimit.toFloat() + ")");
                        }

                    }
                    licznikTextField.setText("");
                    mianownikTextField.setText("");
                    probyScrollbar.setValue(gra.ileProbUzyto());
                }
            } catch (NumberFormatException e) {
                logger.log(Level.FINER, "Niepoprawny format liczby.");
                wyswietlaczField.setText("Niepoprawny format liczby!");
                wyswietlaczField.setBackground(Color.RED);
            }
        } else {
            logger.log(Level.FINER, "Gra nie jest aktywna.");
        }
    }
}