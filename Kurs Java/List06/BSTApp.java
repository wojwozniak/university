package List06;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import algorithms.BST;

// Prosta aplikacja okienkowa obsługująca drzewo BST
public class BSTApp extends JFrame {

    // Prywatne pola klasy - drzewo BST i panel do rysowania drzewa
    private BST<Integer> bst;
    private CustomPanel customPanel;

    // Metoda main tworzy obiekt klasy BSTApp
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new BSTApp();
            }
        });
    }

    // Konstruktor
    public BSTApp() {
        bst = new BST<>();
        initializeUI();
    }

    // Metoda inicjalizująca interfejs użytkownika
    private void initializeUI() {
        setTitle("Aplikacja BST");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Dodanie panelu do rysowania drzewa
        customPanel = new CustomPanel();
        add(customPanel, BorderLayout.CENTER);

        // Dodanie panelu z przyciskami
        JPanel controlPanel = new JPanel();
        controlPanel.setLayout(new FlowLayout());

        // Dodanie pola tekstowego do wprowadzania wartości
        JTextField inputField = new JTextField(15);
        controlPanel.add(inputField);
        // Enter działa jak przycisk Insert
        inputField.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String input = inputField.getText();
                int value = Integer.parseInt(input);
                bst.insert(value);
                customPanel.repaint();
                inputField.setText("");
            }
        });

        // Przycisk do wstawiania
        JButton insertBtn = new JButton("Insert");
        insertBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String input = inputField.getText();
                int value = Integer.parseInt(input);
                bst.insert(value);
                customPanel.repaint();
                inputField.setText("");
            }
        });
        controlPanel.add(insertBtn);

        // Przycisk do usuwania
        JButton removeBtn = new JButton("Remove");
        removeBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String input = inputField.getText();
                int value = Integer.parseInt(input);
                bst.remove(value);
                customPanel.repaint();
            }
        });
        controlPanel.add(removeBtn);

        // Dodanie panelu z przyciskami do okna
        add(controlPanel, BorderLayout.SOUTH);

        // Ustawienie rozmiaru okna i wyświetlenie go
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private class CustomPanel extends JPanel {
        // Konstruktor - ustawienie rozmiaru panelu i koloru tła
        public CustomPanel() {
            setPreferredSize(new Dimension(1800, 900));
            setBackground(Color.WHITE);
        }

        // Nadpisanie metody paintComponent - rysowanie drzewa
        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            drawTree(g, getWidth() / 2, 30, bst.root, 1);
        }

        private static final int r = 30;
        private static final int h = 80;

        private void drawTree(Graphics g, int x, int y, BST<Integer>.Node node, int depth) {
            if (node != null) {
                int leftX = x - 450 / depth;
                int rightX = x + 450 / depth;
                int childY = y + h;

                // Rekursywnie rysujemy lewe poddrzewo jeśli istnieje
                if (node.left != null) {
                    drawTree(g, leftX, childY, node.left, depth + 1);

                    // Rysujemy linię łączącą węzeł z lewym dzieckiem
                    g.setColor(Color.BLACK);
                    g.drawLine(x, y + r, leftX, childY - r);
                }

                // Rysujemy węzeł
                g.setColor(Color.GREEN);
                g.fillOval(x - r, y - r, 2 * r, 2 * r);
                g.setColor(Color.BLACK);
                g.drawString(node.value.toString(), x - 5, y + 5);

                // Rekursywnie rysujemy prawe poddrzewo jeśli istnieje
                if (node.right != null) {
                    drawTree(g, rightX, childY, node.right, depth + 1);
                    g.setColor(Color.BLACK);
                    g.drawLine(x, y + r, rightX, childY - r);
                }
            }
        }
    }
}