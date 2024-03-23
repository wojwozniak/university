namespace List04
{
    public class SingletonTests
    {
        [Fact]
        public void TestInstanceProcessWide()
        {
            var instance1 = Singleton.InstanceProcessWide;
            var instance2 = Singleton.InstanceProcessWide;
            Assert.Same(instance1, instance2);
        }

        [Fact]
        public void TestInstancePerThread()
        {
            var instance1 = Singleton.InstancePerThread;
            var instance2 = Singleton.InstancePerThread;
            Assert.Same(instance1, instance2);
        }

        [Fact]
        public void TestInstanceForFiveSeconds()
        {
            var instance1 = Singleton.InstanceForFiveSeconds;
            Thread.Sleep(2000); // sleep 2s
            var instance2 = Singleton.InstanceForFiveSeconds;
            Assert.Same(instance1, instance2);

            Thread.Sleep(5000); // sleep 5s
            var instance3 = Singleton.InstanceForFiveSeconds;
            Assert.NotSame(instance2, instance3);
        }
    }
}