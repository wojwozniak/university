namespace list07task02.Models
{
    public class Password
    {
        public int PasswordId { get; set; }
        public int UserID { get; set; }
        public string PasswordHash { get; set; }
        public string Salt { get; set; }
        public int HashRounds { get; set; }
        public DateTime PasswordSetDate { get; set; }
    }
}
