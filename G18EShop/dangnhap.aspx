<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="G18EShop.dangnhap" %>

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
        #dangnhap{
            display:flex;
            margin-top:60px;
        }
        .left{
            flex:60%;
            margin-left:50px;

        }
        .right{
            flex:40%;
            font-family:Roboto;
        }
        .right input{
            width:300px;
            height:40px;
            margin-bottom:10px;
            border:1px solid grey;
            border-radius:10px;
            padding-left:10px;
        }
        .right button{
            width:150px;
            height:40px;
            padding:10px;
            margin-bottom:10px;
            align-items:center;
            border:none;
            border-radius:10px;
            background:black;
            color:white;
            font-family:Roboto;
            font-size:16px;
        }
        .right button:hover{
            background:#fa0000;
            color:black;
        }
        #footer {
            margin: 50px auto;
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
         }
    </style>
</head>
<body>
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
<div runat="server" id="navbar" class="menulist">
    <a href="index.aspx">Trang chủ</a>
    <a href="gioithieu.aspx">Giới thiệu</a>
    <a href="sanpham.aspx">Sản phẩm</a>
    <a href="tintuc.aspx">Tin tức</a>
    <a href="lienhe.aspx">Liên hệ</a>
</div>
<div id="dangnhap">
    <div class="left">
        <img src="Assets/Image/19.png" width="70%" ;/>
    </div>
    <div class="right">
        <form action="dangnhap.aspx" id="form1" runat="server">
            <h3>ĐĂNG NHẬP</h3>
            <input name="email" type="email" placeholder="Email"/></br>
            <input name="password" type="password" placeholder="Mật khẩu"/></br>
            <button type="submit">Đăng nhập</button>
            <button>Xóa</button>
        </form>
    </div>
</div>
<div id="footer">
    <div class="col">
        <h3>Giới thiệu</h3>
        <a href="#">Về chúng tôi</a></br>
        <a href="#">Tin tức</a></br>
        <a href="#">Liên hệ</a></br>
        <a href="#">Cửa hàng</a></br>
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
            Địa chỉ:193 Vĩnh Hưng, Hoàng Mai, Hà Nội</br> Hotline:0246.2909098</br>
            Email: cskhG18Ecommerceshop.vn.com
        </p>
    </div>
</div>
</form>
</body>
</html>
