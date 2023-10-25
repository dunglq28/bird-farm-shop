<%-- 
    Document   : oderdetailStaff
    Created on : Oct 25, 2023, 6:50:44 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>

    <body>



        <jsp:include page="/components/header.jsp"></jsp:include>

        <div class="container py-5 h-100 ">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-12">
                                    <div class="p-5">

                                        <div class="mb-4 d-flex justify-content-between align-items-center">
                                            <h6 class="fw-bold col-md-6  text-muted">Product</h6>
                                            <h6 class="fw-bold col-md-2  text-sm-center text-muted ">Price
                                            </h6>
                                            <h6 class="fw-bold col-md-2  text-center text-muted ">Quantity
                                            </h6>
                                            <h6 class="fw-bold col-md-2  text-center text-muted">Total</h6>
                                        </div>

                                        <hr class="my-4">
                                        <div class="product-element">
                                            <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                    <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B1.jpg"
                                                         class="img-fluid rounded-3" alt="Bird Image">
                                                </div>
                                                <div class="col-md-4 col-lg-4 col-xl-4">
                                                    <h6 class="text-black mb-0">Turquoise parrot</h6>

                                                    <h6 class="text-muted">Parrot</h6>
                                                    <div class="d-flex">

                                                        <h6 class="text-muted">Age: 1 year</h6>

                                                        <h6 class="mb-0 text-sm-center text-muted"
                                                            style="margin: 0 10px 0 10px;"> |
                                                        </h6>
                                                        <h6 class="text-muted">Gender:
                                                            Male</h6>
                                                    </div>


                                                    <h6 class="text-muted">Color: yellow</h6>



                                                </div>
                                                <div class="col-md-2 col-lg-2 col-xl-2 ">
                                                    <h6 class="mb-0 text-sm-center"> 250.000 VND</h6>
                                                </div>
                                                <div
                                                    class="col-md-2 col-lg-2 col-xl-2 d-flex align-items-center quantity-form ">
                                                    1</div>
                                                <div
                                                    class="col-md-2 col-lg-2 col-xl-2 text-md-end text-lg-start text-xl-start">
                                                    </divclass>

                                                    <h6 class="mb-0" style="margin-left: 34px;">
                                                        250.000 VND</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="my-4">

                                        <div class="product-element">
                                            <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                    <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B1.jpg"
                                                         class="img-fluid rounded-3" alt="Bird Image">
                                                </div>
                                                <div class="col-md-4 col-lg-4 col-xl-4">
                                                    <h6 class="text-black mb-0">Turquoise parrot</h6>

                                                    <h6 class="text-muted">Parrot</h6>
                                                    <div class="d-flex">

                                                        <h6 class="text-muted">Age: 1 year</h6>

                                                        <h6 class="mb-0 text-sm-center text-muted"
                                                            style="margin: 0 10px 0 10px;"> |
                                                        </h6>
                                                        <h6 class="text-muted">Gender:
                                                            Male</h6>
                                                    </div>


                                                    <h6 class="text-muted">Color: yellow</h6>



                                                </div>
                                                <div class="col-md-2 col-lg-2 col-xl-2 ">
                                                    <h6 class="mb-0 text-sm-center"> 250.000 VND</h6>
                                                </div>
                                                <div
                                                    class="col-md-2 col-lg-2 col-xl-2 d-flex align-items-center quantity-form ">
                                                    1</div>
                                                <div
                                                    class="col-md-2 col-lg-2 col-xl-2 text-md-end text-lg-start text-xl-start">
                                                    </divclass>

                                                    <h6 class="mb-0" style="margin-left: 34px;">
                                                        250.000 VND</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="my-4">
                                        <div class="col-md-12">
                                            <div class="card-body p-4">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h2 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Order details</h1>
                                                        <h2 class="mb-0 text-muted">Order ID: O01</h6>

                                                              </div>
                                                            <hr class="mt-0 mb-4">
                                                            <div class="row pt-1">
                                                                <div class="col-6 mb-3">
                                                                    <h6>Status </h6>

                                                                    <style>
                                                                        .rounded-td {
                                                                            border-radius: 7px;
                                                                            border: 2px solid rgb(13, 103, 128);
                                                                            overflow: hidden;
                                                                        }

                                                                        .rounded-select {
                                                                            border-radius: 7px;
                                                                            border: 2px solid rgb(13, 103, 128);
                                                                            text-align: center;
                                                                            padding: 0 10px 0 10px;
                                                                            text-align: center;
                                                                            justify-content: center;
                                                                        }
                                                                    </style>

                                                                    <td class="rounded-td">
                                                                        <select class="rounded-select" name="" id="">
                                                                            <option value="">Complete</option>
                                                                            <option value="">Complete</option>
                                                                        </select>
                                                                    </td>
                                                                </div>
                                                                <div class="col-6 mb-3">
                                                                    <h6>Customer name </h6>
                                                                    <p class="text-muted">
                                                                        Tâm Péo
                                                                    </p>

                                                                </div>
                                                            </div>


                                                            <div class="row pt-1">
                                                                <div class="col-6 mb-3">
                                                                    <h6>Sales clerk</h6>
                                                                    <p class="text-muted" >Hoang Trung Luu
                                                                    </p>
                                                                </div>
                                                                <div class="col-6 mb-3"> 
                                                                    <h6>Address <i class="fa-solid fa-location-dot fa-bounce"></i></h6>
                                                                    <p class="text-muted">
                                                                        Đồng Nai
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-1">
                                                                <div class="col-6 mb-3">
                                                                    <h6>Purchase date</h6>
                                                                    <p class="text-muted" >25/10/2023
                                                                    </p>
                                                                </div>
                                                                <div class="col-6 mb-3">
                                                                    <h6>Phone number <i class="fa-solid fa-phone-volume"></i></i></h6>
                                                                    <p class="text-muted" >
                                                                        0123456789
                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class=" d-flex justify-content-between align-items-center mb-1">
                                                                <h3 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Temporary</h1>
                                                                    <h3 class="mb-0 text-muted">500.000 VND</h6>
                                                                        </div>
                                                                        <div class=" d-flex justify-content-between align-items-center mb-1">
                                                                            <h3 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Transport fee</h1>
                                                                                <h3 class="mb-0 text-muted">10.000 VND</h6>
                                                                                    </div>
                                                                                    <div class=" d-flex justify-content-between align-items-center mb-5">
                                                                                        <h3 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Total Paid</h1>
                                                                                            <h3 class="mb-0 text-muted">510.000 VND</h6>
                                                                                                </div>
                                                                                                <div class="d-flex justify-content-end">
                                                                                                    <button type="button" class="btn btn-primary"
                                                                                                            style="width: 65px; background-color: #0D6780 ; border: #0D6780;"><i
                                                                                                            class="fa-solid fa-check fa-lq"></i></button>
                                                                                                </div>
                                                                                                </div>
                                                                                                </div>

                                                                                                </div>

                                                                                                </div>

                                                                                                </div>
                                                                                                </div>
                                                                                                </div>
                                                                                                </div>
                                                                                                </div>
                                                                                                </div>

                                                                                                <script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>
                                                                                                <jsp:include page="/components/footer.jsp"></jsp:include>
                                                                                                </body>

                                                                                                </html>
