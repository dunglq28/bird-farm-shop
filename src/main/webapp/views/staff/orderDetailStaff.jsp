
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/dashboard.css" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>

    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/siveBar.jsp"></jsp:include>

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
                                        <c:set var="orderdetail" value="${requestScope.ORDER_DETAIL}"></c:set>
                                            <hr class="my-4">
                                        <c:forEach var="od" items="${orderdetail}">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="${od.image}"
                                                             class="img-fluid rounded-3" alt="Bird Image">
                                                    </div>
                                                    <div class="col-md-4 col-lg-4 col-xl-4">
                                                        <h6 class="text-black mb-0">${od.name}</h6>
                                                        <h6 class="text-muted">${od.cate_name}</h6>
                                                        <div class="d-flex">
                                                            <h6 class="text-muted">Age: ${od.age}</h6>

                                                            <h6 class="mb-0 text-sm-center text-muted"
                                                                style="margin: 0 10px 0 10px;"> |
                                                            </h6>
                                                            <h6 class="text-muted">Gender:  ${od.gender}</h6>
                                                        </div>
                                                        <h6 class="text-muted">Color:  ${od.color}</h6>
                                                    </div>
                                                    <div class="col-md-2 col-lg-2 col-xl-2 ">
                                                        <h6 class="mb-0 text-sm-center"> ${util.FormatPrice(od.price)}</h6>
                                                    </div>
                                                    <div
                                                        class="col-md-2 col-lg-2 col-xl-2 d-flex align-items-center quantity-form ">
                                                        ${od.quantityBuy}
                                                    </div>
                                                    <div
                                                        class="col-md-2 col-lg-2 col-xl-2 text-md-end text-lg-start text-xl-start">
                                                        </divclass>

                                                        <h6 class="mb-0" style="margin-left: 34px;">
                                                            ${util.FormatPrice(od.price * od.quantityBuy)}
                                                        </h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="my-4">
                                        </c:forEach>
                                        <c:set var="order" value="${requestScope.ORDER}" ></c:set>
                                            <div class="col-md-12">
                                                <div class="card-body p-4">
                                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                                        <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Order details</h5>
                                                        <h5 class="mb-0 text-muted">Order ID: ${order.orderID}</h5>

                                                </div>
                                                <hr class="mt-0 mb-4">
                                                <div class="row pt-1">
                                                    <div class="col-6 mb-3">
                                                        <h6>Status </h6>
                                                        <select class="rounded-select">
                                                            <option value="">${order.status}</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-6 mb-3">
                                                        <h6>Customer name </h6>
                                                        <p class="text-muted">
                                                            ${order.accountName}
                                                        </p>

                                                    </div>
                                                </div>


                                                <div class="row pt-1">
                                                    <div class="col-6 mb-3">
                                                        <h6>Sales clerk</h6>
                                                        <p class="text-muted" >${order.staffID}</p>
                                                    </div>
                                                    <div class="col-6 mb-3"> 
                                                        <h6>Address <i class="fa-solid fa-location-dot fa-bounce"></i></h6>
                                                        <p class="text-muted">
                                                            ${order.shipAddress}, ${order.shipCity}
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row pt-1">
                                                    <div class="col-6 mb-3">
                                                        <h6>Order date</h6>
                                                        <p class="text-muted" >${order.orderDateFormat}</p>
                                                    </div>
                                                    <div class="col-6 mb-3">
                                                        <h6>Phone number <i class="fa-solid fa-phone-volume"></i></i></h6>
                                                        <p class="text-muted" >
                                                            ${order.phoneNumber}
                                                        </p>
                                                    </div>
                                                </div>
                                                <c:if test="${order.serviceID != 1}">
                                                    <div class=" d-flex justify-content-between align-items-center mb-1">
                                                        <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Service Price</h5>
                                                        <h5 class="mb-0 text-muted">${util.FormatPrice(order.total_Order)}</h5>
                                                    </div>
                                                </c:if>
                                                <div class=" d-flex justify-content-between align-items-center mb-1">
                                                    <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Temporary</h5>
                                                    <h5 class="mb-0 text-muted">${util.FormatPrice(order.total_Order)}</h5>
                                                </div>
                                                <div class=" d-flex justify-content-between align-items-center mb-1">
                                                    <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Transport fee</h5>
                                                    <h5 class="mb-0 text-muted">${util.FormatPrice(order.delivery_charges)}</h5>
                                                </div>
                                                <div class=" d-flex justify-content-between align-items-center mb-5">
                                                    <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Total Paid</h5>
                                                    <h5 class="mb-0 text-muted">${util.FormatPrice(order.total_Order + order.delivery_charges)}</h5>
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
    </body>

</html>

