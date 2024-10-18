import obliczenia.*;
import obliczenia.dzialania.*;
import obliczenia.operandy.*;
import obliczenia.dzialania.funkcje.*;
import struktury.*;

public class task4 {
    public static void main(String[] args) {
        // Test 1
        //  7.2 + x=1.618 * 2.4
        Zmienna.zapiszZmienna("x", 1.618);
        Wyrazenie w1 = new Dodawanie(
                new Liczba(7.2),
                new Mnożenie(
                        new Zmienna("x"),
                        new Liczba(2.4)));
        
        System.out.println("Test nr. 1");
        System.out.println("Oczekiwane:");
        System.out.println("(7.2 + (x = 1.618 * 2.4))");
        System.out.println("11.0832");
        System.out.println("Otrzymane:");
        System.out.println(w1.toString());
        System.out.println(w1.oblicz());

        // Test 2
        // 7 + 5 * 3 - 1
        Wyrazenie w2 = new Odejmowanie(
                new Dodawanie(
                        new Liczba(7),
                        new Mnożenie(
                                new Liczba(5),
                                new Liczba(3))),
                new Liczba(1));

        System.out.println("Test nr. 2");
        System.out.println("Oczekiwane:");
        System.out.println("((7 + (5 * 3)) - 1)");
        System.out.println("21.0");
        System.out.println("Otrzymane:");
        System.out.println(w2.toString());
        System.out.println(w2.oblicz());

        // Test 3
        // ~ ((2 - x) * e)
        Wyrazenie w3 = new Odwrotność(
                new Mnożenie(
                        new Odejmowanie(
                                new Liczba(2),
                                new Zmienna("x")),
                        new E()));
        
        System.out.println("Test nr. 3");
        System.out.println("Oczekiwane:");
        System.out.println("(1 / ((2 - (x = 1.618)) * E))");
        System.out.println("0.9630351863126767");
        System.out.println("Otrzymane:");
        System.out.println(w3.toString());
        System.out.println(w3.oblicz());


        // Test 4
        // (3 * π - 1) / (x + 5)
        Wyrazenie w4 = new Dzielenie(
                new Odejmowanie(
                        new Mnożenie(
                                new Liczba(3),
                                new Pi()),
                        new Liczba(1)),
                new Dodawanie(
                        new Zmienna("x"),
                        new Liczba(5)));
        
        System.out.println("Test nr. 4");
        System.out.println("Oczekiwane:");
        System.out.println("(((3 * PI) - 1) / ((x = 1.618) + 5))");
        System.out.println("1.2730096646674793");
        System.out.println("Otrzymane:");
        System.out.println(w4.toString());
        System.out.println(w4.oblicz());

        
        // Test 5
        // sin((x + 13) * π / (1 - x))
        Wyrazenie w5 = new Sinus(
                new Dzielenie(
                        new Mnożenie(
                                new Dodawanie(
                                        new Zmienna("x"),
                                        new Liczba(13)),
                                new Pi()),
                        new Odejmowanie(
                                new Liczba(1),
                                new Zmienna("x"))));
        
        System.out.println("Test nr. 5");
        System.out.println("Oczekiwane:");
        System.out.println("sin(((x = 1.618) + 13) * PI / (1 - (x = 1.618)))");
        System.out.println("0.8856376819867658");
        System.out.println("Otrzymane:");
        System.out.println(w5.toString());
        System.out.println(w5.oblicz());


        // Test 6
        // exp(5) + x * log(e, x) 
        Wyrazenie w6 = new Dodawanie(
                new Eksponenta(
                        new Liczba(5)),
                new Mnożenie(
                        new Zmienna("x"),
                        new Logarytm(
                                new E(),
                                new Zmienna("x"))));
        
        System.out.println("Test nr. 6");
        System.out.println("Oczekiwane:");
        System.out.println("(E ^ 5 + (x = 1.618) * log(E, (x = 1.618)))");
        System.out.println("149.1917258471301");
        System.out.println("Otrzymane:");
        System.out.println(w6.toString());
        System.out.println(w6.oblicz());


        // Teraz jeszcze test klonowania (clone)
        // Test 7
        Para p1 = new Para("x", 1.618);
        Para p2 = p1.clone();
        p2.setWartość(2.718);
        System.out.println("Test nr. 7");
        System.out.println("Oczekiwane:");
        System.out.println("Para{klucz='x', wartość=1.618}");
        System.out.println("Para{klucz='x', wartość=2.718}");
        System.out.println("Otrzymane:");
        System.out.println(p1.toString());
        System.out.println(p2.toString());     

        // Test equals na wyrażeniach
        // Test 8
        Wyrazenie w7 = new Dodawanie(
                new Liczba(1),
                new Liczba(2));
        Wyrazenie w8 = new Dodawanie(
                new Liczba(1),
                new Liczba(2));
        
        System.out.println("Test nr. 8");
        System.out.println("Oczekiwane:");
        System.out.println("true");
        System.out.println("Otrzymane:");
        System.out.println(w7.equals(w8));


        // Test klonowania mnożenia
        // Test 9
        Mnożenie w9 = new Mnożenie(
                new Liczba(1),
                new Liczba(2));
        Mnożenie w10 = w9.clone();
        System.out.println("Test nr. 9");
        System.out.println("Oczekiwane:");
        System.out.println("(1 * 2)");
        System.out.println("Otrzymane:");
        System.out.println(w10.toString());
    }
}