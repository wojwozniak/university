using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace databaseslist06.Classes
{
    public class Book
    {
        public int Id { get; set; }

        [BsonElement("ISBN")]
        public string ISBN { get; set; }

        [BsonElement("title")]
        public string Title { get; set; }

        [BsonElement("author")]
        public string Author { get; set; }

        [BsonElement("year_of_publication")]
        public int YearOfPublication { get; set; }

        [BsonElement("price")]
        public decimal Price { get; set; }

        [BsonElement("borrowed_last_month")]
        public bool BorrowedLastMonth { get; set; }

        [BsonElement("copies")]
        public List<Copy> Copies { get; set; }
    }
}
