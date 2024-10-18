using System;
using System.Collections.Generic;

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
        private Dictionary<string, IShapeFactoryWorker> workers = new Dictionary<string, IShapeFactoryWorker>();

        public void RegisterWorker(string shapeName, IShapeFactoryWorker worker)
        {
            if (workers.ContainsKey(shapeName))
            {
                throw new InvalidOperationException($"Worker for shape '{shapeName}' is already registered.");
            }
            workers.Add(shapeName, worker);
        }

        public IShape CreateShape(string shapeName, params object[] parameters)
        {
            if (!workers.ContainsKey(shapeName))
            {
                throw new InvalidOperationException($"No worker registered for shape '{shapeName}'.");
            }

            var worker = workers[shapeName];
            return worker.CreateShape(parameters);
        }
    }
}