package List03.test;

import List03.figury.*;


public class TestFigury {
    public static void main(String[] args) {
        // Część 1: Punkty

        // Tworzenie punktów
        Punkt punkt1 = new Punkt(1.0, 2.0);
        //Punkt punkt2 = new Punkt(3.0, 4.0);
        //Punkt punkt3 = new Punkt(5.0, 6.0);
        //Punkt punkt4 = new Punkt(7.0, 9.5);
        System.out.println("Punkt 1: " + punkt1.x + ", " + punkt1.y);

    
        // Część 2: Wektory

        // Tworzenie wektorów
        Wektor wektor1 = new Wektor(2.0, 3.0);
        Wektor wektor2 = new Wektor(4.0, 6.0);

        // Składamy wektor1 i wektor2
        //Wektor suma = Wektor.złożWektory(wektor1, wektor2);
        //System.out.println("Suma wektorów: " + suma.x + ", " + suma.y);

        /*
        // Tworzenie odcinka
        Odcinek odcinek = new Odcinek(punkt1, punkt2);

        // Tworzenie trójkąta
        Trojkat trojkat = new Trojkat(punkt1, punkt2, punkt3);

        // Obrót punktu
        punkt2.obroc(punkt1, 90.0); // Obrót o 90 stopni wokół punktu punkt1

        // Odbicie punktu
        Prosta prosta = new Prosta(1.0, 1.0, 0.0); // Przykładowa prosta Ax + By + C = 0
        punkt3.odbij(prosta); // Odbicie punktu względem prostej

        // Testy klas Wektor i Prosta
        Wektor wektor1 = new Wektor(1.0, 2.0);
        Wektor wektor2 = new Wektor(2.0, 3.0);
        Wektor suma = Wektor.skladajWektory(wektor1, wektor2);

        Prosta prosta1 = new Prosta(1.0, 1.0, 1.0);
        Prosta prosta2 = new Prosta(2.0, 2.0, 2.0);
        boolean czyRownolegle = Prosta.czyRownolegle(prosta1, prosta2);
        boolean czyProstopadle = Prosta.czyProstopadle(prosta1, prosta2);
        Punkt punktPrzeciecia = Prosta.punktPrzeciecia(prosta1, prosta2);

        // Wyświetlenie wyników
        System.out.println("Suma wektorów: " + suma);
        System.out.println("Czy proste są równoległe? " + czyRownolegle);
        System.out.println("Czy proste są prostopadłe? " + czyProstopadle);
        System.out.println("Punkt przecięcia prostych: " + punktPrzeciecia);
        */
    }
}