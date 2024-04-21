using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using G18EShop.Connect;


namespace G18EShop
{
    public partial class index : System.Web.UI.Page

    {
        public List<ProductInfo> listProducts = new List<ProductInfo>();
        public List<ProductInfo> listBestseller = new List<ProductInfo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //getProductList();

            //string connecttionString = @"Data Source=DESKTOP-15E3QO0\SQLEXPRESS;Initial Catalog=db_ECommerceShop;Integrated Security=True";
            //using (SqlConnection connection = new SqlConnection(connecttionString))
            //{
            //    connection.Open();
            //    // Do work here; connection closed on following line.  
            //    Response.Write("<script>alert('Data inserted successfully')</script>");
            //    connection.Close();
            //}
            //getProductHot();

            //string connecttionString = @"Data Source=DESKTOP-15E3QO0\SQLEXPRESS;Initial Catalog=db_ECommerceShop;Integrated Security=True";
            //using (SqlConnection connection = new SqlConnection(connecttionString))
            //{
            //    connection.Open();
            //    // Do work here; connection closed on following line.  
            //    Response.Write("<script>alert('Data inserted successfully')</script>");
            //    connection.Close();
            //}

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
                        // Utils.DisplayAlert(ClientScript, this.GetType(), "Thêm vào giỏ hàng thành công",
                        //     Page.Request.Url.ToString());
                        Utils.DisplayAlert(ClientScript, this.GetType(), exception.Message,
                            Page.Request.Url.ToString());
                    }
                }
                else
                {
                    Response.Redirect("dangnhap.aspx");
                }

                dbm.closeConnection();
            }

            getProductList();
            getBestseller();
        }


        public void getProductList()
        {
            Db dbm = new Db();

            SqlDataReader reader =
                dbm.GetReader(
                    "SELECT [Products].[ProductId], [Name], [Description], [Price], [LastPrice], [ProductImages].[Url] FROM [db_ECommerceShop].[dbo].[Products] where CategoryId = 1");

            List<ProductInfo> temp = new List<ProductInfo>();
            while (reader.Read())
            {
                ProductInfo productinfo = new ProductInfo();
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

        public void getBestseller()
        {
            Db dbm = new Db();

            SqlDataReader reader =
                dbm.GetReader(
                    "SELECT [Products].[ProductId], [Name], [Description], [Price], [LastPrice], [ProductImages].[Url] FROM [db_ECommerceShop].[dbo].[Products] INNER JOIN ProductImages ON Products.ProductId = ProductImages.ProductId where CategoryId = 2");

            while (reader.Read())
            {
                ProductInfo productinfo = new ProductInfo();
                productinfo.ProductId = reader.GetInt32(0);
                productinfo.Name = reader.GetString(1);
                productinfo.Description = reader.GetString(2);
                productinfo.Price = reader.GetDecimal(3);
                productinfo.LastPrice = reader.GetDecimal(4);
                productinfo.Img = reader.GetString(5);
                listBestseller.Add(productinfo);
            }

            dbm.closeConnection();
        }

        public class ProductInfo
        {
            public int ProductId;
            public string Name;
            public string Description;
            public Decimal Price;
            public Decimal LastPrice;
            public string Img;
        }
    }
}
