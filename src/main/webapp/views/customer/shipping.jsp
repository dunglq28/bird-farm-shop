

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="./assets/css/shipping.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>

    <body>
        <style>
            .material-symbols-outlined {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
            }
        </style>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light"
                 style="background-color: rgb(13,103,128) !important;">
                <div class="col-md-6" style="margin: 0 10px 0 50px ;">
                    <a class="navbar-brand justify-content-center  " style="color: #fff !important;
                       font-size: 1.5em;
                       font-weight: 700;
                       text-transform: uppercase;
                       text-decoration: none;
                       padding-right: 10px;" href="home">Bird farm shop</a>
                </div>
                <div class="col-md-5">
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav mr-auto ">
                            <li class="nav-item active align-content-lg-end" style="display: flex;">
                                <a class="nav-link" style="color: #ffc107 ;margin: auto; align-items: center;"
                                   href="#">Login </a>
                            </li>
                            <li class="nav-item active align-content-lg-end material-symbols-outlined"
                                style="color: #ffc107 ; margin: auto 0; display: flex;">
                                arrow_forward
                            </li>

                            <li class="nav-item active align-content-lg-end" style="display: flex; max-width: auto;">
                                <a class="nav-link" style="color: #ffc107 ;margin: auto;" href="#">Receiving information</a>
                            </li>
                            <li class="nav-item active align-content-lg-end material-symbols-outlined"
                                style="color: #ffc107 ; margin: auto; display: flex;">
                                arrow_forward
                            </li>
                            <li class="nav-item" style="display: flex;">
                                <a class="nav-link" style="color: azure ;margin: auto;" href="#">Tranport method</a>
                            </li>
                            <li class="nav-item active align-content-lg-end material-symbols-outlined"
                                style="color: azure ; margin: auto;">
                                arrow_forward
                            </li>
                            <li class="nav-item" style="display: flex;">
                                <a class="nav-link" style="color: azure ;margin: auto; " href="#">Pay</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </nav>
        </header>
        <div class="container justify-content-center ">

            <div>
                <h3 style="font-weight: bold !important;color: black ;">Information receive</h3>
            </div>
            <div>
                <h5>We only accept delivery within Ho Chi Minh City</h3>
            </div>

            <div class="row mb-2 d-flex justify-content-between align-items-center">
                <div class="form-check">
                    <input onchange="toggleDeliveryOption('fastDelivery')" class="form-check-input-2" type="radio" 
                           name="shippingMethod" id="fastDeliveryRadio" value="Fast delivery" checked>
                    <label class="form-check-label" for="fastDeliveryRadio">
                        Fast delivery
                    </label>
                </div>
                <div class="form-check">
                    <input onchange="toggleDeliveryOption('receiveAtShop')" class="form-check-input-2" type="radio" 
                           name="shippingMethod" id="receiveAtShopRadio" value="Receive directly at shop">
                    <label class="form-check-label" for="receiveAtShopRadio">
                        Receive directly at shop
                    </label>
                </div>
            </div>


            <c:set var="cus" value="${sessionScope.CUSTOMER}"></c:set>
                <form action="Checkout" class="form-input" method="POST">
                    <div class="form-group">
                        <input name="txtFullName" value="<c:if test="${not empty cus.fullName}">${cus.fullName}</c:if><c:if test="${not empty requestScope.FULLNAME}">${requestScope.FULLNAME}</c:if>"  
                               class="form-control" id="exampleInputEmail1"
                               placeholder="Enter FullName" required>
                    </div>
                    <div class="form-group">
                            <input name="txtPhone" value="${cus.phone_Number}" required="" type="text" id="typePhone" class="form-control" placeholder="Enter your phone" />
                </div>
                <div  class="form-choose " id="cityAddressSection">
                    <input name="txtCity" value="Tp.Hồ Chí Minh" required="" type="text" id="typePhone" class="form-control" disabled=""/>

                    <!--                    <select name="txtCity" class="form-select" aria-label="Default select example" required>
                                            
                                                    
                                            <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                                            <option value="Hà Nội">Hà Nội</option>
                                            <option value="Hải Phòng">Hải Phòng</option>
                                            <option value="Cần Thơ">Cần Thơ</option>
                                            <option value="Đà Nẵng">Đà Nẵng</option>
                                            <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                            <option value="Bạc Liêu">Bạc Liêu</option>
                                            <option value="Bắc Kạn">Bắc Kạn</option>
                                            <option value="Bắc Giang">Bắc Giang</option>
                                            <option value="Bắc Ninh">Bắc Ninh</option>
                                            <option value="Bến Tre">Bến Tre</option>
                                            <option value="Bình Dương">Bình Dương</option>
                                            <option value="Bình Định">Bình Định</option>
                                            <option value="Bình Phước">Bình Phước</option>
                                            <option value="Bình Thuận">Bình Thuận</option>
                                            <option value="Cà Mau">Cà Mau</option>
                                            <option value="Cao Bằng">Cao Bằng</option>
                                            <option value="Đắk Lắk">Đắk Lắk</option>
                                            <option value="Đắk Nông">Đắk Nông</option>
                                            <option value="Điện Biên">Điện Biên</option>
                                            <option value="Đồng Nai">Đồng Nai</option>
                                            <option value="Đồng Tháp">Đồng Tháp</option>
                                            <option value="Gia Lai">Gia Lai</option>
                                            <option value="Hà Giang">Hà Giang</option>
                                            <option value="Hà Nam">Hà Nam</option>
                                            <option value="Hà Tĩnh">Hà Tĩnh</option>
                                            <option value="Hải Dương">Hải Dương</option>
                                            <option value="Hậu Giang">Hậu Giang</option>
                                            <option value="Hòa Bình">Hòa Bình</option>
                                            <option value="Hưng Yên">Hưng Yên</option>
                                            <option value="Khánh Hòa">Khánh Hòa</option>
                                            <option value="Kiên Giang">Kiên Giang</option>
                                            <option value="Kon Tum">Kon Tum</option>
                                            <option value="Lai Châu">Lai Châu</option>
                                            <option value="Lâm Đồng">Lâm Đồng</option>
                                            <option value="Lạng Sơn">Lạng Sơn</option>
                                            <option value="Lào Cai">Lào Cai</option>
                                            <option value="Long An">Long An</option>
                                            <option value="Nam Định">Nam Định</option>
                                            <option value="Nghệ An">Nghệ An</option>
                                            <option value="Ninh Bình">Ninh Bình</option>
                                            <option value="Ninh Thuận">Ninh Thuận</option>
                                            <option value="Phú Thọ">Phú Thọ</option>
                                            <option value="Phú Yên">Phú Yên</option>
                                            <option value="Quảng Bình">Quảng Bình</option>
                                            <option value="Quảng Nam">Quảng Nam</option>
                                            <option value="Quảng Ngãi">Quảng Ngãi</option>
                                            <option value="Quảng Ninh">Quảng Ninh</option>
                                            <option value="Quảng Trị">Quảng Trị</option>
                                            <option value="Sóc Trăng">Sóc Trăng</option>
                                            <option value="Sơn La">Sơn La</option>
                                            <option value="Tây Ninh">Tây Ninh</option>
                                            <option value="Thái Bình">Thái Bình</option>
                                            <option value="Thái Nguyên">Thái Nguyên</option>
                                            <option value="Thanh Hóa">Thanh Hóa</option>
                                            <option value="Thừa Thiên-Huế">Thừa Thiên-Huế</option>
                                            <option value="Tiền Giang">Tiền Giang</option>
                                            <option value="Trà Vinh">Trà Vinh</option>
                                            <option value="Tuyên Quang">Tuyên Quang</option>
                                            <option value="Vĩnh Long">Vĩnh Long</option>
                                            <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                            <option value="Yên Bái">Yên Bái</option>
                                            <option value="Hậu Giang">Hậu Giang</option>
                                        </select>-->
                </div>

                <div class="form-group" id="districtSection">
                    <select name="txtCity" class="form-select" aria-label="Default select example" required>
                        <option selected disabled>Choose your district</option>
                        <option value="Quận 1">Quận 1</option>
                        <option value="Quận 2">Quận 2</option>
                        <option value="Quận 3">Quận 3</option>
                        <option value="Quận 4">Quận 4</option>
                        <option value="Quận 5">Quận 5</option>
                        <option value="Quận 6">Quận 6</option>
                        <option value="Quận 7">Quận 7</option>
                        <option value="Quận 8">Quận 8</option>
                        <option value="Quận 9">Quận 9</option>
                        <option value="Quận 10">Quận 10</option>
                        <option value="Quận 11">Quận 11</option>
                        <option value="Quận 12">Quận 12</option>
                        <option value="Quận Bình Tân">Quận Bình Tân</option>
                        <option value="Quận Tân Phú">Quận Tân Phú</option>
                        <option value="Quận Tân Bình">Quận Tân Bình</option>
                        <option value="Quận Phú Nhuận">Quận Phú Nhuận</option>
                        <option value="Quận Gò Vấp">Quận Gò Vấp</option>
                        <option value="Quận Bình Thạnh">Quận Bình Thạnh</option>
                        <option value="Quận Thủ Đức">Quận Thủ Đức</option>
                        <option value="Huyện Củ Chi">Huyện Củ Chi</option>
                        <option value="Huyện Hóc Môn">Huyện Hóc Môn</option>
                        <option value="Huyện Bình Chánh">Huyện Bình Chánh</option>
                        <option value="Huyện Nhà Bè">Huyện Nhà Bè</option>
                        <option value="Huyện Cần Giờ">Huyện Cần Giờ</option>
                    </select>
                </div>

                <div class="form-group" id="addressSection">
                    <input name="txtAddress" value="${cus.address}" type="text" class="form-control" id="exampleInputAddress" placeholder="Enter your address" required>
                </div>
                <input type="hidden" name="txtTotalOrder" value="${sessionScope.TOTAL_ORDER}" />
                <input type="hidden" name="txtServiceID" value="${sessionScope.SERVICE_ID}" />
                <input type="hidden" name="txtproductID" value="${sessionScope.PRODUCT_ID_SERVICE}" />
                <input type="hidden" name="quantity_Buy" value="${sessionScope.EGG_QUANTITY}" />
                <div class="form-group">
                    <input name="btAction"  value="Continue" type="submit" class="btn btn-primary" style="background-color: #0d6780;"></input>
                </div>

            </form>

        </div>

        <script>
            function toggleDeliveryOption(option) {
                const cityAddressSection = document.getElementById('cityAddressSection');
                const addressSection = document.getElementById('addressSection');
                const districtSection = document.getElementById('districtSection');

                if (option === 'fastDelivery') {
                    cityAddressSection.style.display = 'block';
                    addressSection.style.display = 'block';
                    districtSection.style.display = 'block';
                } else if (option === 'receiveAtShop') {
                    cityAddressSection.style.display = 'none';
                    addressSection.style.display = 'none';
                     districtSection.style.display = 'none';
                }
            }
        </script>
    </body>

</html>
