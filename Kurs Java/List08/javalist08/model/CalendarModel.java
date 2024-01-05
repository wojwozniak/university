package javalist08.model;

import javax.swing.AbstractListModel;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Logger;

public class CalendarModel extends AbstractListModel<String> {
  private GregorianCalendar calendar;
  private static final Logger logger = Logger.getLogger(CalendarModel.class.getName());

  // Konstruktor
  public CalendarModel() {
    calendar = new GregorianCalendar();
    logCurrentValues();
  }

  // Metody zwracające wartości pól
  @Override
  public int getSize() {
    return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
  }

  // Metoda zwracająca nazwę dnia tygodnia, numer dnia miesiąca i nazwę miesiąca
  @Override
  public String getElementAt(int index) {
    GregorianCalendar tempCalendar = (GregorianCalendar) calendar.clone();
    tempCalendar.set(Calendar.DAY_OF_MONTH, index + 1);

    String dayOfWeek = getDayOfWeek(tempCalendar.get(Calendar.DAY_OF_WEEK));
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
    String formattedDate = dateFormat.format(tempCalendar.getTime());

    return dayOfWeek + ", " + formattedDate;
  }

  // Funkcja pomocnicza do logowania wartości pól
  private void logCurrentValues() {
    int dayIndex = calendar.get(Calendar.DAY_OF_MONTH) - 1;
    String formattedDate = getElementAt(dayIndex);
    logger.info("Current Date: " + formattedDate);
  }

  // Funkcja pomocnicza do zwracania nazwy dnia tygodnia
  private String getDayOfWeek(int dayOfWeek) {
    String[] days = { "Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela" };
    return days[dayOfWeek - 1];
  }

  // Ustawianie roku na wybrany
  public void setYear(int year) {
    calendar.set(Calendar.YEAR, year);
    fireContentsChanged(this, 0, getSize() - 1);
    logCurrentValues();
  }

  // Ustawianie miesiąca na wybrany
  public void setMonth(int month) {
    calendar.set(Calendar.MONTH, month);
    fireContentsChanged(this, 0, getSize() - 1);
    logCurrentValues();
  }

  // Zmiana miesiąca o n (ujemne wartości oznaczają zmianę wstecz) - w razie
  // potrzeby zmienia rok
  public void changeMonth(int change) {
    calendar.add(Calendar.MONTH, change);
    fireContentsChanged(this, 0, getSize() - 1);
    logCurrentValues();
  }

  // Metody zwracające wartości pól - pomocnicza dla view
  public int getYear() {
    return calendar.get(Calendar.YEAR);
  }

  public int getMonth() {
    return calendar.get(Calendar.MONTH);
  }

  // Metoda zwracająca tablicę z nazwami dni tygodnia dla poprzedniego miesiąca
  public String[] getPreviousMonth() {
    GregorianCalendar tempCalendar = (GregorianCalendar) calendar.clone();
    tempCalendar.add(Calendar.MONTH, -1);
    int daysInMonth = tempCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    String[] previousMonth = new String[daysInMonth];

    for (int i = 0; i < daysInMonth; i++) {
      tempCalendar.set(Calendar.DAY_OF_MONTH, i + 1);
      String dayOfWeek = getDayOfWeek(tempCalendar.get(Calendar.DAY_OF_WEEK));
      SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
      String formattedDate = dateFormat.format(tempCalendar.getTime());
      previousMonth[i] = dayOfWeek + ", " + formattedDate;
    }

    return previousMonth;
  }

  // Metoda zwracająca tablicę z nazwami dni tygodnia dla następnego miesiąca
  public String[] getNextMonth() {
    GregorianCalendar tempCalendar = (GregorianCalendar) calendar.clone();
    tempCalendar.add(Calendar.MONTH, 1);
    int daysInMonth = tempCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    String[] nextMonth = new String[daysInMonth];

    for (int i = 0; i < daysInMonth; i++) {
      tempCalendar.set(Calendar.DAY_OF_MONTH, i + 1);
      String dayOfWeek = getDayOfWeek(tempCalendar.get(Calendar.DAY_OF_WEEK));
      SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
      String formattedDate = dateFormat.format(tempCalendar.getTime());
      nextMonth[i] = dayOfWeek + ", " + formattedDate;
    }

    return nextMonth;
  }

  // Metoda zwracająca tablicę z nazwami dni tygodnia dla aktualnego miesiąca
  public String[] getCurrentMonth() {
    GregorianCalendar tempCalendar = (GregorianCalendar) calendar.clone();
    int daysInMonth = tempCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    String[] currentMonth = new String[daysInMonth];

    for (int i = 0; i < daysInMonth; i++) {
      tempCalendar.set(Calendar.DAY_OF_MONTH, i + 1);
      String dayOfWeek = getDayOfWeek(tempCalendar.get(Calendar.DAY_OF_WEEK));
      SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
      String formattedDate = dateFormat.format(tempCalendar.getTime());
      currentMonth[i] = dayOfWeek + ", " + formattedDate;
    }

    return currentMonth;
  }
}