<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="G18EShop.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head runat="server">
    <title>Admin</title>
    <style type="text/css">
        * {
            box-sizing: border-box;
            font-family:Roboto;
        }
        body{
            background-color:whitesmoke;
        }
        #main{
            display:flex;
            width:100%;
        }
        .left{
            flex:20%;
            background:#f9c011;
            height:820px;
            align-items:center;
            text-align:center;
            padding:20px 0 20px;
        }
        .sidebar-brand a{
            font-size:20px; 
            font-family:Verdana;
            margin:20px;
            padding-bottom:10px;
            color:black;
        }
        .danhmuc{
                display: flex;
                flex-direction: column;
                width:100%;
                margin-right:0px;
            }
        .danhmuc a {
                color: white;
                text-decoration: none;
                text-align: center;
                align-items: center;
                padding: 14px;
                font-size: 15px;
                font-family:Roboto;
            }
        .danhmuc a:hover {
                background-color: white;
                color:#f9c011;
            }
        .right{
            flex:80%;
        }
        .header{
            display:flex;
            height:100px;
            background-color:white;
            width:100%;
        }
        .timkiem{
            flex:60%;
            text-align:right;
            padding:30px 20px;
            
        }
        .search {
            text-align: right;
            line-height: 50px;
        }

        .searchbox {
            border: 2px solid #a3a1a1;
            border-radius: 20px;
            width: 60%;
            height: 40px;
            color: #a3a1a1;
            font-family: Arial;
            font-size: 13px;
            padding-left:10px;
        }
        .admin{
            flex:40%;
            text-align:right;
            padding:5px 0px 5px;
            margin-right:40px;
        }
        #chung{
            margin:20px 10px 20px 10px;
        }

        .row1 {
            margin: 20px auto ;
            width:100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        .box {
            display: inline-block;
            width: 22%;
            height:160px;
            background-color: white;
            text-align: center;
            padding-top:10px;
        }
        .box-icon{
            color:#f9c011;
        }
        .topsell{
            background-color:white;
            width:80%;
            margin: 20px auto ;
            padding-top:10px;
            
        }
        .cart{
            margin:auto;
            text-align:center;
            padding-top:30px;
        }
        .cart p{
           text-align:left;
           padding-left:20px;
        }
        .cart table{
            width:100%;
        }
        .cart table tr td{
            border-bottom:1px solid #fde7a4;
            padding:12px 0;
        }
        @media only screen and (max-width:700px) {
            .left  {
                display: flex;
                flex-direction: column;
            }
            .left{
                height:auto;
            }

            .row1,.topsell {
                width: 100%;
                display: flex;
                flex-direction: column;
                padding: 0 15px;
            }

            .box {
                background-color: white;
                display: block;
                margin: 20px 0;
                width:100%;
                height: 200px;
                align-items:center;
            }
        }
        
     </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div class="left">
            <div class="sidebar">
            <div class="sidebar-brand">
                <a href="index.aspx">EligoMebel</a>
            </div>
            <div class="danhmuc">
                <a href="2">Khách hàng</a>
                <a href="3">Sản phẩm</a>
                <a href="4">Đơn hàng</a>
                <a href="5">Tài khoản</a>
            </div>
        </div>
        </div>
        <div class="right">
            <div class="header">
                <div class="timkiem">
                    <form action="" class="search" method="post">
                      <input type="text" class="searchbox" placeholder="Tìm kiếm...">
                    </form>
                </div>
                <div class="admin">
                    <img src="img/admin2.png" height="60px" />
                    <p style="margin:0px; font-size:13px; text-align:right;">Group G19</p>
                </div>
            </div>
            <div id="chung">
                <div class="row1">
                <div class="box">
                    <i class="fa fa-users box-icon"></i>
                    <h1>119</h1>
                    <p>Khách hàng</p>
                </div>
                <div class="box">
                    <i class="fa fa-list box-icon"></i>
                    <h1>24</h1>
                    <p>Sản phẩm</p>
                </div>
                <div class="box">
                    <i class="fa fa-shopping-bag box-icon"></i>
                    <h1>35</h1>
                    <p>Đơn hàng</p>
                </div>
                <div class="box">
                    <i class="fa fa-google-wallet box-icon"></i>
                    <h1>125M</h1>
                    <p>Doanh thu</p>
                </div>
            </div>
            <div class="topsell">
                <h2 style="text-align:center;">Top Sản Phẩm Bán Chạy</h2>
            <div class="cart">
                <form action="">
            <table>
                <tr>
                    <th style="text-align:left;padding-left:20px;">Sản phẩm</th>
                    <th>Giá</th>
                    <th>Đã bán</th>
                    <th>Còn lại</th>
                </tr>
                <tr>
                    <td><p>Bàn tròn gỗ chân sắt</p></td>
                    <td><h5>1.199.000đ</h5></td>
                    <td><h4>35</h4></td>
                    <td><h4>5</h4></td>
                </tr>
                <tr>
                    <td><p>Đèn chùm thả ánh sáng vàng</p></td>
                    <td><h5>499.000đ</h5></td>
                    <td><h4>50</h4></td>
                    <td><h4>1</h4></td>
                </tr>
                <tr>
                    <td><p>Sofa xám decor phòng khách</p></td>
                    <td><h5>1.200.000đ</h5></td>
                    <td><h4>5</h4></td>
                    <td><h4>5</h4></td>
                </tr>
                <tr>
                    <td><p>Kệ đựng sách treo tường</p></td>
                    <td><h5>399.000đ</h5></td>
                    <td><h4>22</h4></td>
                    <td><h4>3</h4></td>
                </tr>
            </table>
        </form>
            </div>
            </div>
            </div>
            
        </div>
                
        </div>
    </form>
</body>
</html>
