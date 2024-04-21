using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using G18EShop.Connect;

namespace G18EShop
{
    public partial class ProductManager : Page
    {
        protected List<Product> listProducts = new List<Product>();
        Db db = new Db();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["btnDelete"] != null)
            {
                string productId = Request.Form["btnDelete"];
                db.ExecuteNonQuery($"DELETE FROM product_user_cart WHERE Product_id = {productId}");
                db.ExecuteNonQuery($"DELETE FROM OrderItems WHERE ProductID = {productId}");
                db.ExecuteNonQuery($"DELETE FROM ProductImages WHERE ProductId = {productId}");
                db.ExecuteNonQuery($"DELETE FROM Products WHERE ProductId = {productId}");
                db.closeConnection();
                Response.Redirect(Page.Request.Url.ToString());
            }

            if (Request.Form["Name"] != null)
            {
                Product product = new Product();
                product.Name = Request.Form["Name"];
                product.Description = Request.Form["Description"];
                product.Price = decimal.Parse(Request.Form["Price"]);
                product.LastPrice = decimal.Parse(Request.Form["LastPrice"]);
                product.ProductId = GetNextProductId();

                string filename = MyFileUpload.PostedFile.FileName;
                int lastSlash = filename.LastIndexOf("\\", StringComparison.Ordinal);
                string trailingPath = filename.Substring(lastSlash + 1);
                string fullPath = Server.MapPath(" ") + @"\Assets\Image\" + trailingPath;
                MyFileUpload.PostedFile.SaveAs(fullPath);
                product.Img = @"\Assets\Image\" + trailingPath;

                db.ExecuteNonQuery(
                    $"INSERT INTO [dbo].[Products] ([Name] ,[Description] ,[Price] ,[LastPrice] ,[CategoryId]) " +
                    $"VALUES (N'{product.Name}', N'{product.Description}', {product.Price}, {product.LastPrice}, 1)");

                int imageId = GetNextProductImageId();
                db.ExecuteNonQuery(
                    $"INSERT INTO ProductImages (Id, ProductId, Url) VALUES ({imageId},{product.ProductId}, N'{product.Img}')");
                Utils.DisplayAlert(ClientScript, this.GetType(), "Thêm sản phẩm thành công",
                    Page.Request.Url.ToString());
            }

            getProductList();
        }

        public void getProductList()
        {
            Db dbm = new Db();

            SqlDataReader reader =
                dbm.GetReader(
                    $"SELECT [Products].[ProductId], [Name], [Description], [Price], [LastPrice] FROM [db_ECommerceShop].[dbo].[Products]");

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
            dbm.closeConnection();

            foreach (var product in temp)
            {
                reader = dbm.GetReader($"SELECT Top 1 [Url] FROM ProductImages WHERE ProductId = {product.ProductId}");
                if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("Url")))
                {
                    product.Img = reader["Url"].ToString();
                }

                reader.Close();
                dbm.closeConnection();
            }

            foreach (var product in temp)
            {
                reader = dbm.GetReader($"SELECT COUNT(OrderItems.ProductID) as Sold FROM OrderItems  " +
                                       $"INNER JOIN Products ON Products.ProductId = OrderItems.ProductID" +
                                       $" WHERE OrderItems.ProductID = {product.ProductId}");
                if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("Sold")))
                {
                    product.Sold = reader.GetInt32(reader.GetOrdinal("Sold"));
                }

                reader.Close();
                dbm.closeConnection();
                listProducts.Add(product);
            }

            reader.Close();
            dbm.closeConnection();
        }

        private int GetNextProductId()
        {
            Db db = new Db();
            SqlDataReader reader = db.GetReader("SELECT MAX(ProductId) as max_id FROM Products");
            int result = 1;
            if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("max_id")))
            {
                result = reader.GetInt32(reader.GetOrdinal("max_id")) + 1;
            }

            reader.Close();
            db.closeConnection();
            return result;
        }

        private int GetNextProductImageId()
        {
            Db db = new Db();
            SqlDataReader reader = db.GetReader("SELECT MAX(Id) as max_id FROM ProductImages");
            int result = 1;
            if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("max_id")))
            {
                result = reader.GetInt32(reader.GetOrdinal("max_id")) + 1;
            }

            reader.Close();
            db.closeConnection();
            return result;
        }
    }
}
