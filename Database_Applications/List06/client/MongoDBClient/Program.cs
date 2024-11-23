using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using System;

/*

> db.authors.save({_id:1, name:"Golden"});
> db.authors.save({_id:2, name:"Golding"});
> db.authors.save({_id:3, name:"Bułhakow"});

 */

namespace MongoDBClient
{
    public class Author
    {
        [BsonElement("_id")]
        public object Id { get; set; }

        [BsonElement("name")]
        public string Name { get; set; }
    }
    class Program
    {
        static void Main(string[] args)
        {
            var client = new MongoClient();
            var library = client.GetDatabase("library");
            var authors = library.GetCollection<Author>("authors");
            var items = from b in authors.AsQueryable()
                        select b;

            foreach (var e in items)
            {
                Console.WriteLine(e.Name);
            }
        }
    }
}
