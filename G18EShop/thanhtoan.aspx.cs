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
    public partial class thanhtoan : System.Web.UI.Page
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

            if (Request.Form["btnDatHang"] != null)
            {
                SqlDataReader r = db.GetReader($"select * from [Users] where UserEmail = '{Session["email"]}'");
                if (r.Read())
                {
                    int userId = r.GetInt32(r.GetOrdinal("UserId"));
                    int orderId = GetNextOrderId();
                    DateTime now = DateTime.Now;
                    string format = "yyyyMMdd hh:mm:ss";
                    db.ExecuteNonQuery(
                        $"INSERT INTO [dbo].[Orders] ([OrderID] ,[UserId] ,[CreatedAt] ,[UpdatedAt] ,[Status] ,[ShippingCost] ,[Tax] ,[Discount]) VALUES ({orderId},{userId},'{now.ToString(format)}','{now.ToString(format)}', 1, 0, 0, 0)");
                    foreach (var product in listProducts)
                    {
                        db.ExecuteNonQuery(
                            $"INSERT INTO [dbo].[OrderItems]([OrderID], [ProductID], [Quantity], [Price]) VALUES ({orderId}, {product.ProductId}, 1, {product.LastPrice})");
                    }

                    db.closeConnection();
                    Utils.DisplayAlert(ClientScript, this.GetType(), "Đặt hàng thành công", "index.aspx");
                }
                else
                {
                    Response.Redirect("dangnhap.aspx");
                }
            }

            db.closeConnection();
        }

        private int GetNextOrderId()
        {
            Db db = new Db();
            SqlDataReader reader = db.GetReader("select max(OrderId) as max_id from [Orders]");
            int result = 1;
            if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("max_id")))
            {
                result = reader.GetInt32(reader.GetOrdinal("max_id")) + 1;
            }

            reader.Close();
            return result;
        }
    }
}
