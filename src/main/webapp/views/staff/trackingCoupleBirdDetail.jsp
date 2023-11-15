<%-- 
    Document   : trackingCoupleBirdDetail
    Created on : Oct 29, 2023, 11:20:14 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracking Detail</title>
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/dashboard.css" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="./assets/css/trackingNote.css"/>
        <style>
            .sidebar .menu .list-cart-icon .cart-number {
                bottom: 28px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <c:set var="order" value="${requestScope.ORDER}" ></c:set>
        <c:set var="birdNest" value="${requestScope.BIRD_TRACKING}" ></c:set>
            <div class="container py-5 h-100 ms-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-12">
                                        <div class="p-5">
                                            <div class="mb-4 d-flex justify-content-between align-items-center">
                                                <h6 class="fw-bold col-md-1  text-muted">Product</h6>
                                                <h6 class="fw-bold col-md-2  text-sm-center text-muted ">Information</h6>
                                                <h6 class="fw-bold col-md-2  text-sm-center text-muted ">Price</h6>
                                            </div>
                                        <c:set var="parentBird" value="${requestScope.PARENT_BIRD}"></c:set>
                                            <hr class="my-4">
                                        <c:forEach var="bird" items="${parentBird}">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="${bird.image}"
                                                             class="img-fluid rounded-3" alt="Bird Image">
                                                    </div>
                                                    <div class="col-md-4 col-lg-4 col-xl-4">
                                                        <h6 class="text-black mb-0">${bird.product_Name}</h6>      
                                                        <div class="d-flex">
                                                            <h6 class="text-muted">Gender: ${bird.gender}</h6>
                                                        </div>
                                                        <h6 class="text-muted">Color: ${bird.color}</h6>
                                                    </div>
                                                    <div class="col-md-2 col-lg-2 col-xl-2 ">
                                                        <h6 class="mb-0 text-sm-center"> ${util.FormatPrice(bird.price)}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="my-4">
                                        </c:forEach>
                                        <c:set var="trackingNote" value="${requestScope.BIRD_TRACKING_NOTE}" />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Tracking Note</h5>
                                            </div>
                                            <c:if test="${birdNest.status ne 'Payment Success'}">
                                                <div class="col-md-6 d-flex justify-content-end align-items-center">
                                                    <form action="newNoteTracking">
                                                        <input type="hidden" name="orderId" value="${order.orderID}" />
                                                        <input class="p-2 rounded" style="background: rgb(13, 103, 128);  color: #FFF;" type="submit" value="Add note" />
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:if test="${not empty trackingNote}">
                                            <div class="row m-2">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Bird Nest ID</th>
                                                            <th>Last Updated Date</th>
                                                            <th>Image</th>
                                                            <th class="text-center">Note</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="note" items="${trackingNote}">
                                                            <tr>
                                                                <td>${note.bird_Nest_ID}</td>
                                                                <td>${util.FormatDate(note.lastUpdateDate)}</td>
                                                                <td>
                                                                    <c:if test="${not empty note.image}">
                                                                        <img style="width: 100%; height: 100px; padding: auto;"
                                                                             src="${note.image}" />
                                                                    </c:if>
                                                                </td>
                                                                <td>${note.note}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.endPage > 1}">
                                            <div class="col-lg-12 text-center mt-2">
                                                <div class="pagination__option" style="text-align: end">
                                                    <c:set var="ord" value="OrderID=${requestScope.ORDER_ID}"></c:set>
                                                    <c:if test="${requestScope.indexCurrent > 1}">
                                                        <a href="viewDetailOrder?${ord}&page=1"><i class="fa fa-angle-double-left"></i></a>
                                                        <a href="viewDetailOrder?${ord}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                                                        </c:if>

                                                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                                                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewDetailOrder?${ord}&page=${i}">${i}</a>
                                                    </c:forEach>

                                                    <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                                                        <a href="viewDetailOrder?${ord}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                                                        <a href="viewDetailOrder?${ord}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                                                        </c:if>
                                                </div>
                                            </div>  
                                        </c:if>

                                        <c:if test="${empty trackingNote}">
                                            <div class="row">
                                                <h4 class="text-sm-center m-3">No Tracking Note Found</h4>
                                            </div>
                                        </c:if>
                                        <div class="row">
                                            <div>
                                                <h5>Number of eggs: ${birdNest.eggs_Quantity}</h5>
                                            </div>
                                            <div>
                                                <h5>Number of male baby birds: ${birdNest.male_Babybird}</h5>
                                            </div>
                                            <div>
                                                <h5>Number of female baby birds: ${birdNest.female_Babybird}</h5>
                                            </div>
                                            <div>
                                                <h5>Status: ${birdNest.status}</h5>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="card-body p-4">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Order details</h5>
                                                    <h5 class="mb-0 text-muted">Order ID: ${order.orderID}</h5>
                                                </div>
                                            </div>
                                            <hr class="mt-0 mb-4">
                                            <div class="row pt-1">
                                                <div class="col-6 mb-3">
                                                    <h6>Status </h6>
                                                    ${order.status}
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
                                            <div class=" d-flex justify-content-between align-items-center mb-1">
                                                <h5 class="fw-bold mb-0 text-black" style=" color: rgb(13, 103, 128);">Deposit</h5>
                                                <h5 class="mb-0 text-muted">${util.FormatPrice(order.deposit_Price)}</h5>
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
