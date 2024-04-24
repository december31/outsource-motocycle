<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sanpham.aspx.cs" Inherits="G18EShop.sanpham" %>

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
                background-color:#fa0000;
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
        #main{
             display:flex;
             padding:10px;
             font-family:Roboto;
         }
         .left{
             flex:20%;
             align-items:center;
             margin-left:10px;
         }
         .danhmuc{
                display: flex;
                flex-direction: column;
                width:70%;
                margin-right:0px;

            }
        .danhmuc a {
                color: black;
                text-decoration: none;
                text-align: center;
                align-items: center;
                padding: 14px;
                font-size: 15px;
                font-family:Roboto;

                background-color:#fde7a4;
            }
        .danhmuc a:hover {
                background-color: #facb3c;
                color:black;
            }
        .danhmuc button {
                color: black;
                text-decoration: none;
                text-align: center;
                align-items: center;
                padding: 14px;
                font-size: 15px;
                font-family:Roboto;
               border: none;
                background-color:#fde7a4;
            }
        .danhmuc button:hover {
                background-color: #facb3c;
                color:black;
            }
         .right{
             flex:80%;
         }
        .sp {
            margin: 20px;
            width:90%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            flex-wrap: wrap;
        }
        .boxsp {
            display: block;
            width: 25%;
            height:430px;
            background-color: white;
            text-align: center;
        }
        .boxsp h4{
                    text-align:center;
                    font-size:13px;
                }
        .boxsp p{
                    font-family:Roboto;
                    font-size:16px;
                    align-items:left;
                }
        .boxsp p:hover {
                        color: #fa0000;
                    }
        .addproduct input{
            width:60%;
            padding:10px;
            align-items:center;
            text-align:center;
            border:none;
            border-radius:10px;
            background:black;
            color:white;
            font-family:Roboto;
            font-size:13px;
        }
        .addproduct input:hover{
            background:#fa0000;
            color:black;
        }
        .addproduct .addToCardButton{
            width:60%;
            padding:10px;
            align-items:center;
            text-align:center;
            border:none;
            border-radius:10px;
            background:black;
            color:white;
            font-family:Roboto;
            font-size:13px;
        }
        .addproduct .addToCardButton:hover{
            background:#fa0000;
            color:black;
        }
        #footer {
            padding-left:0px;
            width:100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
             background-color:black ;
             color:white;
        }
        .col {
            display: block;
            width: 30%;
            height: 200px;
            padding:10px;
            margin:10px;
            text-align:left;
        }

        .col a {
                color: white;
                text-decoration: none;
                text-align: center;

            }
        .col a:hover {

                color: #fa0000;
            }
        .col h3{
            color:#fa0000;
        }
         @media only screen and (max-width:700px) {
            .menu,#footer{
                display: flex;
                flex-direction: column;
            }
            .danhmuc{
                display: flex;
                flex-direction: column;
                width:100%;
            }
            .sp {
                    width: 100%;
                    display: flex;
                    flex-direction: column;
                    padding: 0  15px ;
                }
            .boxsp {
                    background-color:white;
                    display:block;
                    margin: 20px 0 30px;
                    width: 100%;
                    padding-bottom:20px;
                    justify-content:center;
            }
         }

    </style>
</head>
<body>
<form id="form1" runat="server">
    <div id="header">
        <div class="logo">
            <img src="Assets/Image/logo2.jpg" height="90px"/>
        </div>
        <div class="timkiem">
            <form action="" class="search" method="post">
                <input type="text" class="searchbox" placeholder="Search Here What You Need...">
            </form>
        </div>
        <a href="giohang.aspx" class="giohang">
            <img src="Assets/Image/cart.png" width="32"/>
        </a>
        <a href="dangnhap.aspx" class="login">
            <input type="button" value="Login" style="background-color: #fa0000; color:white onclick="toLogin ()"/>
        </a>
        <a href="dangky.aspx" class="login">
            <input type="button" value="Signup" style="background-color: #fa0000; color:white "/>
        </a>

    </div>
    <div id="navbar" class="menulist" runat="server">
        <a href="index.aspx">Trang chủ</a>
        <a href="gioithieu.aspx">Giới thiệu</a>
        <a href="sanpham.aspx">Sản phẩm</a>
        <a href="tintuc.aspx">Tin tức</a>
        <a href="lienhe.aspx">Liên hệ</a>
    </div>
    <div id="main">
        <div class="left">
            <h3>Danh mục sản phẩm</h3>
            <form action="sanpham.aspx">
                <div class="danhmuc">
                    <% foreach (var item in categories)
                       { %>
                        <button name="id" value="<%= item.Id %>" type="submit"><%= item.Name %></button>
                    <% } %>
                </div>
            </form>

        </div>
        <div class="right">
            <form action="sanpham.aspx" method="post">
                <div class="sp">
                    <% foreach (var item in listProducts)
                       { %>
                        <div class="boxsp" style="cursor: pointer" onclick="window.location='ProductDetail.aspx?id=<%= item.ProductId %>';">
                            <img class="img-product" src="<%= item.Img %>" height="230px" width="100%" style="object-fit: contain"/>
                            <p class="tensp">
                                <b><%= item.Name %></b>
                            </p>
                            <h4 class="price"><%= item.LastPrice %></h4>
                            <div class="addproduct">
                                <button class="addToCardButton" type="submit" value="<%= item.ProductId %>" name="btnAddToCard">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    <% } %>
                </div>
            </form>
        </div>
    </div>
    <div id="footer">
        <div class="col">
            <h3>Giới thiệu</h3>
            <a href="#">Về chúng tôi</a><br>
            <a href="#">Tin tức</a><br>
            <a href="#">Liên hệ</a><br>
            <a href="#">Cửa hàng</a><br>
        </div>
        <div class="col">
            <h3>Ý kiến khách hàng</h3>
            <form>
                <input type="text" placeholder="Nhập email của bạn"/>
                <button type="submit">Gửi</button>
            </form>
        </div>
        <div class="col">
            <h3>Liên hệ</h3>
            <p>
                Địa chỉ:193 Vĩnh Hưng, Hoàng Mai, Hà Nội<br> Hotline:0246.2909098<br>
                Email: cskhG18Ecommerceshop.vn.com
            </p>
        </div>
    </div>
    <div>
    </div>
</form>
</body>
</html>
