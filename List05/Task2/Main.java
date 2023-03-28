/*
* Wojciech Woźniak
* Lista 5: Zadanie 2
* (Korzystam z kompilatora replit.com)
* Można z niego skorzystać za pomocą
* konta github.com -> new replit,
* przeklejamy kod i klikamy run
*/

// Klasa wyrażenia zawierająca metody
// evaluate() i toString()
abstract class Expression {
    // Metoda obliczająca wartość wyrażenia
    public abstract int evaluate();

    // Metoda zwracająca wyrażenie w postaci
    // np. (a + b)
    public abstract String toString();
}

// Klasa stałej rozszerzająca klasę wyrażenie,
// zawierająca wartość stałej
class Const extends Expression {
    private int value;

    public Const(int value) {
        this.value = value;
    }

    public int evaluate() {
        return value;
    }

    public String toString() {
        return Integer.toString(value);
    }
}

// Klasa zmiennej zawierająca 
// nazwę zmiennej i jej wartość
class Variable extends Expression {
    private String name;
    private int value;

    public Variable(String name) {
        this.name = name;
    }

    public int evaluate() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String toString() {
        return name;
    }
}

// Klasa operatora binarnego zawierająca lewą i prawą jego stronę
abstract class BinaryOperator extends Expression {
    protected Expression left;
    protected Expression right;

    public BinaryOperator(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }
}

// Klasa dodawania
class Add extends BinaryOperator {
    public Add(Expression left, Expression right) {
        super(left, right);
    }

    public int evaluate() {
        return left.evaluate() + right.evaluate();
    }

    public String toString() {
        return "(" + left.toString() + " + " + right.toString() + ")";
    }
}

// Klasa mnożenia
class Multiply extends BinaryOperator {
    public Multiply(Expression left, Expression right) {
        super(left, right);
    }

    public int evaluate() {
        return left.evaluate() * right.evaluate();
    }

    public String toString() {
        return "(" + left.toString() + " * " + right.toString() + ")";
    }

}

// Klasa główna z testami
public class Main {
    public static void main(String[] args) {

        // Test dodawania
        Expression expr1 = new Add(new Const(2), new Const(3));
        // Oczekiwane: (2 + 3)
        System.out.println(expr1.toString());
        // Oczekiwane: 5
        System.out.println(expr1.evaluate());



        // Mnożenie stalej przez zmienną
        Expression expr2 = new Multiply(new Const(4), new Variable("x"));
        // Oczekiwane: (4 * x)
        System.out.println(expr2.toString());

        // Bierzemy prawą część wyrażenia expr2
        // rzutowanego na typ BinaryOperator,
        // a następnie rzutujemy na typ Variable
        Variable var1 = (Variable) ((BinaryOperator)expr2).right;

        // Ustawiamy wartość zmiennej na 5
        var1.setValue(5);

        // Oczekiwane: 20
        System.out.println(expr2.evaluate());

        
        // Dodawanie dwóch zmiennych
        Expression expr3 = new Add(new Variable("a"), new Variable("b"));

        // Oczekiwane: (a + b)
        System.out.println(expr3.toString());

        // j.w. (test2)
        Variable var2 = (Variable) ((BinaryOperator)expr3).left;
        Variable var3 = (Variable) ((BinaryOperator)expr3).right;

        // Ustawiamy wartości zmiennych
        var2.setValue(3);
        var3.setValue(4);

        // Oczekiwane: 7
        System.out.println(expr3.evaluate());
    }
}