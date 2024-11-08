using System.Collections.Generic;

namespace list04task03
{
    public interface IDapperRepository<T> : IDisposable
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        int Insert(T entity);
        int Update(T entity);
        int Delete(int id);
    }
}