using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List06
{
    public class Context
    {
        // W kontekście tworzymy słownik w którym przechowujemy zmienne
        // W GetValue i SetValue obsługujemy ten słownik
        private readonly Dictionary<string, bool> variables = new();

        public bool GetValue(string VariableName)
        {
            if (variables.TryGetValue(VariableName, out bool value))
                return value;
            else
                throw new ArgumentException($"{VariableName} does not exist");
        }

        public void SetValue(string VariableName, bool Value)
        {
            if (variables.ContainsKey(VariableName))
                variables[VariableName] = Value;
            else
                variables.Add(VariableName, Value);
        }
    }

    public abstract class AbstractExpression
    {
        public abstract bool Interpret(Context context);
    }

    // Stała - zwracamy wartość
    public class ConstExpression : AbstractExpression
    {
        private readonly bool value;

        public ConstExpression(bool value)
        {
            this.value = value;
        }

        public override bool Interpret(Context context)
        {
            return value;
        }
    }

    // Wyrażenie binarne - zwracamy wynik wyrażenia dla dwóch argumentów
    public class BinaryExpression : AbstractExpression
    {
        private readonly AbstractExpression left;
        private readonly AbstractExpression right;
        private readonly Func<bool, bool, bool> operatorFunc;

        public BinaryExpression(AbstractExpression left, AbstractExpression right, Func<bool, bool, bool> operatorFunc)
        {
            this.left = left;
            this.right = right;
            this.operatorFunc = operatorFunc;
        }

        public override bool Interpret(Context context)
        {
            bool leftValue = left.Interpret(context);
            bool rightValue = right.Interpret(context);
            return operatorFunc(leftValue, rightValue);
        }
    }

    // Wyrażenie unarne - zwracamy wynik wyrażenia dla jednego argumentu
    public class UnaryExpression : AbstractExpression
    {
        private readonly AbstractExpression expression;
        private readonly Func<bool, bool> operatorFunc;

        public UnaryExpression(AbstractExpression expression, Func<bool, bool> function)
        {
            this.expression = expression;
            this.operatorFunc = function;
        }

        public override bool Interpret(Context context)
        {
            bool value = expression.Interpret(context);
            return operatorFunc(value);
        }
    }

    public class Program3
    {
        static void Main3(string[] args)
        {
            Context ctx = new();
            ctx.SetValue("x", false);
            ctx.SetValue("y", true);

            // Nasze przykładowe wyrażenie
            AbstractExpression exp = new BinaryExpression(
                new ConstExpression(true),
                new UnaryExpression(new ConstExpression(true), (arg) => !arg),
                (left, right) => left || right
            ); // prawda || (prawda => fałsz) czyli prawda

            // Test
            bool value = exp.Interpret(ctx);
            Console.WriteLine(value);

            // Drugi przykład
            AbstractExpression exp2 = new BinaryExpression(
                new ConstExpression(false),
                new UnaryExpression(new ConstExpression(true), (arg) => !arg),
                (left, right) => left || right
            ); // fałsz || (prawda => fałsz) czyli fałsz

            // Test2
            bool value2 = exp2.Interpret(ctx);
            Console.WriteLine(value2);
        }
    }
}
