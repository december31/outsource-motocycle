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
    public partial class sanpham : System.Web.UI.Page
    {
        public List<ProductInfo> listProducts = new List<ProductInfo>();
        public List<ProductInfo> listBestseller = new List<ProductInfo>();
        public List<ProductInfo> listSanpham = new List<ProductInfo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            getProductList();
            getBestseller();
            getSanphamList();

        }
        public void getProductList()
        {
            Db dbm = new Db();

            SqlDataReader reader = dbm.GetReader("SELECT [Name], [Description], [LastPrice], [Url] FROM [db_ECommerceShop].[dbo].[Products] INNER JOIN ProductImages ON Products.ProductId = ProductImages.ProductId where CategoryId = 1");

            while (reader.Read())
            {
                ProductInfo productinfo = new ProductInfo();
                productinfo.Name = reader.GetString(0);
                productinfo.Description = reader.GetString(1);
                productinfo.LastPrice = reader.GetDecimal(2);
                productinfo.img = reader.GetString(3);
                listProducts.Add(productinfo);
            }

            dbm.closeConnection();
        }
        public void getBestseller()
        {
            Db dbm = new Db();

            SqlDataReader reader = dbm.GetReader("SELECT [Name], [Description], [LastPrice], [Url] FROM [db_ECommerceShop].[dbo].[Products] INNER JOIN ProductImages ON Products.ProductId = ProductImages.ProductId where CategoryId = 2");

            while (reader.Read())
            {
                ProductInfo productinfo = new ProductInfo();
                productinfo.Name = reader.GetString(0);
                productinfo.Description = reader.GetString(1);
                productinfo.LastPrice = reader.GetDecimal(2);
                productinfo.img = reader.GetString(3);
                listBestseller.Add(productinfo);
            }

            dbm.closeConnection();
        }
        public void getSanphamList()
        {
            Db dbm = new Db();

            SqlDataReader reader = dbm.GetReader("SELECT [Name], [Description], [LastPrice], [Url] FROM [db_ECommerceShop].[dbo].[Products] INNER JOIN ProductImages ON Products.ProductId = ProductImages.ProductId where CategoryId = 3");

            while (reader.Read())
            {
                ProductInfo productinfo = new ProductInfo();
                productinfo.Name = reader.GetString(0);
                productinfo.Description = reader.GetString(1);
                productinfo.LastPrice = reader.GetDecimal(2);
                productinfo.img = reader.GetString(3);
                listSanpham.Add(productinfo);
            }

            dbm.closeConnection();
        }
        public class ProductInfo
        {
            public String Name;
            public String Description;
            public Decimal LastPrice;
            public string img;
        }
    }
}
