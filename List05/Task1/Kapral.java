package List05.Task1;

public class Kapral extends AbstractMilitaryRank {
    public Kapral() {
        super("Kapral");
    }

    @Override
    protected int getRankOrder() {
        return 30;
    }
}
