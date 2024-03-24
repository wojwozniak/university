using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List05.Task03
{
    class Program
    {
        class ComparisonAdapter : IComparer
        {
            private readonly Comparison<int> _comparison;

            public ComparisonAdapter(Comparison<int> comparison)
            {
                _comparison = comparison;
            }

            // Implemetujemy Compare - wymagane przez IComparer
            public int Compare(object? x, object? y)
            {
                if (x is not int || y is not int)
                {
                    throw new ArgumentException("Wrong argument error");
                }
                return _comparison((int)x, (int)y);
            }
        }

        // To mamy przerobić (jak podstawimy y za x to zamienimy kolejność i zobaczymy że rzeczywiście przerabiamy)
        static int IntComparer(int x, int y)
        {
            return x.CompareTo(y);
        }

        static void Main(string[] args)
        {
            ArrayList a = new() { 1, 5, 3, 3, 2, 4, 3 };

            a.Sort(new ComparisonAdapter(IntComparer));

            foreach (var item in a)
            {
                Console.Write(item + " ");
            }
        }
    }
}
