using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G18EShop
{
    public partial class lienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].ToString() == "admin")
            {
                navbar.InnerHtml += "<a href=\"Admin.aspx\">Admin</a>";
            }
        }
    }
}
