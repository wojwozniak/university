using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List04
{
    public interface IShapeFactoryWorker
    {
        IShape CreateShape(params object[] parameters);
    }

    public interface IShape
    {
        double CalculateArea();
    }

    public class ShapeFactory
    {
        private IShapeFactoryWorker? worker;

        public void RegisterWorker(IShapeFactoryWorker worker)
        {
            this.worker = worker;
        }

        public IShape CreateShape(string shapeName, params object[] parameters)
        {
            if (worker == null)
            {
                throw new InvalidOperationException("No registration");
            }

            return worker.CreateShape(parameters);
        }
    }
}
