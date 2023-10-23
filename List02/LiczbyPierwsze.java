package List02;

public final class LiczbyPierwsze {
    private final static int POTEGA2 = 21;
    private final static int[] SITO = new int[1 << POTEGA2];

    static {
        for (int i = 2; i < SITO.length; i++) {
            SITO[i] = i;
        }
        for (int i = 2; i * i < SITO.length; i++) {
            if (SITO[i] == i) {
                for (int j = i * i; j < SITO.length; j += i) {
                    if (SITO[j] == j) {
                        SITO[j] = i;
                    }
                }
            }
        }
    }

    public static boolean czyPierwsza(long x) {
        if (x < 2) {
            return false;
        }
        return SITO[(int) x] == x;
    }

    public static long[] naCzynnikiPierwsze(long x) {
        if (x < 2) {
            return new long[] { x };
        }
        long[] czynniki = new long[64];
        int index = 0;
        while (x != 1) {
            int dzielnik = SITO[(int) x];
            czynniki[index++] = dzielnik;
            while (x % dzielnik == 0) {
                x /= dzielnik;
            }
        }
        long[] wynik = new long[index];
        System.arraycopy(czynniki, 0, wynik, 0, index);
        return wynik;
    }

    public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println("Proszę podać argumenty wywołania.");
            return;
        }

        for (String arg : args) {
            try {
                long liczba = Long.parseLong(arg);
                System.out.print(liczba + " = ");
                long[] czynniki = naCzynnikiPierwsze(liczba);
                for (int i = 0; i < czynniki.length; i++) {
                    System.out.print(czynniki[i]);
                    if (i < czynniki.length - 1) {
                        System.out.print(" * ");
                    }
                }
                System.out.println();
            } catch (NumberFormatException e) {
                System.err.println("Błąd: " + arg + " nie jest liczbą całkowitą.");
            }
        }
    }
}