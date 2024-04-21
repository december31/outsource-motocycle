using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using G18EShop.Connect;
using static G18EShop.index;

namespace G18EShop
{
    public partial class giohang : System.Web.UI.Page
    {
        protected List<Product> listProducts = new List<Product>();
        protected string tongTien;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("dangnhap.aspx");
            }

            Db db = new Db();
            if (Request.Form["btnDelete"] != null)
            {
                SqlDataReader r = db.GetReader($"select * from [Users] where UserEmail = '{Session["email"]}'");
                if (r.Read())
                {
                    int userId = r.GetInt32(r.GetOrdinal("UserId"));
                    string productId = Request.Form["btnDelete"];
                    db.ExecuteNonQuery(
                        $"DELETE FROM product_user_cart WHERE User_id = {userId} AND Product_id = {productId}");
                    db.closeConnection();
                }
                else
                {
                    Response.Redirect("dangnhap.aspx");
                }
            }

            SqlDataReader reader =
                db.GetReader(
                    $"SELECT [Products].[ProductId], [Products].[Name], [Products].[Description], [Products].[Price], [Products].[LastPrice] FROM product_user_cart " +
                    $"INNER JOIN Products ON Products.ProductId = product_user_cart.Product_id " +
                    $"INNER JOIN Users ON Users.UserId = product_user_cart.User_id " +
                    $"WHERE UserEmail = '{Session["email"]}'");
            Decimal moneyCounter = 0;
            List<Product> temp = new List<Product>();
            while (reader.Read())
            {
                Product productinfo = new Product();
                productinfo.ProductId = reader.GetInt32(0);
                productinfo.Name = reader.GetString(1);
                productinfo.Description = reader.GetString(2);
                productinfo.Price = reader.GetDecimal(3);
                productinfo.LastPrice = reader.GetDecimal(4);
                temp.Add(productinfo);
                moneyCounter += productinfo.LastPrice;
            }

            reader.Close();

            foreach (var product in temp)
            {
                reader = db.GetReader($"SELECT Top 1 [Url] FROM ProductImages WHERE ProductId = {product.ProductId}");
                if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("Url")))
                {
                    product.Img = reader["Url"].ToString();
                }

                listProducts.Add(product);
            }

            tongTien = $"{moneyCounter:n0}";

            reader.Close();
        }
    }
}
