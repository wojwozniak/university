package List05.Task1;

public class StarszySzeregowy extends AbstractMilitaryRank {
    public StarszySzeregowy() {
        super("StarszySzeregowy");
    }

    @Override
    protected int getRankOrder() {
        return 20;
    }
}