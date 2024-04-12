using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List06
{
    public interface ILogger
    {
        void Log(string message);
    }

    public enum LogType { None, Console, File }

    public class LoggerFactory
    {
        private static readonly LoggerFactory instance = new();

        private LoggerFactory() { }

        public static LoggerFactory Instance { get { return instance; } }

        public static ILogger GetLogger(LogType logType, string parameters = null)
        {
            // Tu dajemy switcha zwracającego odp. loggera
            return logType switch
            {
                LogType.None => new NullLogger(),
                LogType.Console => new ConsoleLogger(),
                LogType.File => new FileLogger(parameters),
                _ => throw new ArgumentException("Invalid log type specified"),
            };
        }
    }

    // Napisane przez nas loggery - konsolowy, plikowy, null
    public class ConsoleLogger : ILogger
    {
        public void Log(string message)
        {
            Console.WriteLine(message);
        }
    }

    public class FileLogger : ILogger
    {
        private readonly string filePath;

        public FileLogger(string filePath)
        {
            this.filePath = filePath;
        }

        public void Log(string message)
        {
            using StreamWriter writer = new(filePath, true);
            writer.WriteLine(message);
        }
    }

    public class NullLogger : ILogger
    {
        public void Log(string message)
        {
            // nullowy nie robi nic
        }
    }

    // nazwa zmieniona by sie odpalalo w innych miejscach, usunac jedynki by odpalic tutaj
    public class Program1
    {
        static void Main1(string[] args)
        {
            ILogger logger1 = LoggerFactory.GetLogger(LogType.Console);
            logger1.Log("foo bar");

            ILogger logger2 = LoggerFactory.GetLogger(LogType.None);
            logger2.Log("qux");
        }
    }
}
