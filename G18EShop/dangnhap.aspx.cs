using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using G18EShop.Connect;

namespace G18EShop
{
    public partial class dangnhap : System.Web.UI.Page
    {
        private Db _db = new Db();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].ToString() == "admin")
            {
                navbar.InnerHtml += "<a href=\"Admin.aspx\">Admin</a>";
            }

            if (IsPostBack)
            {
                string email = Request.Form.Get("email");
                string password = Request.Form.Get("password");

                if (email != "" && password != "")
                {
                    SqlDataReader reader = _db.GetReader($"SELECT * FROM Users WHERE UserEmail = '{email}'");
                    if (reader.Read()) // tai khoan ton tai <=> co 1 ban ghi trong db co email la email duoc cung cap
                    {
                        string savedPassword = reader["UserPassword"].ToString();
                        if (Encoder.Encode(password) == savedPassword)
                        {
                            Session["email"] = email;
                            Session["role"] = reader["UserRole"];
                            Response.Redirect("index.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                                "alert('Sai mật khẩu')", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('Tài khoản không tôn tại')", true);
                    }
                }
            }
        }
    }
}
