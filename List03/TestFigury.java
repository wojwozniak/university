public class TestFigury {
    public static void main(String[] args) {
        // Część 1: Punkty

        // Tworzenie punktów
        Punkt punkt1 = new Punkt(1.0, 2.0);
        Punkt punkt2 = new Punkt(3.0, 4.0);
        Punkt punkt4 = new Punkt(-5.0, 6.0);
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
        Prosta prosta3 = new Prosta(-3.0, 3.0, 3.0);

        // Przesuwamy prostą o wektor
        System.out.println("Prosta1: " + prosta1.a + "x + " + prosta1.b + "y + " + prosta1.c + " = 0");
        Prosta.przesuńProsta(prosta1, wektor1);
        System.out.println("Prosta1 po przesunięciu: " + prosta2.a + "x + " + prosta2.b + "y + " + prosta2.c + " = 0");        

        // Równoległość, prostopadłość, punkt przecięcia
        boolean czyRownolegle = Prosta.czyRównoległe(prosta1, prosta2);
        boolean czyProstopadle = Prosta.czyProstopadłe(prosta1, prosta2);
        Punkt punktPrzeciecia = Prosta.punktPrzecięcia(prosta1, prosta3);
        System.out.println("Czy proste są równoległe? " + czyRownolegle);
        System.out.println("Czy proste są prostopadłe? " + czyProstopadle);
        System.out.println("Punkt przecięcia prostych: " + punktPrzeciecia.x + ", " + punktPrzeciecia.y);


        // Część 4: Odcinek

        // Tworzenie odcinka
        Odcinek odcinek = new Odcinek(punkt1, punkt2);

        // Odbijamy względem punktu
        System.out.println("Odcinek: " + odcinek.punktA.x + ", " + odcinek.punktA.y + " - " + odcinek.punktB.x + ", " + odcinek.punktB.y);
        odcinek.obróć(punkt1, Math.PI / 2);
        System.out.println("Odcinek po obróceniu: " + odcinek.punktA.x + ", " + odcinek.punktA.y + " - " + odcinek.punktB.x + ", " + odcinek.punktB.y);


        
        // Część 5: Trójkąt

        // Tworzenie trójkąta
        Trojkat trojkat = new Trojkat(punkt1, punkt2, punkt4);

        // Przesuwamy trójkąt o wektor
        System.out.println("Trójkąt: " + trojkat.punktA.x + ", " + trojkat.punktA.y + " - " + trojkat.punktB.x + ", " + trojkat.punktB.y + " - " + trojkat.punktC.x + ", " + trojkat.punktC.y);
        trojkat.przesuń(wektor1);
        System.out.println("Trójkąt po przesunięciu: " + trojkat.punktA.x + ", " + trojkat.punktA.y + ", " + trojkat.punktB.x + ", " + trojkat.punktB.y + " - " + trojkat.punktC.x + ", " + trojkat.punktC.y);
    }
}