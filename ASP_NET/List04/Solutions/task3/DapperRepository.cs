using Dapper;
using list04task03;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace list04task03
{
    public class DapperRepository<T> : IDapperRepository<T>
    {
        private readonly SqlConnection _connection;

        public DapperRepository(IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("DefaultConnection");
            _connection = new SqlConnection(connectionString);
        }

        public IEnumerable<T> GetAll()
        {
            return _connection.Query<T>($"SELECT * FROM {typeof(T).Name}s");
        }

        public T GetById(int id)
        {
            return _connection.QuerySingleOrDefault<T>($"SELECT * FROM {typeof(T).Name}s WHERE Id = @Id", new { Id = id });
        }

        public int Insert(T entity)
        {
            return _connection.Execute($"INSERT INTO {typeof(T).Name}s VALUES (@entity)", entity);
        }

        public int Update(T entity)
        {
            return _connection.Execute($"UPDATE {typeof(T).Name}s SET /* pola do aktualizacji */ WHERE Id = @Id", entity);
        }

        public int Delete(int id)
        {
            return _connection.Execute($"DELETE FROM {typeof(T).Name}s WHERE Id = @Id", new { Id = id });
        }

        public void Dispose()
        {
            _connection.Dispose();
        }
    }
}