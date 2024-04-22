<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="G18EShop.giohang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="https://kit.fontawesome.com/54f0cb7e4a.js"crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head runat="server">
    <title>Giỏ hàng</title>
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
        .sp {
                    width: 100%;
                    display: flex;
                    justify-content: space-between;
                    padding:12px ;
                }
        .boxsp {
                    background-color:white;
                    margin: 20px 0 20px;
                    width: 19%%;
                    height:400px;
                    padding:20px;
            }
        .boxsp h4{
                    text-align:center;
                }
        .boxsp p{
                    text-align:center;
                    font-family:Verdana;
                    font-size:14px;
                }
        .boxsp p:hover {
                        color: #fa0000;
                    }
        .boxsp button{
            width:200px;
            height:40px;
            padding:10px;
            margin-bottom:30px;
            margin-left:40px;
            text-align:center;
            border:none;
            border-radius:10px;
            background:black;
            color:white;
            font-family:Roboto;
            font-size:16px;
        }
        .boxsp button:hover{
            background:#fa0000;
            color:black;
        }
        .cart{
            width:70%;
            margin:auto;
            text-align:center;
            padding-top:30px;
        }
        .cart h2{
            padding-bottom:30px;
        }
        .cart table{
            width:100%;
        }
        .cart table tr td{
            border-bottom:1px solid #ddd;
            padding:12px 0;
        }
        .tongtien input{
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
        .tongtien input:hover{
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
    <div runat="server" id="navbar" class="menulist">
        <a href="index.aspx">Trang chủ</a>
        <a href="gioithieu.aspx">Giới thiệu</a>
        <a href="sanpham.aspx">Sản phẩm</a>
        <a href="tintuc.aspx">Tin tức</a>
        <a href="lienhe.aspx">Liên hệ</a>
    </div>
    <div class="cart">
        <h2>Giỏ hàng</h2>
        <form action="giohang.aspx" method="post">
            <table>
                <tr>
                    <th></th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Chọn</th>
                </tr>
                <% foreach (var item in listProducts)
                   { %>
                    <tr>
                        <td style="display:flex;align-items:center;">
                            <img src="<%= item.Img %>" height="70px;" style="margin-right: 30px"/>
                        </td>
                        <td>
                            <%= item.Name %>
                        </td>
                        <td>
                            <h4><%= item.LastPrice %>đ</h4>
                        </td>
                        <td>
                            <input style="width:30px;outline:none;" type="number" value="1" min="1"/>
                        </td>
                        <td style="cursor:pointer;">
                            <button name="btnDelete" type="submit" value="<%= item.ProductId %>">
                                Xóa
                            </button>
                        </td>
                    </tr>
                <% } %>
            </table>
            <div class="tongtien">
                <p style="font-weight:bold;">Tổng tiền:<h><%= tongTien %>đ</h></p>
                <a href="thanhtoan.aspx">
                    <input type="button" value="Thanh toán"/>
                </a>


            </div>
        </form>
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
