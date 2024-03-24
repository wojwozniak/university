using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List05.Task05a
{
    public interface IRetryProxy<T>
    {
        void Invoke();
    }

    public class RetryProxy<T> : IRetryProxy<T>
    {
        private readonly int maxRetries;
        private readonly T original;

        public RetryProxy(int maxRetries, T original)
        {
            this.maxRetries = maxRetries;
            this.original = original;
        }

        public void Invoke()
        {
            int retries = 0;
            while (retries < maxRetries)
            {
                try
                {
                    original.Method();
                    return;
                }
                catch (Exception)
                {
                    retries++;
                    Console.WriteLine($"Retrying... Attempt {retries}");
                }
            }
            Console.WriteLine("Max retries reached. Giving up.");
        }
    }
}
