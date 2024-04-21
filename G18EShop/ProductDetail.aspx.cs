using System;
using System.Data.SqlClient;
using System.Web.UI;
using G18EShop.Connect;

namespace G18EShop
{
    public partial class ProductDetail : Page
    {
        protected Product Product = new Product();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string productId = Request.QueryString["id"];
                if (Request.Form["btnAddToCard"] != null)
                {
                    if (Session["email"] == null)
                    {
                        Response.Redirect("dangnhap.aspx");
                    }

                    Db dbm = new Db();

                    SqlDataReader r = dbm.GetReader($"SELECT * FROM Users WHERE UserEmail = '{Session["email"]}'");
                    if (r.Read())
                    {
                        try
                        {
                            int userId = r.GetInt32(r.GetOrdinal("UserId"));
                            r.Close();
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
                SqlDataReader reader = db.GetReader($"SELECT DISTINCT * FROM Products WHERE ProductId = {productId}");
                Product productinfo = new Product();
                if (reader.Read())
                {
                    productinfo.ProductId = reader.GetInt32(0);
                    productinfo.Name = reader.GetString(1);
                    productinfo.Description = reader.GetString(2);
                    productinfo.Price = reader.GetDecimal(3);
                    productinfo.LastPrice = reader.GetDecimal(4);
                }
                else
                {
                    Response.Redirect("index.aspx");
                }

                reader.Close();
                db.closeConnection();
                reader = db.GetReader($"SELECT Top 1 [Url] FROM ProductImages WHERE ProductId = {productId}");
                if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("Url")))
                {
                    productinfo.Img = reader["Url"].ToString();
                }

                Product = productinfo;
                db.closeConnection();
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}
