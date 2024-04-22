namespace G18EShop.Model
{
    public class User
    {
        public User(string userEmail, string userPassword)
        {
            UserEmail = userEmail;
            UserPassword = userPassword;
            UserName = null;
            UserRole = null;
            FullName = null;
            Gender = null;
            AddressInfo = null;
            PhoneNum = null;
        }

        public User(string userPassword, string userEmail, string userName, string fullName)
        {
            UserPassword = userPassword;
            UserEmail = userEmail;
            UserName = userName;
            FullName = fullName;
        }

        public User()
        {
        }

        public string UserPassword;
        public int UserId;
        public string UserEmail;
        public string UserName;
        public string UserRole;
        public string FullName;
        public string Gender;
        public string AddressInfo;
        public string PhoneNum;
    }
}
