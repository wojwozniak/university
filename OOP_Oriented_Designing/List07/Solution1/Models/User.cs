using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Solution1.Models
{
    public class User : ViewModelBase
    {
        private UserType type;
        private string firstName = "";
        private string lastName = "";
        private string address = "";
        private DateTime birthDate;

        public UserType Type
        {
            get { return type; }
            set { SetProperty(ref type, value); }
        }
        public string FirstName
        {
            get { return firstName; }
            set { SetProperty(ref firstName, value); }
        }

        public string LastName
        {
            get { return lastName; }
            set { SetProperty(ref lastName, value); }
        }

        public string Address
        {
            get { return address; }
            set { SetProperty(ref address, value); }
        }

        public DateTime BirthDate
        {
            get { return birthDate; }
            set { SetProperty(ref birthDate, value); }
        }
    }
}