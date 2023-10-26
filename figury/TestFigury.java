package figury;


public class TestFigury {
    public static void main(String[] args) {
        // Część 1: Punkty

        // Tworzenie punktów
        Punkt punkt1 = new Punkt(1.0, 2.0);
        Punkt punkt2 = new Punkt(3.0, 4.0);
        Punkt punkt3 = new Punkt(5.0, 6.0);
        System.out.println("Punkt 1: " + punkt1.x + ", " + punkt1.y);

    

        // Część 2: Wektory

        // Tworzenie wektorów
        Wektor wektor1 = new Wektor(2.0, 3.0);
        Wektor wektor2 = new Wektor(4.0, 6.0);

        // Składamy wektor1 i wektor2
        Wektor suma = Wektor.złożWektory(wektor1, wektor2);
        System.out.println("Suma wektorów: " + suma.x + ", " + suma.y);



        // Część 3: Proste

        // Tworzenie prostych
        Prosta prosta1 = new Prosta(1.0, 1.0, 1.0);
        Prosta prosta2 = new Prosta(2.0, 2.0, 2.0);

        // Przesuwamy prostą o wektor
        System.out.println("Prosta1: " + prosta1);
        Prosta.przesuńProsta(prosta1, wektor1);
        System.out.println("Prosta1 po przesunięciu: " + prosta1);        

        // Równoległość, prostopadłość, punkt przecięcia
        boolean czyRownolegle = Prosta.czyRównoległe(prosta1, prosta2);
        boolean czyProstopadle = Prosta.czyProstopadłe(prosta1, prosta2);
        Punkt punktPrzeciecia = Prosta.punktPrzecięcia(prosta1, prosta2);
        System.out.println("Czy proste są równoległe? " + czyRownolegle);
        System.out.println("Czy proste są prostopadłe? " + czyProstopadle);
        System.out.println("Punkt przecięcia prostych: " + punktPrzeciecia);


        // Część 4: Odcinek

        // Tworzenie odcinka
        Odcinek odcinek = new Odcinek(punkt1, punkt2);

        // Odbijamy względem punktu
        System.out.println("Odcinek: " + odcinek);
        odcinek.obróć(punkt1, Math.PI / 2);
        System.out.println("Odcinek po obróceniu: " + odcinek);


        
        // Część 5: Trójkąt

        // Tworzenie trójkąta
        Trojkat trojkat = new Trojkat(punkt1, punkt2, punkt3);

        // Przesuwamy trójkąt o wektor
        System.out.println("Trójkąt: " + trojkat);
        trojkat.przesuń(wektor1);
        System.out.println("Trójkąt po przesunięciu: " + trojkat);
    }
}