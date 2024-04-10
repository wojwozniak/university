using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List04
{
    public class ShapeFactoryTests
    {
        [Fact]
        public void CreateSquareTest()
        {
            var factory = new ShapeFactory();
            var squareWorker = new SquareFactoryWorker();
            factory.RegisterWorker("Square", squareWorker);

            var square = factory.CreateShape("Square", 5);

            Assert.Equal(25, square.CalculateArea());
        }

        [Fact]
        public void CreateRectangleTest()
        {
            var factory = new ShapeFactory();
            var rectangleWorker = new RectangleFactoryWorker();
            factory.RegisterWorker("Rectangle", rectangleWorker);

            var rectangle = factory.CreateShape("Rectangle", 3, 5);

            Assert.Equal(15, rectangle.CalculateArea());
        }

        [Fact]
        public void CreateBothTest()
        {
            var factory = new ShapeFactory();
            var rectangleWorker = new RectangleFactoryWorker();
            factory.RegisterWorker("Rectangle", rectangleWorker);
            var squareWorker = new SquareFactoryWorker();
            factory.RegisterWorker("Square", squareWorker);

            var rectangle = factory.CreateShape("Rectangle", 3, 5);
            var square = factory.CreateShape("Square", 5);

            Assert.Equal(15, rectangle.CalculateArea());
            Assert.Equal(25, square.CalculateArea());
        }
    }

    public class Square : IShape
    {
        private readonly double sideLength;

        public Square(double sideLength)
        {
            this.sideLength = sideLength;
        }

        public double CalculateArea()
        {
            return sideLength * sideLength;
        }
    }

    public class Rectangle : IShape
    {
        private readonly double length;
        private readonly double width;

        public Rectangle(double length, double width)
        {
            this.length = length;
            this.width = width;
        }

        public double CalculateArea()
        {
            return length * width;
        }
    }

    public class SquareFactoryWorker : IShapeFactoryWorker
    {
        public IShape CreateShape(params object[] parameters)
        {
            if (parameters.Length != 1 || (parameters[0] is not double && parameters[0] is not int))
            {
                throw new ArgumentException("Invalid parameters");
            }

            double sideLength = Convert.ToDouble(parameters[0]);
            return new Square(sideLength);
        }
    }

    public class RectangleFactoryWorker : IShapeFactoryWorker
    {
        public IShape CreateShape(params object[] parameters)
        {
            if (parameters.Length != 2 || (parameters[0] is not double && parameters[0] is not int) || (parameters[1] is not double && parameters[0] is not int))
            {
                throw new ArgumentException("Invalid parameters");
            }

            double length = Convert.ToDouble(parameters[0]);
            double width = Convert.ToDouble(parameters[1]);
            return new Rectangle(length, width);
        }
    }
}
