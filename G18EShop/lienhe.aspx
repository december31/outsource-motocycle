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
                color: white;
                text-decoration: none;
                text-align: center;
                padding: 14px 20px;
            }
        .menulist a:hover {
                
                color: white;
            }
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
            <input type="button" value="Login" style="background-color: #fa0000; color:white "/>
        </a>
        <a href="dangky.aspx" class="login">
            <input type="button" value="Signup" style="background-color: #fa0000; color:white "/>
        </a>

    </div>
    <div class="menulist">
        <a href="index.aspx">Trang chủ</a>
        <a href="gioithieu.aspx">Giới thiệu</a>
        <a href="sanpham.aspx">Sản phẩm</a>
        <a href="tintuc.aspx">Tin tức</a>
        <a href="lienhe.aspx">Liên hệ</a>
    </div>
    <h2> Trang này sẽ sớm được cập nhật!</h2>
</form>
</body>
</html>
