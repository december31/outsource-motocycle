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
    <h1>Xe máy - Phương tiện di chuyển phổ biến tại Việt Nam</h1>
    <img src="Assets/Image/CB500F 2022.jpg" alt="Xe máy chất lượng">
    <p>
        Xe máy là phương tiện di chuyển phổ biến nhất tại Việt Nam với hơn 60 triệu xe đang lưu thông trên đường phố. Xe máy được ưa chuộng bởi tính linh hoạt, tiện lợi và giá cả phải chăng.
        Tuy nhiên, xe máy cũng là phương tiện có tỷ lệ tai nạn cao nhất. Do đó, người tham gia giao thông cần tuân thủ luật lệ giao thông và sử dụng xe máy an toàn để bảo vệ bản thân và người khác.
    </p>

    <h2>Ưu điểm của xe máy</h2>
    <ul>
        <li>Linh hoạt: Xe máy có thể di chuyển trên nhiều địa hình khác nhau, kể cả những con đường nhỏ hẹp và gập ghềnh.</li>
        <li>Tiện lợi: Xe máy dễ dàng điều khiển và sử dụng, phù hợp với mọi lứa tuổi.</li>
        <li>Giá cả phải chăng: Xe máy có giá thành rẻ hơn so với ô tô, phù hợp với túi tiền của người dân Việt Nam.</li>
    </ul>

    <h2>Nhược điểm của xe máy</h2>
    <ul>
        <li>Tỷ lệ tai nạn cao: Xe máy là phương tiện có tỷ lệ tai nạn cao nhất do kích thước nhỏ và tính linh hoạt.</li>
        <li>Ô nhiễm môi trường: Xe máy thải ra khí CO2 và các chất độc hại khác, góp phần gây ô nhiễm môi trường.</li>
        <li>Tiếng ồn: Xe máy gây ra tiếng ồn lớn, ảnh hưởng đến môi trường sống của con người.</li>
    </ul>

    <h2>Sử dụng xe máy an toàn</h2>
    <ul>
        <li>Đội mũ bảo hiểm khi tham gia giao thông.</li>
        <li>Tuân thủ luật lệ giao thông.</li>
        <li>Lái xe với tốc độ an toàn.</li>
        <li>Bảo dưỡng xe máy định kỳ.</li>
    </ul>
</form>
</body>
</html>
