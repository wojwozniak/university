package List05.Task1;

public class Szeregowy extends AbstractMilitaryRank {
    public Szeregowy() {
        super("Szeregowy");
    }

    protected int getRankOrder() {
        return 10;
    }
}