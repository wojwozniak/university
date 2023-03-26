package List05.Task1;

// Klasa abstrakcyjna, która implementuje 
// interfejs MilitaryRank (rozszerzający Ordered)
public abstract class AbstractMilitaryRank implements MilitaryRank {
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
