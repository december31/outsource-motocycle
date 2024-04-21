<%@ Page Language="C#" CodeBehind="ProductDetail.aspx.cs" Inherits="G18EShop.ProductDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head runat="server">
    <title></title>
    <style type="text/css">
         * {
            box-sizing: border-box;
        }
        #header {
            background: white;
            height: 100px;
            display:flex;
            align-items:center;
        }
        .logo{
            flex:30%;
            padding-left:50px;
        }
        .timkiem{
            flex:50%;
        }
         .search{
        text-align: center;
        line-height: 50px;
    }
         .searchbox{
        border:2px solid #a3a1a1;
        border-radius: 20px;
        width: 80%;
        height: 40px;
        color:#a3a1a1;
        font-family: Arial;
        font-size:13px;
        }
         .giohang{
             flex:10%;
             text-align:right;
             margin-right:5px;
         }
         .login{
             flex:10%;
             text-align:center;
         }
         .menulist{
                display: flex;
                background-color:#f9c011;
                margin:0;
            }
        .menulist a {
                color: black;
                text-decoration: none;
                text-align: center;
                padding: 14px 20px;
            }
        .menulist a:hover {

                color: white;
            }
         .center {
           display: block;
           margin-left: auto;
           margin-right: auto;
           width: 30%;
         }

        .addproduct input {
            width: 150px;
            height: 40px;
            padding: 10px;
            margin-bottom: 10px;
            justify-content: center;
            border: none;
            border-radius: 10px;
            background: black;
            color: white;
            font-family: Roboto;
            font-size: 16px;
        }

        .addproduct input:hover {
            background: #f9c001;
            color: black;
        }

        .addproduct .addToCardButton:hover {
            background: #f9c001;
            color: black;
        }

       .addToCardButton {
            width: 150px;
            height: 40px;
            padding: 10px;
            margin-bottom: 10px;
            justify-content: center;
            border: none;
            border-radius: 10px;
            background: black;
            color: white;
            font-family: Roboto;
            font-size: 16px;
       }
         @media only screen and (max-width:700px) {
            .menu{
                display: flex;
                flex-direction: column;
            }
         }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div id="header">
        <div class="logo">
            <img src="img/logo%20nội%20thất.jpg" height="90px"/>
        </div>
        <div class="timkiem">
            <form action="" class="search" method="post">
                <input type="text" class="searchbox" placeholder="Search Here What You Need...">
            </form>
        </div>
        <a href="giohang.aspx" class="giohang">
            <i class="fa fa-cart-plus" style="font-size:32px;"></i>
        </a>
        <a href="dangnhap.aspx" class="login">
            <input type="button" value="Login" style="background-color: #e9b708; color:white "/>
        </a>
        <a href="dangky.aspx" class="login">
            <input type="button" value="Signup" style="background-color: #e9b708; color:white "/>
        </a>

    </div>
    <div class="menulist">
        <a href="index.aspx">Trang chủ</a>
        <a href="gioithieu.aspx">Giới thiệu</a>
        <a href="sanpham.aspx">Sản phẩm</a>
        <a href="tintuc.aspx">Tin tức</a>
        <a href="lienhe.aspx">Liên hệ</a>
    </div>
    <div style="margin-top: 32px; width: 100%;">
        <img class="center" src="<%= Product.Img %>"/>
        <h1 style="text-align: center" class="center"><%= Product.Name %></h1>
        <h2 style="text-align: center" class="center"><%= Product.Description %></h2>
        <p style="text-align: center; font-size: 32px" class="center"><%= Product.LastPrice %>đ</p>
        <form action="ProductDetail.aspx?id=<%= Product.ProductId %>" method="POST">
            <div class="addproduct center">
                <button class="addToCardButton center" type="submit" value="true" name="btnAddToCard">Thêm vào giỏ hàng</button>
            </div>
        </form>
    </div>
</form>
</body>
</html>
