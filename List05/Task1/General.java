package List05.Task1;

public class General extends AbstractMilitaryRank {
    public General() {
        super("General");
    }

    @Override
    protected int getRankOrder() {
        return 40;
    }
}