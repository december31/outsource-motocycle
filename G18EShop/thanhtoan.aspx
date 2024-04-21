﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sanpham.aspx.cs" Inherits="G18EShop.sanpham" %>

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
        #main{
            display:flex;
            padding:50px;
        }
        .left{
            flex:50%;
            margin-left:50px;
        }
        .right{
            flex:50%;
            align-items:left;
            background-color:#e2ddcf;
            height:90%;

        }

        .customer input{
            width:300px;
            height:40px;
            margin-bottom:10px;
            border:1px solid grey;
            border-radius:10px;
            padding-left:10px;
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
            border-bottom:1px solid black;
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
            float:right;
        }
        .tongtien input:hover{
            background:#f9c001;
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

                color: #f9c001;
            }
        .col h3{
            color:#f9c001;
        }
         @media only screen and (max-width:700px) {
            .menu,#footer{
                display: flex;
                flex-direction: column;
            }
            #main {
                    width: 100%;
                    display: flex;
                    flex-direction: column;
                    padding: 0  15px;
                }

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
    <div id="main">
        <div class="left">
            <div class="delivery">
                <h2>Phương thức giao hàng</h2>
                <div class="chongh">
                    <input checked name="luachongh" type="radio"/>
                    <label for="">Giao hàng nhanh </label>
                </div>
                <div class="chongh">
                    <input name="luachongh" type="radio"/>
                    <label for="">Giao hàng tiêu chuẩn </label>
                </div>
            </div>

            <div class="payment">
                <h2>Phương thức thanh toán</h2>
                <div class="chontt">
                    <input checked name="luachontt" type="radio"/>
                    <label for="">Thanh toán qua thẻ ngân hàng </label>
                    <div class="anhnganhang">
                        <img src="img/the%20ngan%20hang.png" width="60%";/>
                    </div>

                    <div class="chontt">
                        <input name="luachontt" type="radio"/>
                        <label for="">Thanh toán khi nhận hàng</label>

                    </div>
                </div>

                <div class="customer">
                    <h2>Thông tin khách hàng</h2>
                    <input type="text" placeholder="Họ tên"/></br>
                    <input type="password" placeholder="Địa chỉ"/></br>
                    <input type="text" placeholder="Số điện thoại"/></br>
                </div>

            </div>
        </div>
        <div class="right">
            <h2 style="text-align:center;">Thông tin sản phẩm</h2>
            <div class="cart">
                <form action="">
                    <table>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                        </tr>
                        <tr>
                            <td style="display:flex;align-items:center;">
                                <img src="img/bàn2.jpg" width=70px; Bàn tròn gỗ chân sắt;/>
                            </td>
                            <td>
                                <h4>1.199.000đ</h4>
                            </td>
                            <td>
                                <input style="width:30px;outline:none;" type="number" value="1" min="1"</td>
                        </tr>
                        <tr>
                            <td style="display:flex;align-items:center;">
                                <img src="img/bàn%20tròn.jpg" width=70px; Bàn tròn gỗ chân sắt/>
                            </td>
                            <td>
                                <h4>999.000đ</h4>
                            </td>
                            <td>
                                <input style="width:30px;outline:none;" type="number" value="1" min="1"</td>
                        </tr>
                        <tr>
                            <td style="display:flex;align-items:center;">
                                <img src="img/ban-lam-viec-gb-lv10-1.jpg" width=70px; Bàn tròn gỗ chân sắt/>
                            </td>
                            <td>
                                <h4>1.199.000đ</h4>
                            </td>
                            <td>
                                <input style="width:30px;outline:none;" type="number" value="1" min="1"</td>
                        </tr>
                    </table>
                    <div class="tongtien">
                        <p style="font-weight:bold;">Tổng tiền:<h>4.197.000đ</h></p>
                        <input type="button" value="Đặt hàng"/>
                        <a href="giohang.aspx">
                            <p style="align-items:center;padding-right:10px; color:black";>Quay lại giỏ hàng</p>
                        </a>


                    </div>
                </form>
            </div>


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