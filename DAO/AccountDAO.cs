using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Coffee.DAO
{
    class AccountDAO
    {
        private static AccountDAO instance;

        public static AccountDAO Instance 
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set => instance = value; 
        }

        private AccountDAO() { }

        public bool Login(string username, string password)
        {
            string query = "USP_Login @username , @password";

            DataTable result = DataProvider.Instance.ExcuteQuery(query, new object[] { username,password});

            return result.Rows.Count > 0;
        }
    }
}
