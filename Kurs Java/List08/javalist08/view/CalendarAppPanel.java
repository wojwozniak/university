package javalist08.view;

import javax.swing.JPanel;
import javax.swing.JTabbedPane;

import javalist08.model.CalendarModel;

public class CalendarAppPanel extends JPanel {
  private JTabbedPane tabbedPane;
  private ControlPanel controlPanel;

  String[] months = { "Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec",
      "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień" };

  public CalendarAppPanel() {
    // Aktualny rok i miesiąc z systemu
    int year = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
    int month = java.util.Calendar.getInstance().get(java.util.Calendar.MONTH);

    // Ustawienie układu dla panelu - BorderLayout
    setLayout(new java.awt.BorderLayout());

    String yearTabTitle = "Rok " + year;
    String monthTabTitle = "Miesiąc " + months[month];

    // Inicjalizacja panelu z zakładkami
    tabbedPane = new JTabbedPane();
    YearTabPanel yearTab = new YearTabPanel();
    MonthTabPanel monthTab = new MonthTabPanel();
    tabbedPane.addTab(yearTabTitle, yearTab);
    tabbedPane.addTab(monthTabTitle, monthTab);
    add(tabbedPane, java.awt.BorderLayout.CENTER);

    // Inicjalizacja toolbara z przyciskami
    controlPanel = new ControlPanel();
    add(controlPanel, java.awt.BorderLayout.SOUTH);
  }

  public ControlPanel getControlPanel() {
    return controlPanel;
  }

  public YearTabPanel getYearTabPanel() {
    return (YearTabPanel) tabbedPane.getComponentAt(0);
  }

  public MonthTabPanel getMonthTabPanel() {
    return (MonthTabPanel) tabbedPane.getComponentAt(1);
  }

  public JTabbedPane getTabbedPane() {
    return tabbedPane;
  }

  public void updateCurrentIndex(int index) {
    tabbedPane.setSelectedIndex(index);
  }

  public void refreshPanel(CalendarModel model) {
    updateTabTitles(model.getYear(), model.getMonth());
  }

  public void updateTabTitles(int year, int month) {
    String yearTabTitle = "Rok " + year;
    String monthTabTitle = "Miesiąc " + months[month];

    tabbedPane.setTitleAt(0, yearTabTitle);
    tabbedPane.setTitleAt(1, monthTabTitle);
  }
}