

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
            <form action="Checkout" class="form-input" method="POST">
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
                    <div class="form-group">
                        <input name="txtFullName" value="<c:if test="${not empty cus.fullName}">${cus.fullName}</c:if>"
                               class="form-control" id="exampleInputEmail1"
                               placeholder="Enter FullName">
                    </div>
                    <div class="form-group">
                        <input name="txtPhone" value="${cus.phone_Number}" required type="text" id="typePhone" class="form-control" placeholder="Enter your phone" />
                </div>
                <div  class="form-choose " id="cityAddressSection">
                    <input name="txtCity" value="Tp.Hồ Chí Minh" type="text" id="typePhone" class="form-control" readonly=""/>
                </div>

                <div class="form-group" id="districtSection">
                    <select name="txtDistrict" class="form-select" id="select_district" aria-label="Default select example">
                        <option label="Choose your district"></option>

                        <option ${cus.district == 'Quận 1' ? 'selected' : ''} value="Quận 1">Quận 1</option>
                        <option ${cus.district == 'Quận 2' ? 'selected' : ''} value="Quận 2">Quận 2</option>
                        <option ${cus.district == 'Quận 3' ? 'selected' : ''} value="Quận 3">Quận 3</option>
                        <option ${cus.district == 'Quận 4' ? 'selected' : ''} value="Quận 4">Quận 4</option>
                        <option ${cus.district == 'Quận 5' ? 'selected' : ''} value="Quận 5">Quận 5</option>
                        <option ${cus.district == 'Quận 6' ? 'selected' : ''} value="Quận 6">Quận 6</option>
                        <option ${cus.district == 'Quận 7' ? 'selected' : ''} value="Quận 7">Quận 7</option>
                        <option ${cus.district == 'Quận 8' ? 'selected' : ''} value="Quận 8">Quận 8</option>
                        <option ${cus.district == 'Quận 9' ? 'selected' : ''} value="Quận 9">Quận 9</option>
                        <option ${cus.district == 'Quận 10' ? 'selected' : ''} value="Quận 10">Quận 10</option>
                        <option ${cus.district == 'Quận 11' ? 'selected' : ''} value="Quận 11">Quận 11</option>
                        <option ${cus.district == 'Quận 12' ? 'selected' : ''} value="Quận 12">Quận 12</option>
                        <option ${cus.district == 'Quận Bình Tân' ? 'selected' : ''} value="Quận Bình Tân">Quận Bình Tân</option>
                        <option ${cus.district == 'Quận Tân Phú' ? 'selected' : ''} value="Quận Tân Phú">Quận Tân Phú</option>
                        <option ${cus.district == 'Quận Tân Bình' ? 'selected' : ''} value="Quận Tân Bình">Quận Tân Bình</option>
                        <option ${cus.district == 'Quận Phú Nhuận' ? 'selected' : ''} value="Quận Phú Nhuận">Quận Phú Nhuận</option>
                        <option ${cus.district == 'Quận Gò Vấp' ? 'selected' : ''} value="Quận Gò Vấp">Quận Gò Vấp</option>
                        <option ${cus.district == 'Quận Bình Thạnh' ? 'selected' : ''} value="Quận Bình Thạnh">Quận Bình Thạnh</option>
                        <option ${cus.district == 'Quận Thủ Đức' ? 'selected' : ''} value="Quận Thủ Đức">Quận Thủ Đức</option>
                        <option ${cus.district == 'Huyện Củ Chi' ? 'selected' : ''} value="Huyện Củ Chi">Huyện Củ Chi</option>
                        <option ${cus.district == 'Huyện Hóc Môn' ? 'selected' : ''} value="Huyện Hóc Môn">Huyện Hóc Môn</option>
                        <option ${cus.district == 'Huyện Bình Chánh' ? 'selected' : ''} value="Huyện Bình Chánh">Huyện Bình Chánh</option>
                        <option ${cus.district == 'Huyện Nhà Bè' ? 'selected' : ''} value="Huyện Nhà Bè">Huyện Nhà Bè</option>
                        <option ${cus.district == 'Huyện Cần Giờ' ? 'selected' : ''} value="Huyện Cần Giờ">Huyện Cần Giờ</option>
                    </select>
                </div>


                <div class="form-group" id="addressSection">
                    <input name="txtAddress" id="address_input" value="${cus.address}" type="text" class="form-control" id="exampleInputAddress" placeholder="Enter your address">
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
            const cityAddressSection = document.getElementById('cityAddressSection');
            const addressSection = document.getElementById('addressSection');
            const districtSection = document.getElementById('districtSection');
            const districtchoose = document.getElementById('select_district');
            const addressInput = document.getElementById('address_input');


            document.addEventListener('DOMContentLoaded', function () {
                addressInput.required = true;
                districtchoose.required = true;
            });

            function toggleDeliveryOption(option) {
                if (option === 'fastDelivery') {
                    cityAddressSection.style.display = 'block';
                    addressSection.style.display = 'block';
                    districtSection.style.display = 'block';
                    addressInput.required = true;
                    districtchoose.required = true;
                } else if (option === 'receiveAtShop') {
                    cityAddressSection.style.display = 'none';
                    addressSection.style.display = 'none';
                    districtSection.style.display = 'none';
                    addressInput.required = false;
                    districtchoose.required = false;
                }
            }

        </script>
    </body>

</html>
