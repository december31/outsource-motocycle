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
    public partial class Admin : System.Web.UI.Page
    {
        protected int UserCount;
        protected int ProductCount;
        protected int OrderCount;
        protected decimal Revenue;
        protected List<Product> listProducts = new List<Product>();
        Db db = new Db();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataReader reader = db.GetReader("select count(*) as UserCount from Users");
            if (reader.Read())
            {
                UserCount = reader.GetInt32(reader.GetOrdinal("UserCount"));
            }

            db.closeConnection();
            reader = db.GetReader("select count(*) as ProductCount from Products");
            if (reader.Read())
            {
                ProductCount = reader.GetInt32(reader.GetOrdinal("ProductCount"));
            }

            db.closeConnection();

            reader = db.GetReader("select count(*) as OrderCount from Orders");
            if (reader.Read())
            {
                OrderCount = reader.GetInt32(reader.GetOrdinal("OrderCount"));
            }

            db.closeConnection();

            reader = db.GetReader("SELECT SUM(Price) as Revenue FROM OrderItems");
            if (reader.Read())
            {
                Revenue = reader.GetDecimal(reader.GetOrdinal("Revenue"));
            }

            db.closeConnection();

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

            foreach (var product in temp)
            {
                reader = dbm.GetReader($"SELECT Top 1 [Url] FROM ProductImages WHERE ProductId = {product.ProductId}");
                if (reader.Read() && !reader.IsDBNull(reader.GetOrdinal("Url")))
                {
                    product.Img = reader["Url"].ToString();
                }

                reader.Close();
                db.closeConnection();
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
                db.closeConnection();

                listProducts.Add(product);
            }

            reader.Close();
            dbm.closeConnection();
        }
    }
}
