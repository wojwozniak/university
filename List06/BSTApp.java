import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import algorithms.BST;


// Prosta aplikacja okienkowa obsługująca drzewo BST
public class BSTApp extends JFrame {

    // Prywatne pola klasy - drzewo BST i panel do rysowania drzewa
    private BST<String> bst;
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
                String value = inputField.getText();
                if (!value.isEmpty()) {
                    bst.insert(value);
                    customPanel.repaint();
                }
                inputField.setText("");
            }
        });

        // Przycisk do wstawiania
        JButton insertBtn = new JButton("Insert");
        insertBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String value = inputField.getText();
                if (!value.isEmpty()) {
                    bst.insert(value);
                    customPanel.repaint();
                }
                inputField.setText("");
            }
        });
        controlPanel.add(insertBtn);

        // Przycisk do usuwania
        JButton removeBtn = new JButton("Remove");
        removeBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String value = inputField.getText();
                if (!value.isEmpty()) {
                    bst.remove(value);
                    customPanel.repaint();
                }
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
            drawTree(g, getWidth() / 2, 30, bst.root);
        }

        // Stałe do rysowania drzewa
        private static final int r = 30;
        private static final int h = 60;

        // Rekurencyjna metoda rysująca drzewo
        private void drawTree(Graphics g, int x, int y, BST<String>.Node node) {
            if (node != null) {
                int leftX = x - 100;
                int rightX = x + 100;
                int childY = y + h;
        
                // Recursively draw the left subtree if the left child exists
                if (node.left != null) {
                    drawTree(g, leftX, childY, node.left);
        
                    // Draw a line connecting the current node to its left child
                    g.setColor(Color.BLACK);
                    g.drawLine(x, y + r, leftX, childY - r);
                }
        
                // Draw the current node
                g.setColor(Color.GREEN);
                g.fillOval(x - r, y - r, 2 * r, 2 * r);
                g.setColor(Color.BLACK);
                g.drawString(node.value, x - 5, y + 5);
        
                // Recursively draw the right subtree if the right child exists
                if (node.right != null) {
                    drawTree(g, rightX, childY, node.right);
        
                    // Draw a line connecting the current node to its right child
                    g.setColor(Color.BLACK);
                    g.drawLine(x, y + r, rightX, childY - r);
                }
            }
        }
    }
}