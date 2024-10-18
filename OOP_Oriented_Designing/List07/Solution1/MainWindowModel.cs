using Solution1.Events;
using Solution1.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Data;

namespace Solution1
{
    public class MainWindowModel : ViewModelBase
    {
        private CollectionViewSource m_Cvs;
        private bool m_EditModeNewUser;
        private User m_EditUser;
        private ObservableCollection<User> m_FilteredUsers;
        private User m_SelectedUser;
        private ObservableCollection<UserType> m_UserTypes;
        private ObservableCollection<User> m_Users;


        public CollectionViewSource Cvs
        {
            get { return m_Cvs; }
            set { SetProperty(ref m_Cvs, value); }
        }

        public bool EditModeNewUser
        {
            get { return m_EditModeNewUser; }
            set { SetProperty(ref m_EditModeNewUser, value); }
        }

        public User EditUser
        {
            get { return m_EditUser; }
            set { SetProperty(ref m_EditUser, value); }
        }

        public EventPublisher EventPublisher { get; private set; }

        public ObservableCollection<User> FilteredUsers
        {
            get { return m_FilteredUsers; }
            set { SetProperty(ref m_FilteredUsers, value); }
        }

        public User SelectedUser
        {
            get { return m_SelectedUser; }
            set { SetProperty(ref m_SelectedUser, value); }
        }

        public ObservableCollection<UserType> UserTypes
        {
            get { return m_UserTypes; }
            set { SetProperty(ref m_UserTypes, value); }
        }

        public ObservableCollection<User> Users
        {
            get { return m_Users; }
            set { SetProperty(ref m_Users, value); }
        }


        public void InitModel()
        {
            UserTypes = new ObservableCollection<UserType>(Enum.GetValues(typeof(UserType)).Cast<UserType>());
            Users = new()
            {
                new User
                {
                    FirstName = "Mateusz",
                    LastName = "Nowak",
                    Address = "ul. Słoneczna 10",
                    BirthDate = new DateTime(1985, 3, 15),
                    Type = UserType.Student
                },
                new User
                {
                    FirstName = "Anna",
                    LastName = "Kowalska",
                    Address = "ul. Lipowa 5/3",
                    BirthDate = new DateTime(1990, 7, 25),
                    Type = UserType.Student
                },
                new User
                {
                    FirstName = "Piotr",
                    LastName = "Wiśniewski",
                    Address = "ul. Zielona 20",
                    BirthDate = new DateTime(1978, 9, 8),
                    Type = UserType.Teacher
                },
                new User
                {
                    FirstName = "Katarzyna",
                    LastName = "Lewandowska",
                    Address = "os. Kwiatowe 3/7",
                    BirthDate = new DateTime(1982, 12, 12),
                    Type = UserType.Teacher
                }
            };

            var cvs = new CollectionViewSource { Source = Users };
            cvs.GroupDescriptions.Add(new PropertyGroupDescription("Type"));
            Cvs = cvs;

            SelectedUser = Users.First();
            FilteredUsers = new ObservableCollection<User>(Users);
        }
    }
}
