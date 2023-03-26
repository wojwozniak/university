package List05.Task1;


public class TestRanks {
    public static void main(String[] args) {
        MilitaryRank rank1 = new Szeregowy();
        MilitaryRank rank2 = new General();

        // Test for getName() method
        System.out.println(rank1.getName().equals("Szeregowy")); // expected output: true
        System.out.println(rank2.getName().equals("General")); // expected output: true

        // Test for compareTo() method
        System.out.println(rank1.compareTo(rank2) < 0); // expected output: true
        System.out.println(rank2.compareTo(rank1) > 0); // expected output: true
        System.out.println(rank1.compareTo(rank1) == 0); // expected output: true
    }
}