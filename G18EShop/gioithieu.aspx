<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gioithieu.aspx.cs" Inherits="G18EShop.gioithieu" %>

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
         #banner{
             display:flex;
             align-items:center;
             justify-content:center;
             margin-top:10px;
         }
         #main{
             padding:10px;
             width:90%;
             margin:5px 50px 5px 50px;
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
        #main p{
            font-family:Arial;
            font-size:16px;
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
            <input type="button" value="Login" style="background-color: #fa0000; color:white onclick="toLogin ()"/>
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
    </div>
    <div id="main">
        <h2>Giá trị cốt lõi</h2>
        <ul>
            <li>Uy tín: Sản phẩm chính hãng, nguồn gốc rõ ràng</li>
            <li>Chất lượng: Kiểm tra kỹ lưỡng trước khi bán</li>
            <li>Giá cả cạnh tranh: Cập nhật giá thị trường, thường xuyên có KM</li>
            <li>Dịch vụ chuyên nghiệp: Tư vấn nhiệt tình, bảo hành chính hãng</li>
        </ul>

        <h2>Sự khác biệt của G18EShop</h2>
        <ul>
            <li>Hệ thống cửa hàng rộng khắp</li>
            <li>Chính sách đổi trả linh hoạt (7 ngày)</li>
            <li>Hình thức thanh toán đa dạng</li>
            <li>Chương trình khuyến mãi hấp dẫn</li>
        </ul>
        <h2>Chất lượng vượt trội</h2>
        <section class="quality">
            <div class="quality-item">
                <img src="Assets/Image/CB500F 2022.jpg" alt="Xe máy chất lượng">
                <h3>Sản phẩm chính hãng</h3>
                <p>G18EShop chỉ cung cấp sản phẩm xe máy chính hãng từ các thương hiệu uy tín trên thị trường như Honda, Yamaha, Suzuki, SYM,... Mỗi chiếc xe đều được kiểm tra kỹ lưỡng trước khi đến tay khách hàng để đảm bảo chất lượng và độ an toàn.</p>
            </div>
            <div class="quality-item">
                <img src="Assets/Image/71bbd710bb05e2cf3fd1d81f9f316f60.jpg" height="450" alt="Động cơ mạnh mẽ">
                <h3>Động cơ mạnh mẽ, tiết kiệm nhiên liệu</h3>
                <p>Xe máy G18EShop được trang bị động cơ mạnh mẽ, vận hành êm ái và tiết kiệm nhiên liệu. Nhờ vậy, bạn có thể thoải mái di chuyển trên mọi địa hình mà không lo hao xăng.</p>
            </div>
            <div class="quality-item">
                <img src="Assets/Image/1000_F_237081198_VSqVQxwGIDtv6OZVNejY1HlfuX6UJFZf.jpg" alt="Thiết kế thời trang">
                <h3>Thiết kế thời trang, hiện đại</h3>
                <p>Xe máy G18EShop có thiết kế thời trang, hiện đại, phù hợp với mọi lứa tuổi và phong cách. Bạn sẽ luôn tự tin khi di chuyển trên đường phố với chiếc xe G18EShop của mình.</p>
            </div>
        </section>

        <h2>Dịch vụ hoàn hảo</h2>
        <section class="service">
            <div class="service-item">
                <i class="fa fa-headset"></i>
                <h3>Tư vấn nhiệt tình, chu đáo</h3>
                <p>Đội ngũ nhân viên tư vấn của G18EShop được đào tạo bài bản, am hiểu về sản phẩm, luôn sẵn sàng hỗ trợ khách hàng lựa chọn được chiếc xe phù hợp nhất với nhu cầu và sở thích. Chúng tôi cam kết mang đến cho khách hàng những trải nghiệm mua sắm tốt nhất.</p>
            </div>
            <div class="service-item">
                <i class="fa fa-wrench"></i>
                <h3>Bảo hành chính hãng, bảo dưỡng chuyên nghiệp</h3>
                <p>G18EShop cung cấp dịch vụ bảo hành chính hãng cho tất cả các sản phẩm xe máy. Chúng tôi còn có đội ngũ kỹ thuật viên lành nghề, chuyên nghiệp, luôn sẵn sàng hỗ trợ khách hàng bảo dưỡng xe máy định kỳ.</p>
            </div>
            <div class="service-item">
                <i class="fa fa-truck"></i>
                <h3>Giao hàng tận nhà miễn phí</h3>
                <p>G18EShop hỗ trợ giao hàng tận nhà miễn phí cho khách hàng trên toàn quốc. Chúng tôi cam kết giao hàng nhanh chóng, an toàn và đúng hẹn.</p>
            </div>
        </section>
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
