
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My bird nest tracking</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/babyBirdTracking.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
            <div class="container px-1 px-md-4 py-5 mx-auto">
                <div class="birdparent-info" style="padding-top:20px">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">Bird_Nest_ID</th>
                                            <th scope="col">NOTE</th>
                                            <th scope="col">UPDATE TIME</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="bndetailList" value="${sessionScope.BN_DETAIL_TRACKING_LIST}"></c:set>
                                    <c:if test="${not empty bndetailList}">
                                        <c:forEach items="${bndetailList}" var="dto" varStatus="counter">
                                            <tr>
                                                <td>${dto.bird_Nest_ID}</td>
                                                <td class="long-content">${dto.note}</td>
                                                <td>${util.FormatDate(dto.lastUpdateDate)}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                            <c:if test="${not empty bndetailList}">
                                <div class="center">
                                    <div class="pagination">
                                        <c:if test="${requestScope.pageCurrent > 1}">
                                            <a href="Service_Tracking?txtOrderID=${requestScope.ORDER_ID}&page=1"><i class="fa fa-angle-double-left"></i></a>
                                            <a href="Service_Tracking?txtOrderID=${requestScope.ORDER_ID}&page=${requestScope.pageCurrent-1}"><i class="fa fa-angle-left"></i></a>
                                            </c:if>

                                        <c:forEach begin="${requestScope.BEGIN}" end="${requestScope.FINISH}" var="i">
                                            <a class="${requestScope.pageCurrent==i ? "active" : ""}" href="Service_Tracking?txtOrderID=${requestScope.ORDER_ID}&page=${i}">${i}</a>
                                        </c:forEach>

                                        <c:if test="${requestScope.pageCurrent < requestScope.endPage}">
                                            <a href="Service_Tracking?txtOrderID=${requestScope.ORDER_ID}&page=${requestScope.pageCurrent+1}"><i class="fa fa-angle-right"></i></a>
                                            <a href="Service_Tracking?txtOrderID=${requestScope.ORDER_ID}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                                            </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="bird_nest_tracking" value="${sessionScope.BIRD_NEST_TRACKING}"></c:set>
                <div class="time-line">
                    <div class="card">
                        <div class="row d-flex justify-content-between px-3 step">
                            <div class="d-flex flex-column text-sm-left">
                                <h5>ORDER ID: <span class="text-secondary font-weight-bold order">#${bird_nest_tracking.orderID}</span></h5>
                            <h6>SERVICE: <span class="text-secondary  order">Pair birds of customers upon request</span></h6>
                            <h6>EGG QUANTITY: <span class="text-secondary order">${bird_nest_tracking.eggs_Quantity}</span></h6>
                            <h6>MALE BABY BIRD: <span class="text-secondary order">${bird_nest_tracking.eggs_Quantity}</span></h6>
                            <h6>FEMALE BABY BIRD: <span class="text-secondary order">${bird_nest_tracking.eggs_Quantity}</span></h6>
                        </div>
                        <div class="d-flex flex-column text-sm-left">
                            <p class="mb-0">Update <span>${util.FormatDate(bird_nest_tracking.lastUpdateDate)}</span></p>
                            <p>Customer <span class="font-weight-bold">${sessionScope.CUSTOMER.fullName}</span></p>
                        </div>
                    </div>
                    <!-- Add class 'active' to progress -->
                    <div class="row d-flex justify-content-center">
                        <div class="col-12">
                            <ul id="progressbar" class="text-center">
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' ? 'active' : ''} step0"></li>
                                <li class="${bird_nest_tracking.status != 'Processing' && 
                                             bird_nest_tracking.status != 'Wait for confirmation' ? 'active' : ''} step0">
                                </li>
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' &&
                                             bird_nest_tracking.status != 'Processing' &&
                                             bird_nest_tracking.status != 'Mating' ? 'active' : ''} step0">
                                </li>
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' &&
                                             bird_nest_tracking.status != 'Processing' &&
                                             bird_nest_tracking.status != 'Mating' &&
                                             bird_nest_tracking.status != 'Tracking Egg' ? 'active' : ''} step0">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row justify-content-between step-content">
                        <div class="row d-flex icon-content">
                            <div class="d-flex flex-column">
                                <p class="font-weight-bold">Processing</p>
                            </div>
                        </div>
                        <div class="row d-flex icon-content">
                            <div class="d-flex flex-column">
                                <p class="font-weight-bold">Mating</p>
                            </div>
                        </div>
                        <div class="row d-flex icon-content">
                            <div class="d-flex flex-column">
                                <p class="font-weight-bold">Tracking<br>Egg</p>
                            </div>
                        </div>
                        <div class="row d-flex icon-content">
                            <div class="d-flex flex-column">
                                <p class="font-weight-bold">Preparing<br>For Delivery</p>
                            </div>
                        </div>
                    </div>
                    <button class="pay">Complete payment</button>    
                </div>
            </div>

        </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
