using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using G18EShop.Connect;
using G18EShop.Model;

namespace G18EShop
{
    public partial class UserManager : Page
    {
        protected List<User> listUser = new List<User>();
        Db db = new Db();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("index.aspx");
            }

            if (Request.Form["Name"] != null)
            {
                User user = new User();
                user.UserName = Request.Form["Name"];
                user.UserEmail = Request.Form["Email"];
                user.UserPassword = Request.Form["Password"];
                user.UserRole = Request.Form["radioRole"];
                db.ExecuteNonQuery($"INSERT INTO Users (username, useremail, userpassword, userrole, fullname)" +
                                   $" VALUES ('{user.UserName}', '{user.UserEmail}', '{Encoder.Encode(user.UserPassword)}=', '{user.UserRole}', '{user.UserName}')");
                Utils.DisplayAlert(ClientScript, this.GetType(), "Thêm người dùng thành công",
                    Page.Request.Url.ToString());
            }


            SqlDataReader reader = db.GetReader("SELECT UserId,UserName,UserEmail,UserPassword,UserRole FROM Users");
            while (reader.Read())
            {
                User user = new User();
                user.UserId = reader.GetInt32(0);
                user.UserName = reader.GetString(1);
                user.UserEmail = reader.GetString(2);
                user.UserPassword = reader.GetString(3);
                user.UserRole = reader.GetString(4);
                listUser.Add(user);
            }
        }
    }
}
