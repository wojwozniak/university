using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List0004
{
    public class Singleton
    {
        private static readonly Lazy<Singleton> instanceProcessWide =
            new Lazy<Singleton>(() => new Singleton(), LazyThreadSafetyMode.ExecutionAndPublication);

        private static readonly ThreadLocal<Singleton> instancePerThread =
            new ThreadLocal<Singleton>(() => new Singleton());

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
}
