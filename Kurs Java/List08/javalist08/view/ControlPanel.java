package javalist08.view;

import javax.swing.*;
import javalist08.model.CalendarModel;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

public class ControlPanel extends JPanel {
  private JButton prevMonthButton, nextMonthButton;
  private JSpinner yearSpinner;
  private JSlider monthSlider;
  private JLabel monthLabel;

  String[] months = { "Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec",
      "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień" };

  public ControlPanel() {
    // Rok i miesiąc z systemu
    int year = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
    int month = java.util.Calendar.getInstance().get(java.util.Calendar.MONTH);

    setLayout(new GridBagLayout());
    GridBagConstraints gbc = new GridBagConstraints();
    gbc.insets = new Insets(5, 5, 5, 5);

    gbc.gridx = 0;
    gbc.gridy = 0;
    add(new JLabel("Rok:"), gbc);

    gbc.gridx = 1;
    yearSpinner = new JSpinner(new SpinnerNumberModel(year, 1, 9999, 1));
    yearSpinner.setEditor(new JSpinner.NumberEditor(yearSpinner, "#"));
    add(yearSpinner, gbc);

    gbc.gridx = 2;
    prevMonthButton = new JButton("<");
    add(prevMonthButton, gbc);

    gbc.gridx = 3;
    monthLabel = new JLabel(months[month]);
    monthLabel.setPreferredSize(new Dimension(100, monthLabel.getPreferredSize().height));
    add(monthLabel, gbc);

    gbc.gridx = 4;
    monthSlider = new JSlider(JSlider.HORIZONTAL, 0, 11, month);
    add(monthSlider, gbc);

    gbc.gridx = 5;
    nextMonthButton = new JButton(">");
    add(nextMonthButton, gbc);
  }

  public void refreshPanel(CalendarModel model) {
    yearSpinner.setValue(model.getYear());
    monthSlider.setValue(model.getMonth());
    monthLabel.setText(months[model.getMonth()]);
  }

  public JButton getPrevMonthButton() {
    return prevMonthButton;
  }

  public JButton getNextMonthButton() {
    return nextMonthButton;
  }

  public JSpinner getYearSpinner() {
    return yearSpinner;
  }

  public JSlider getMonthScrollBar() {
    return monthSlider;
  }
}