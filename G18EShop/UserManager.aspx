﻿<%@ Page Language="C#" CodeBehind="UserManager.aspx.cs" Inherits="G18EShop.UserManager" %>

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
        input{
            width:300px;
            height:40px;
            margin-bottom:10px;
            border:1px solid grey;
            border-radius:10px;
            padding-left:10px;
        }
        #newUser button{
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
        .left{
            flex:20%;
            background:#fa0000;
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
                color:#fa0000;
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
            color:#fa0000;
        }
        #newUser {
            margin-left: auto;
            margin-right: auto;
            max-width: fit-content;
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
                    <a href="index.aspx">Trang chủ</a>
                </div>
                <div class="danhmuc">
                    <a href="Admin.aspx">Dashboard</a>
                    <a href="ProductManager.aspx">Sản phẩm</a>
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
                    <img src="img/admin2.png" height="60px"/>
                    <p style="margin:0px; font-size:13px; text-align:right;">Group G18</p>
                </div>
            </div>
            <div id="chung">
                <form id="newUser" action="UserManager.aspx" method="POST">
                    <h3>Thêm sản phẩm</h3>
                    <input name="Name" type="text" placeholder="Tên người dùng" required/></br>
                    <input name="Email" type="email" placeholder="Email" required/></br>
                    <input name="Password" type="number" placeholder="Mật khẩu" required/></br>
                    <div class="col-sm-6 row">
                        <input checked style="width: fit-content; height: fit-content" name="radioRole" type="radio" value="user" id="radioNam">User
                        <input style="width: fit-content; height: fit-content" name="radioRole" type="radio" value="admin" id="radioNu">Admin
                    </div>
                    <button type="submit">Thêm sản phẩm</button>
                </form>
                <div class="topsell">
                    <h2 style="text-align:center;">Danh sách người dùng</h2>
                    <div class="cart">
                        <form style="margin-left: auto; margin-right: auto; max-width: fit-content" method="post" action="UserManager.aspx">
                            <table>
                                <tr>
                                    <th style="text-align:left;padding-left:20px;">Id</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Mật khẩu</th>
                                    <th>Role</th>
                                    <th></th>
                                </tr>
                                <% foreach (var item in listUser)
                                   { %>
                                    <tr>
                                        <td>
                                            <p><%= item.UserId %></p>
                                        </td>
                                        <td>
                                            <p><%= item.UserName %></p>
                                        </td>
                                        <td>
                                            <h5><%= item.UserEmail %>đ</h5>
                                        </td>
                                        <td>
                                            <h4><%= item.UserPassword %></h4>
                                        </td>
                                        <td>
                                            <h4><%= item.UserRole %></h4>
                                        </td>
                                        <td style="cursor:pointer;">
                                            <button name="btnDelete" type="submit" value="<%= item.UserId %>">
                                                Xóa
                                            </button>
                                        </td>
                                    </tr>
                                <% } %>
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
