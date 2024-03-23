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
            new(() => new Singleton(), LazyThreadSafetyMode.ExecutionAndPublication);
        public static Singleton? InstanceProcessWide => instanceProcessWide.Value;

        private static readonly ThreadLocal<Singleton> instancePerThread =
            new(() => new Singleton());
        public static Singleton? InstancePerThread => instancePerThread.Value;

        private static Singleton? instanceForFiveSeconds;
        private static readonly object lockObject = new();
        private static DateTime lastAccessTime;

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
