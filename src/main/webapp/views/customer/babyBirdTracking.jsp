
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
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background: #0D6780;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to top, #0D6780, #B0D4B8);

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to top, #0D6780, rgba(246, 243, 255, 1));
                background-repeat: no-repeat;
            }

            .order {
                color: #0D6780 !important;
            }

            .card {
                z-index: 0;
                background-color: #ECEFF1;
                padding-bottom: 20px;
                margin-top: 90px;
                margin-bottom: 90px;
                border-radius: 10px;
            }

            .step {
                padding-top: 40px;
                padding-left: 13% !important;
                padding-right: 13% !important;
            }

            .step-content {
                padding-left: 9% !important;
                padding-right: 9% !important;
            }

            /*Icon progressbar*/
            #progressbar {
                margin-bottom: 30px;
                overflow: hidden;
                color: #455A64;
                padding-left: 0px;
                margin-top: 30px;
            }

            #progressbar li {
                list-style-type: none;
                font-size: 13px;
                width: 20%;
                float: left;
                position: relative;
                font-weight: 400;
            }

            #progressbar .step0:before {
                font-family: FontAwesome;
                content: "\f10c";
                color: #fff;
            }

            #progressbar li:before {
                width: 40px;
                height: 40px;
                line-height: 45px;
                display: block;
                font-size: 20px;
                background: #C5CAE9;
                border-radius: 50%;
                margin: auto;
                padding: 0px;
            }

            /*ProgressBar connectors*/
            #progressbar li:after {
                content: '';
                width: 100%;
                height: 12px;
                background: #C5CAE9;
                position: absolute;
                left: 0;
                top: 16px;
                z-index: -1;
            }

            #progressbar li:last-child:after {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                position: absolute;
                left: -50%;
            }

            #progressbar li:nth-child(2):after,
            #progressbar li:nth-child(3):after,
            #progressbar li:nth-child(4):after {
                left: -50%;
            }

            #progressbar li:first-child:after {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                position: absolute;
                left: 50%;
            }

            #progressbar li:last-child:after {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
            }

            #progressbar li:first-child:after {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
            }

            /*Color number of the step and the connector before it*/
            #progressbar li.active:before,
            #progressbar li.active:after {
                background: #0D6780;
            }

            #progressbar li.active:before {
                font-family: FontAwesome;
                content: "\f00c";
            }

            .icon {
                width: 60px;
                height: 60px;
                margin-right: 15px;
            }

            .icon-content {
                padding-bottom: 20px;
            }

            table td,
            table th {
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
            }

            tbody td {
                font-weight: 500;
                color: #999999;
            }

            .col-12 {
                padding-top: 60px;
            }

            .pagination {
                display: inline-block;
            }

            .center {
                text-align: center
            }

            .pagination a {
                color: #111111;
                font-weight: 600;
                line-height: 40px;
                float: left;
                height: 40px;
                width: 40px;
                text-decoration: none;
                border: 1px solid #f2f2f2;
                border-radius: 50%;
                font-size: 14px;
                -webkit-transition: all, 0.3s;
                -o-transition: all, 0.3s;
                transition: all, 0.3s;
                margin-right: 6px;
            }

            .pagination a.active {
                background-color: #0D6780;
                color: white;
                border: 1px solid #0D6780;
            }

            .pagination a:hover:not(.active) {
                background: rgb(37, 118, 140);
                border-color: rgb(37, 118, 140);
                color: #ffffff;

            }
            table {
                width: 100%;
                /* Đảm bảo bảng lấp đầy chiều rộng của container */
            }

            th,
            td.long-content {
                white-space: normal;
            }

            table {
                width: 100%;
                /* Đảm bảo bảng lấp đầy chiều rộng của container */
            }

            th,
            td.long-content {
                white-space: normal;
            }

            .pay {
                margin-left: 80%;
                width: 16%;
                margin-bottom: 10px;
                display: right;
                border: none;
                background-color: #0D6780;
                height: 30px;
                box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.75);
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.75);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.75);
                color: rgb(255, 255, 255);
                ;
                font-weight: bold;
                border-radius: 3px;
            }

            .pay:hover {
                background-color: rgb(70, 136, 155);
                box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.75);
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.75);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.75);
                color: rgb(255, 255, 255);
                ;
                font-weight: bold;
            }

            @media screen and (max-width: 992px) {
                .icon-content {
                    width: 50%;
                }
            }

        </style>
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
                                            <th scope="col" class="text-center">IMAGE</th>
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
                                                <td>
                                                    <c:if test="${not empty dto.image}">
                                                        <img style="width: 100%; height: 100px; padding: auto;"
                                                             src="${dto.image}" />
                                                    </c:if>
                                                </td>
                                                <td>${util.FormatDate(dto.lastUpdateDate)}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                            <c:if test="${requestScope.endPage > 1}">
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
                                <c:if test="${bird_nest_tracking.male_Babybird != 0}">
                                <h6>MALE BABY BIRD: <span class="text-secondary order">${bird_nest_tracking.male_Babybird}</span></h6>
                                </c:if>
                                <c:if test="${bird_nest_tracking.female_Babybird != 0}">
                                <h6>FEMALE BABY BIRD: <span class="text-secondary order">${bird_nest_tracking.female_Babybird}</span></h6>
                                </c:if>
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
                                             bird_nest_tracking.status != 'Tracking Eggs' ? 'active' : ''} step0">
                                </li>
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' &&
                                             bird_nest_tracking.status != 'Processing' &&
                                             bird_nest_tracking.status != 'Mating' &&
                                             bird_nest_tracking.status != 'Tracking Eggs' && 
                                             bird_nest_tracking.status != 'Tracking Baby Birds' &&
                                             bird_nest_tracking.status != 'Final Payment' ? 'active' : ''} step0">
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
                                <p class="font-weight-bold">Tracking Eggs</p>
                            </div>
                        </div>
                        <div class="row d-flex icon-content">
                            <div class="d-flex flex-column">
                                <p class="font-weight-bold">Tracking<br>Baby Birds</p>
                            </div>
                        </div>
                        <div class="row d-flex icon-content">
                            <div class="d-flex flex-column">
                                <p class="font-weight-bold">Payment<br>Success</p>
                            </div>
                        </div>
                    </div>
                    <c:if test="${bird_nest_tracking.status == 'Final Payment'}">
                        <form action="Checkout" method="Post">
                            <button type="submit" class="pay">Complete payment</button>  
                            <input type="hidden" name="txtOrderID" value="${bird_nest_tracking.orderID}">
                            <input type="hidden" name="txtServiceID" value="0" />
                        </form>
                    </c:if>
                </div>
            </div>

        </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
