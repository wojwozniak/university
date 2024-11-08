package javalist08.view;

import javax.swing.*;
import javalist08.renderer.DayCellRenderer;
import java.awt.*;

public class MonthTabPanel extends JPanel {
  private JList<String> currentMonthList;
  private JList<String> previousMonthList;
  private JList<String> nextMonthList;

  DefaultListModel<String> previousMonthModel = new DefaultListModel<>();
  DefaultListModel<String> currentMonthModel = new DefaultListModel<>();
  DefaultListModel<String> nextMonthModel = new DefaultListModel<>();

  public MonthTabPanel() {
    setLayout(new GridLayout(1, 3));
    previousMonthList = new JList<>(previousMonthModel);
    currentMonthList = new JList<>(currentMonthModel);
    nextMonthList = new JList<>(nextMonthModel);

    DayCellRenderer renderer = new DayCellRenderer();
    previousMonthList.setCellRenderer(renderer);
    currentMonthList.setCellRenderer(renderer);
    nextMonthList.setCellRenderer(renderer);

    add(new JScrollPane(previousMonthList));
    add(new JScrollPane(currentMonthList));
    add(new JScrollPane(nextMonthList));
  }

  private void populateListModel(DefaultListModel<String> model, String[] data) {
    for (String day : data) {
      model.addElement(day);
    }
  }

  public void populateListModelPublic(String[] data1, String[] data2, String[] data3) {
    populateListModel(previousMonthModel, data1);
    populateListModel(currentMonthModel, data2);
    populateListModel(nextMonthModel, data3);
  }

  public void clearModels() {
    previousMonthModel.clear();
    currentMonthModel.clear();
    nextMonthModel.clear();
  }
}