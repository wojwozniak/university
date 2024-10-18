package javalist08.controller;

import javalist08.model.CalendarModel;
import javalist08.view.CalendarAppPanel;
import javalist08.view.ControlPanel;
import javalist08.view.YearTabPanel;

import java.util.logging.Logger;
import javax.swing.JSlider;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public class CalendarController {
  private CalendarModel model;
  private CalendarAppPanel calendarAppPanel;
  private ControlPanel controlPanel;
  private YearTabPanel yearTabPanel;
  private static final Logger logger = Logger.getLogger(CalendarController.class.getName());

  public CalendarController(CalendarModel model, CalendarAppPanel view) {
    this.model = model;
    this.calendarAppPanel = view;
    this.controlPanel = view.getControlPanel();
    this.yearTabPanel = view.getYearTabPanel();
    setupControlListeners();
  }

  private void setupControlListeners() {
    controlPanel.getPrevMonthButton().addActionListener(e -> {
      model.changeMonth(-1);
      controlPanel.refreshPanel(model);
      calendarAppPanel.refreshPanel(model);
      generateCalendar();
    });

    controlPanel.getNextMonthButton().addActionListener(e -> {
      model.changeMonth(1);
      controlPanel.refreshPanel(model);
      calendarAppPanel.refreshPanel(model);
      generateCalendar();
    });

    controlPanel.getYearSpinner().addChangeListener(e -> {
      model.setYear((Integer) controlPanel.getYearSpinner().getValue());
      controlPanel.refreshPanel(model);
      calendarAppPanel.refreshPanel(model);
      generateCalendar();
    });

    controlPanel.getMonthScrollBar().addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        JSlider source = (JSlider) e.getSource();
        if (!source.getValueIsAdjusting()) {
          int month = source.getValue();
          model.setMonth(month);
          controlPanel.refreshPanel(model);
          calendarAppPanel.refreshPanel(model);
          generateCalendar();
        }
      }
    });

    for (int i = 0; i < 12; i++) {
      final int monthIndex = i;
      yearTabPanel.getMonthPanel(i).addMouseListener(new java.awt.event.MouseAdapter() {
        public void mouseClicked(java.awt.event.MouseEvent evt) {
          model.setMonth(monthIndex);
          controlPanel.refreshPanel(model);
          calendarAppPanel.refreshPanel(model);
          calendarAppPanel.updateCurrentIndex(1);
          generateCalendar();
        }
      });
    }

    calendarAppPanel.getTabbedPane().addChangeListener(e -> {
      generateCalendar();
    });
  }

  public void initialize() {
    logger.info("Zainicjalizowano kontroler");
  }

  public void generateCalendar() {
    logger.info("Wygenerowano kalendarz");
    int index = calendarAppPanel.getTabbedPane().getSelectedIndex();
    if (index == 1) {
      controlPanel.getMonthScrollBar().setValue(model.getMonth());
      controlPanel.getYearSpinner().setValue(model.getYear());
      String[] previousMonth = model.getPreviousMonth();
      String[] currentMonth = model.getCurrentMonth();
      String[] nextMonth = model.getNextMonth();
      calendarAppPanel.getMonthTabPanel().populateListModelPublic(previousMonth, currentMonth, nextMonth);
    }
  }
}