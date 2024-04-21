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

                color: #f9c001;
            }
        .col h3{
            color:#f9c001;
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
            <input type="button" value="Login" style="background-color: #e9b708; color:white onclick="toLogin ()"/>
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
    </div>
    <div id="banner">
        <img src="img/banner%20gt.jpg"width="80%"/>
    </div>
    <div id="main">
        <h2>Giá trị và sự khác biệt</h2>
        <p>
            Với mong muốn phát triển thương hiệu Việt bằng nội lực,
            ELIGO đã chú trọng vào thiết kế và sản xuất nội thất trong nước.
            Danh mục sản phẩm của ELIGO thường xuyên được đổi mới và cập nhật,
            liên tục cung cấp cho khách hàng các dòng sản phẩm theo xu hướng mới nhất.
            Do chính người Việt thiết kế và sản xuất, nội thất thương hiệu ELIGO luôn phù hợp
            với cuộc sống Á Đông, đem đến sự tiện nghi hoàn hảo trong mọi không gian sống.</br>
            Hơn 70% sản phẩm của ELIGO được thiết kế, sản xuất bởi đội ngũ nhân viên cùng công nhân ưu tú
            với nhà máy có cơ sở vật chất hiện đại bậc nhất tại Việt Nam.</br>
            Sự khác biệt của ELIGO chính là sáng tạo nội thất thành phong cách riêng,
            phù hợp với nhu cầu khách hàng. Không chỉ là sản phẩm nội thất đơn thuần,
            mà còn là không gian sống theo phong cách riêng với cách bày trí hài hòa từ đồ nội thất
            kết hợp với đồ trang trí. Giúp khách hàng cảm nhận được một không gian sống thực sự,
            cảm thấy thoải mái để tận hưởng cuộc sống.
        </p>
        <img src="img/anh%20gioi%20thieu.jpg" width="70%"/>
        <h2>Chất lượng và dịch vụ</h2>
        <p>
            Chất lượng của nguyên vật liệu, phụ kiện và quy trình sản xuất đều được kiểm định
            và giám sát chặt chẽ bởi hệ thống quản lý chất lượng ISO 9001.
            Sản phẩm của ELIGO được thiết kế theo định hướng công năng sử dụng, thẩm mỹ và chất lượng.
            Trong những năm gần đây, thương hiệu luôn hướng đến xu hướng thiết kế xanh nhằm đóng góp
            không chỉ một không gian sống tiện nghi mà còn là một môi trường sống trong lành cho
            người sử dụng và cộng đồng.
            Với nhiều cống hiến như vậy, ELIGO vinh dự nhiều năm liền được trao tặng các danh hiệu
            “Hàng Việt Nam chất lượng cao”, “Trusted brand” và “Top 100 nhà cung cấp hàng đầu”.</br>

            Bên cạnh đó, ELIGO tự hào sở hữu đội ngũ tư vấn thiết kế và kỹ sư chuyên nghiệp,
            có kiến thức sâu rộng trong lĩnh vực đồ gỗ nội thất. Tập thể nhân viên tại ELIGO cam kết
            nỗ lực tư vấn và trợ giúp khách hàng lựa chọn sản phẩm ưng ý nhất. Dịch vụ tư vấn thiết kế
            của ELIGO sẽ giúp khách hàng kiến tạo một không gian sống như ý thông qua sự phối hợp điêu
            luyện giữa các sản phẩm nội thất và đồ trang trí.
        </p>
        <img src="img/anh%20gt%202.jpg" width="70%";/>
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
