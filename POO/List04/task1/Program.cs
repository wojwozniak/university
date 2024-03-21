using System;
using System.Threading;

public class Singleton
{
    // Jedna instancja dla całego procesu
    private static readonly Lazy<Singleton> instanceProcessWide =
        new Lazy<Singleton>(() => new Singleton(), LazyThreadSafetyMode.ExecutionAndPublication);

    // Jedna osobna instancja dla każdego wątka
    private static readonly ThreadLocal<Singleton> instancePerThread =
        new ThreadLocal<Singleton>(() => new Singleton());

    // Jedna instancja na co najwyżej 5 kolejnych sekund
    private static Singleton? instanceForFiveSeconds;
    private static readonly object lockObject = new object();
    private static DateTime lastAccessTime;

    public static Singleton? InstanceProcessWide => instanceProcessWide.Value;

    public static Singleton? InstancePerThread => instancePerThread.Value;

    public static Singleton InstanceForFiveSeconds
    {
        get
        {
            lock (lockObject)
            {
                if (instanceForFiveSeconds == null || (DateTime.Now - lastAccessTime).TotalSeconds >= 5)
                {
                    instanceForFiveSeconds = new Singleton();
                    lastAccessTime = DateTime.Now;
                }
                return instanceForFiveSeconds;
            }
        }
    }

    private Singleton() { }
}

// Testy jednostkowe
public class SingletonTests
{
    // Test pojedyńczej instancji - sprawdzamy czy nie powstaną dwie instancje.
    public void TestInstanceProcessWide()
    {
        var instance1 = Singleton.InstanceProcessWide;
        var instance2 = Singleton.InstanceProcessWide;
        if (instance1 != instance2)
        {
            throw new Exception("InstanceProcessWide error 1");
        }
    }

    // Jesteśmy w jednym wątku, więc no zadziała to tak samo
    public void TestInstancePerThread()
    {
        var instance1 = Singleton.InstancePerThread;
        var instance2 = Singleton.InstancePerThread;
        if (instance1 != instance2)
        {
            throw new Exception("InstancePerThread error 1");
        }
    }

    public void TestInstanceForFiveSeconds()
    {
        var instance1 = Singleton.InstanceForFiveSeconds;
        Thread.Sleep(2000); // sleep 2s
        var instance2 = Singleton.InstanceForFiveSeconds;
        if (instance1 != instance2)
        {
            throw new Exception("InstanceForFiveSeconds - error 1 - powstała nowa instancja");
        }
        Thread.Sleep(5000); // sleep 5s
        var instance3 = Singleton.InstanceForFiveSeconds;
        if (instance2 == instance3)
        {
            throw new Exception("InstanceForFiveSeconds - error 2 - nie powstała nowa instancja");
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        var singletonTests = new SingletonTests();

        Console.WriteLine("Testing InstanceProcessWide...");
        PrintTestResult(() => singletonTests.TestInstanceProcessWide());

        Console.WriteLine("Testing InstancePerThread...");
        PrintTestResult(() => singletonTests.TestInstancePerThread());

        Console.WriteLine("Testing InstanceForFiveSeconds...");
        PrintTestResult(() => singletonTests.TestInstanceForFiveSeconds());
    }

    static void PrintTestResult(Action test)
    {
        try
        {
            test();
            Console.WriteLine("Test passed.\n");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Test failed: {ex.Message}\n");
        }
    }
}