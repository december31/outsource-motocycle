using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using G18EShop.Connect;
using G18EShop.Model;

namespace G18EShop
{
    public partial class dangky : System.Web.UI.Page
    {
        Db dbm = new Db();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string username = Request.Form.Get("username");
                string fullname = Request.Form.Get("fullname");
                string email = Request.Form.Get("email");
                string password = Request.Form.Get("password");
                string repassword = Request.Form.Get("repassword");
                if (email != "" && password != "" && repassword != "")
                {
                    if (IsUserExisted(email))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('Tài khoản đã được sử dụng')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('Đăng ký thành công')", true);
                        User newUser = new User(password, email, username, fullname);
                        SaveUser(newUser);
                        Session["email"] = email;
                    }
                }

                dbm.closeConnection();
            }
        }

        private bool IsUserExisted(String email)
        {
            SqlDataReader reader = dbm.GetReader("select * from [Users] where useremail='" + email + "'");
            bool result = reader.Read();
            reader.Close();
            return result;
        }

        private void SaveUser(User user)
        {
            String encodedPassword = Encoder.Encode(user.UserPassword);
            dbm.ExecuteNonQuery("INSERT INTO Users (username, useremail, userpassword, userrole, fullname) " +
                                $"VALUES ('{user.UserName}', '{user.UserEmail}', '{encodedPassword}', 'user', '{user.FullName}')");
        }
    }
}
