using MongoDB.Bson.Serialization.Attributes;

namespace databaseslist06.Classes
{
    public class Copy
    {
        [BsonElement("copyId")]
        public int CopyId { get; set; }

        [BsonElement("signature")]
        public string Signature { get; set; }

        [BsonElement("status")]
        public string Status { get; set; }

        [BsonElement("borrowedBy")]
        public int? BorrowedBy { get; set; }

        [BsonElement("borrowDate")]
        public DateTime? BorrowDate { get; set; }

        [BsonElement("returnDate")]
        public DateTime? ReturnDate { get; set; }
    }
}
