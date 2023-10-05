
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyOrder</title>
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>

    <body>
        <!-- header -->
        <jsp:include page="/components/header.jsp"></jsp:include>
            <!-- header -->
            <div class="container py-5 h-100 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-3 bg-grey">
                                        <div class="p-5">

                                            <div class="row mb-12 d-flex justify-content-between align-items-center">
                                                <div class="col-md-4 col-lg-4 col-xl-4">
                                                    <img src="https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png"
                                                         class="img-fluid rounded-3" alt="Bird Image">
                                                </div>
                                                <div class="col-md-8 justify-content-center">
                                                    <h5 class="text-black mb-0">${sessionScope.ACCOUNT.fullName}</h5>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <a href="#" class="change-infor-link text-decoration-none">
                                                        <h6 class="mb-0 text-muted ">Change account</h6>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="mb-5 mt-5">
                                            <div class="Promotion-received"></div>

                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>Account management</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>Accumulates points</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>Account information</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none" style="color: rgb(0, 155, 198) !important;">
                                                    <h5 >My order</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>My booking</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>Delivery address book</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>Repurchase</h6>
                                                </a>
                                            </div>
                                            <hr>
                                            <div class="Promotion-received-element mb-3">
                                                <a href="#" class="text-muted text-decoration-none">
                                                    <h5>Q&A</h6>
                                                </a>
                                            </div>

                                        </div>

                                        <hr class="my-4">
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="p-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h1 class="fw-bold mb-0 text-black" style="color: rgb(13,103,128);">My order</h1>

                                        </div>
                                        <div class="mb-4 justify-content-between align-items-sm-start">
                                            <div class="col-md-4 col-lg-6 col-xl-6">
                                                <button type="button" class="btn btn-secondary" style="background-color: rgb(13,103,128);">All</button>
                                                <button type="button" class="btn btn-secondary ">Succeed</button>
                                                <button type="button" class="btn btn-secondary ">Cancelled</button>
                                            </div>
                                        </div>

                                        <hr class="my-4">
                                        <c:set var="orderList" value="${sessionScope.ORDER_LIST}"></c:set>
                                        <c:if test="${not empty orderList}">
                                            <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
                                            <c:forEach var="order" items="${orderList}">
                                                <div class="product">
                                                    <div class="product-element">
                                                        <div class="row d-flex justify-content-between align-items-center bg-grey"
                                                             style="margin-bottom: 15px; padding: 10px; border-radius: 10px;">
                                                            <div class="col-md-7 col-lg-7 col-xl-7 d-flex align-content-center">
                                                                <div class="col-md-8 col-lg-8 col-xl-8 d-flex align-items-center">
                                                                    <div class="d-flex">
                                                                        <h6 class="mb-0 text-sm-start">Order code: ${order.orderID}</h6>
                                                                        <h6 class="mb-0 text-sm-center"
                                                                            style="margin: 0 10px 0 10px;"> |
                                                                        </h6>
                                                                        <h6 class="mb-0 text-sm-end">Order date: ${order.orderDate}</h6>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-lg-4 col-xl-4 align-content-center "
                                                                     style="margin-left: 40px;">
                                                                    <div class="justify-content-center align-content-center mb-0"
                                                                         style="background-color: rgb(13,103,128); width: fit-content; padding: 5px 20px 5px 20px; border-radius: 5px; color: azure;">
                                                                        <h6 class="mb-0">${order.status}</h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-5 col-lg-5 col-xl-5 d-flex">
                                                                <div class="col-md-7 col-lg-7 col-xl-7 align-content-center">
                                                                    <div class="d-flex">
                                                                        <h6 class="mb-0 text-sm-start">Payment: ${order.payBy} </h6>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-5 col-lg-5 col-xl-5 align-content-center "
                                                                     style="margin-left: 40px;">
                                                                    <a href="#" class="text-muted text-decoration-none">See details
                                                                        <i class="fa-solid fa-arrow-right"></i></a>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 col-lg-12 col-xl-12 d-flex"style=" margin-top: 8px;">
                                                                <div class="col-md-4 col-lg-4 col-xl-4 align-content-center">
                                                                    <div class="d-flex">
                                                                        <h6 class="mb-0 text-sm-start">Receiving method: ${order.form_Receipt} </h6>
                                                                    </div>
                                                                </div>
                                                                <h6 class="mb-0 text-sm-center"
                                                                    style="margin: 0 10px 0 10px;"> |
                                                                </h6>
                                                                <div class="col-md-3 col-lg-3 col-xl-3 align-content-center ">
                                                                    <h6 class="text-sm-start">Total: ${util.FormatPrice(order.total_order_final)}</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <div class="col-12 d-flex mt-3">
                                                    <div
                                                        class="row mb-6 col-md-6 col-xl-6 d-flex justify-content-between align-items-center">
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/636763/1694634846/bird-for-sale-in-stanton-ca.jpg"
                                                                 class="img-fluid rounded-3" alt="Bird Image">
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Toco Toucan</h6>
                                                            </div>
                                                            <div class="d-flex">
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center">SL: 2 </h6>
                                                                </div>
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center"> X </h6>
                                                                </div>
                                                                <div class="">
                                                                    <h6 class="mb-0"> 10,000</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Gender: male</h6>
                                                            </div>
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Age: 5 Month</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="row mb-6 col-md-6 col-xl-6 d-flex justify-content-between align-items-center">
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/636763/1694634846/bird-for-sale-in-stanton-ca.jpg"
                                                                 class="img-fluid rounded-3" alt="Bird Image">
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Toco Toucan</h6>
                                                            </div>
                                                            <div class="d-flex">
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center">SL: 2</h6>
                                                                </div>
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center"> X </h6>
                                                                </div>
                                                                <div class="">
                                                                    <h6 class="mb-0">$ 10,000</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Gender: male</h6>
                                                            </div>
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Age: 5 Month</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 d-flex mt-3">
                                                    <div
                                                        class="row mb-6 col-md-6 col-xl-6 d-flex justify-content-between align-items-center">
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/636763/1694634846/bird-for-sale-in-stanton-ca.jpg"
                                                                 class="img-fluid rounded-3" alt="Bird Image">
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Toco Toucan</h6>
                                                            </div>
                                                            <div class="d-flex">
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center">SL: 2 </h6>
                                                                </div>
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center"> X </h6>
                                                                </div>
                                                                <div class="">
                                                                    <h6 class="mb-0"> 10,000</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Gender: male</h6>
                                                            </div>
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Age: 5 Month</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="row mb-6 col-md-6 col-xl-6 d-flex justify-content-between align-items-center">
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/636763/1694634846/bird-for-sale-in-stanton-ca.jpg"
                                                                 class="img-fluid rounded-3" alt="Bird Image">
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Toco Toucan</h6>
                                                            </div>
                                                            <div class="d-flex">
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center">SL: 2</h6>
                                                                </div>
                                                                <div class=" ">
                                                                    <h6 class="mb-0 text-sm-center"> X </h6>
                                                                </div>
                                                                <div class="">
                                                                    <h6 class="mb-0">$ 10,000</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Gender: male</h6>
                                                            </div>
                                                            <div class="">
                                                                <h6 class="text-black mb-0">Age: 5 Month</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 mt-3 d-flex justify-content-end">
                                                    <button type="button" class="btn btn-secondary" style="margin: 3px; background-color:rgb(13,103,128);">Buy again</button>
                                                    <button type="button" class="btn btn-secondary" style="margin: 3px; background-color:rgb(13,103,128);">View rate</button>
                                                </div>
                                                <hr class="my-4">
                                            </div>
                                        </c:if>

                                        <c:if test="${empty orderList}">
                                            <div class="container-fluid  mt-100 justify-content-center align-content-center" style="margin:auto">
                                                <div class="row">

                                                    <div class="col-md-12" >

                                                        <div class="card">

                                                            <div class="card-body cart" >
                                                                <div class="col-sm-12 empty-cart-cls text-center">
                                                                    <img src="https://theme.hstatic.net/1000360022/1001086135/14/policies_icon_2.png?v=1441" width="130" height="130"
                                                                         class="img-fluid mb-4 mr-3">
                                                                    <h3><strong>You don't have any orders yet</strong></h3>
                                                                    <a href="#" class="btn btn-primary cart-btn-transform m-3" style="background-color: rgb(13,103,128);" data-abc="true">Continue shopping</a>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <!-- footer -->
        <jsp:include page="/components/footer.jsp"></jsp:include>
        <!-- close footer -->
    </body>

</html>
