package List05.Task1;

// Obchodzimy błąd najpierw korzystając
// z extends, a później klasy abstrakcyjnej
// i 'implements'
interface MilitaryRank extends Comparable<MilitaryRank> {
    String getName();
}

// Klasa abstrakcyjna, która implementuje 
// interfejs MilitaryRank
abstract class AbstractMilitaryRank implements MilitaryRank {
    private final String name;

    public AbstractMilitaryRank(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
  public int compareTo(MilitaryRank other) {
        return Integer.compare(getRankOrder(), ((AbstractMilitaryRank) other).getRankOrder());
    }

    protected abstract int getRankOrder();
}


// 4 klasy ze stopniami wojskowymi,
// rozszerzające AbstractMilitaryRank
class Szeregowy extends AbstractMilitaryRank {
    public Szeregowy() {
        super("Szeregowy");
    }

    protected int getRankOrder() {
        return 10;
    }
}

class StarszySzeregowy extends AbstractMilitaryRank {
    public StarszySzeregowy() {
        super("StarszySzeregowy");
    }

    @Override
    protected int getRankOrder() {
        return 20;
    }
}

class Kapral extends AbstractMilitaryRank {
    public Kapral() {
        super("Kapral");
    }

    @Override
    protected int getRankOrder() {
        return 30;
    }
}

class General extends AbstractMilitaryRank {
    public General() {
        super("General");
    }

    @Override
    protected int getRankOrder() {
        return 40;
    }
}


// Klasa główna z testami
class Main {
    public static void main(String[] args) {
        MilitaryRank rank1 = new Szeregowy();
        MilitaryRank rank2 = new General();

        // Test dla getName
        System.out.println(rank1.getName().equals("Szeregowy")); 
        System.out.println(rank2.getName().equals("General")); 

        // Testy porównań
        System.out.println(rank1.compareTo(rank2) < 0);
        System.out.println(rank2.compareTo(rank1) > 0); 
        System.out.println(rank1.compareTo(rank1) == 0); 

      // Z testów oczekujemy 5x 'true'
    }
}