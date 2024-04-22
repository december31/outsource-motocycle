using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace G18EShop.Connect
{
    public class Db
    {
        private SqlConnection conn;

        public SqlConnection GetConnection()
        {
            string connecttionString = "Data Source=motocycle.mssql.somee.com;" +
                                       "Initial Catalog=motocycle;" +
                                       "User id=harian231112_SQLLogin_1;" +
                                       "Password=g88u7docns;";

            SqlConnection conn = new SqlConnection(connecttionString);

            conn.Open();
            return conn;
        }

        public SqlDataReader GetReader(String query)
        {
            closeConnection();
            SqlCommand cmd = new SqlCommand(query);

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = this.GetConnection();

            SqlDataReader reader = cmd.ExecuteReader();

            return reader;
        }

        public void ExecuteNonQuery(String query)
        {
            closeConnection();
            SqlCommand cmd = new SqlCommand(query);

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = this.GetConnection();
            cmd.ExecuteNonQuery();
            closeConnection();
        }

        public void closeConnection()
        {
            if (conn != null && conn.State == System.Data.ConnectionState.Open)
            {
                this.conn.Close();
            }
        }
    }
}
