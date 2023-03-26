package List05.Task1;

// Obchodzimy błąd najpierw korzystając
// z extends, a później klasy abstrakcyjnej
// i 'implements'
public interface MilitaryRank extends Comparable<MilitaryRank> {
    String getName();
}