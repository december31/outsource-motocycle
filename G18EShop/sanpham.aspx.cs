using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using G18EShop.Connect;
using G18EShop.Model;

namespace G18EShop
{
    public partial class sanpham : System.Web.UI.Page
    {
        protected List<Product> listProducts = new List<Product>();
        protected List<Category> categories = new List<Category>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].ToString() == "admin")
            {
                navbar.InnerHtml += "<a href=\"Admin.aspx\">Admin</a>";
            }
            if (Request.Form["btnAddToCard"] != null)
            {
                if (Session["email"] == null)
                {
                    Response.Redirect("dangnhap.aspx");
                }

                Db dbm = new Db();

                SqlDataReader reader = dbm.GetReader($"SELECT * FROM Users WHERE UserEmail = '{Session["email"]}'");
                if (reader.Read())
                {
                    try
                    {
                        int userId = reader.GetInt32(reader.GetOrdinal("UserId"));
                        string productId = Request.Form["btnAddToCard"];
                        reader.Close();
                        dbm.ExecuteNonQuery(
                            $"INSERT INTO [dbo].[product_user_cart] ([Product_id],[User_id]) VALUES ({productId},{userId})");
                        Utils.DisplayAlert(ClientScript, this.GetType(), "Thêm vào giỏ hàng thành công",
                            Page.Request.Url.ToString());
                    }
                    catch (Exception exception)
                    {
                        Utils.DisplayAlert(ClientScript, this.GetType(),
                            "Sản phẩm này đã có sẵn trong giỏ hàng của bạn",
                            Page.Request.Url.ToString());
                        // Utils.DisplayAlert(ClientScript, this.GetType(), exception.Message,
                        //     Page.Request.Url.ToString());
                    }
                }
                else
                {
                    Response.Redirect("dangnhap.aspx");
                }

                dbm.closeConnection();
            }

            Db db = new Db();
            int categoryId = int.Parse(Request.QueryString["id"] ?? "1");
            SqlDataReader r = db.GetReader("select * from Categories");
            while (r.Read())
            {
                categories.Add(new Category(
                    r.GetInt32(r.GetOrdinal("CategoryId")),
                    r["Name"].ToString()
                ));
            }

            db.closeConnection();

            getProductList(categoryId);
        }

        public void getProductList(int categoryId)
        {
            Db dbm = new Db();

            SqlDataReader reader =
                dbm.GetReader(
                    $"SELECT [Products].[ProductId], [Name], [Description], [Price], [LastPrice] FROM [db_ECommerceShop].[dbo].[Products] where CategoryId = {categoryId}");

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
            }

            reader.Close();

            foreach (var product in temp)
            {
                reader = dbm.GetReader($"SELECT Top 1 [Url] FROM ProductImages WHERE ProductId = {product.ProductId}");
                if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("Url")))
                {
                    product.Img = reader["Url"].ToString();
                }

                listProducts.Add(product);
            }

            reader.Close();
            dbm.closeConnection();
        }
    }
}
