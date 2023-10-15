package List01;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

public class Powitanie {
    private static String[] rzymskie = {
        "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"
    };
    private static int[] arabskie = {
        1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
    };

    public static String rzymska(int n) {
        if (n <= 0 || n >= 4000) {
            throw new IllegalArgumentException("liczba " + n + " spoza zakresu 1-3999");
        }

        StringBuilder wynik = new StringBuilder();
        int i = 0;

        while (n > 0) {
            if (n >= arabskie[i]) {
                wynik.append(rzymskie[i]);
                n -= arabskie[i];
            } else {
                i++;
            }
        }

        return wynik.toString();
    }

    public static void main(String[] args) {
        try {
            System.setIn(new FileInputStream(FileDescriptor.in));
            System.setOut(new PrintStream(new FileOutputStream(FileDescriptor.out), true, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Scanner scanner = new Scanner(System.in);

        System.out.print("Podaj swoje imię: ");
        String imie = scanner.nextLine();

        System.out.print("Podaj rok urodzenia: ");
        int rokUrodzenia = scanner.nextInt();

        int aktualnyRok = java.time.Year.now().getValue();
        int wiek = aktualnyRok - rokUrodzenia;

        System.out.println("Cześć " + imie + "! Twój wiek to " + wiek + " lat.");

        String rokRzymski = rzymska(rokUrodzenia);
        System.out.println("Twój rok urodzenia w zapisie rzymskim: " + rokRzymski);

        int indeksZwierzecia = (rokUrodzenia - 1900) % 12;
        
        String patronZKalendarza = "";
        
        switch (indeksZwierzecia) {
            case 0:
                patronZKalendarza = "Szczur";
                break;
            case 1:
                patronZKalendarza = "Bawół";
                break;
            case 2:
                patronZKalendarza = "Tygrys";
                break;
            case 3:
                patronZKalendarza = "Królik";
                break;
            case 4:
                patronZKalendarza = "Smok";
                break;
            case 5:
                patronZKalendarza = "Wąż";
                break;
            case 6:
                patronZKalendarza = "Koń";
                break;
            case 7:
                patronZKalendarza = "Owca";
                break;
            case 8:
                patronZKalendarza = "Małpa";
                break;
            case 9:
                patronZKalendarza = "Kurczak";
                break;
            case 10:
                patronZKalendarza = "Pies";
                break;
            case 11:
                patronZKalendarza = "Świnia";
                break;
            default:
                patronZKalendarza = "Nieznany";
        }
        
        System.out.println("Twój patron z kalendarza chińskiego to: " + patronZKalendarza);
        scanner.close();
    }
}