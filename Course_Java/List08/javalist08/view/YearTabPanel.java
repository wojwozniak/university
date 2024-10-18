package javalist08.view;

import javax.swing.*;
import java.awt.*;

public class YearTabPanel extends JPanel {
  public YearTabPanel() {
    setLayout(new GridLayout(3, 4));
    for (int i = 0; i < 12; i++) {
      JPanel monthPanel = createMonthPanel(i);
      add(monthPanel);
    }
  }

  private JPanel createMonthPanel(int monthIndex) {
    JPanel monthPanel = new JPanel(new BorderLayout());
    JLabel monthLabel = new JLabel(getMonthName(monthIndex), SwingConstants.CENTER);
    monthPanel.add(monthLabel, BorderLayout.NORTH);
    return monthPanel;
  }

  public JPanel getMonthPanel(int monthIndex) {
    return (JPanel) getComponent(monthIndex);
  }

  private String getMonthName(int monthIndex) {
    String[] months = { "Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień",
        "Październik", "Listopad", "Grudzień" };
    return months[monthIndex];
  }
}