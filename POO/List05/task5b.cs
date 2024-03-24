using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List05.Task05b
{
    public interface IService
    {
        Task<int> DoSomethingAsync();
    }

    public class RealService : IService
    {
        public async Task<int> DoSomethingAsync()
        {
            Console.WriteLine("service");
            await Task.Delay(2000);
            return 42;
        }
    }

    public class HedgingProxy : IService
    {
        private readonly IService _service;
        private readonly IService _backupService;

        public HedgingProxy(IService service, IService backupService)
        {
            _service = service;
            _backupService = backupService;
        }

        public async Task<int> DoSomethingAsync()
        {
            var task = _service.DoSomethingAsync();
            var backupTask = _backupService.DoSomethingAsync();

            var timeout = Task.Delay(1000);
            var completedTask = await Task.WhenAny(task, timeout);

            if (completedTask == task)
            {
                return await task;
            }
            else
            {
                Console.WriteLine("Original operation timed out. Using backup service.");
                return await backupTask;
            }
        }
    }
}
