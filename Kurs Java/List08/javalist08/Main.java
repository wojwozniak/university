package javalist08;

import java.util.logging.ConsoleHandler;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.SwingUtilities;
import javalist08.controller.CalendarController;
import javalist08.model.CalendarModel;
import javalist08.view.CalendarAppPanel;

public class Main {
  public static void main(String[] args) {
    CalendarModel model = new CalendarModel();
    CalendarAppPanel view = new CalendarAppPanel();
    CalendarController controller = new CalendarController(model, view);
    controller.initialize();

    // Konfiguracja loggera
    Logger logger = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
    logger.setLevel(Level.INFO);
    logger.setUseParentHandlers(false);
    Handler consoleHandler = new ConsoleHandler();
    consoleHandler.setLevel(Level.INFO);
    logger.addHandler(consoleHandler);

    // Uruchomienie aplikacji
    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        JFrame frame = new CalendarAppFrame(view);
        frame.setSize(1000, 800);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
      }
    });
  }

  // Klasa reprezentująca okienko aplikacji
  private static class CalendarAppFrame extends JFrame {
    public CalendarAppFrame(CalendarAppPanel panel) {
      setTitle("Uniwersalny kalendarz");
      add(panel);
    }
  }
}