<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="./assets/css/dashboard.css" />
        <link rel="stylesheet" href="./assets/css/homePage.css">

        <title>My Order</title>
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
    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <%--<jsp:include page="/components/header.jsp"></jsp:include>--%>


        <jsp:include page="/components/siveBar.jsp"></jsp:include>

            <div>

            </div>


            <div class="main--content">
                                <div class="header-wrapper">
                                    <div class="header--title">
                                        <span>Primary</span>
                                        <h2>Order Management</h2>
                                    </div>
                                    <div class="user--info">
                                        <div class="search--box">
                                            <i class="fa-solid fa-search"></i>
                                            <input type="text" placeholder="search" />
                                        </div>
            ${sessionScope.ACCOUNT.fullName}
        </div>
    </div>
            <div class="tabular--wrapper" >
                <c:if test="${sessionScope.SERVICE_ID == 1}">
                    <h3 class="main--title">My Order</h3>
                    <form action="Order">
                        <div class="mb-4 justify-content-between align-items-sm-start">
                            <div class="col-md-4 col-lg-6 col-xl-6">
                                <input type="submit" name="Status" value="All" class="btn btn-secondary ${STATUS_ORDER == 'All' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                            </div>
                        </div>
                    </form>
                </c:if>
                <c:if test="${sessionScope.SERVICE_ID != 1}">
                    <h3 class="main--title">My Booking</h3>
                    <form action="Order">
                        <div class="mb-4 justify-content-between align-items-sm-start">
                            <div class="col-md-4 col-lg-6 col-xl-6">
                                <input type="submit" name="Status" value="All" class="btn btn-secondary ${STATUS_ORDER == 'All' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}" style="background: rgb(13,103,128);">
                                <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                            </div>
                        </div>
                    </form>
                    
                </c:if>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>Service</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                <th>Total</th>
                                <th>Delivery method</th>
                                <th>Payment method</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <div class="tbody-wrapper">
                            <c:set var="order" value="${requestScope.MY_ORDERS_STAFF}"></c:set>
                            <c:if test="${not empty order}">
                                <c:forEach items="${order}" var="dto">
                                    <tr>
                                        <td><a href="" class="order-detail">${dto.orderID}</a></td>
                                        <td>${dto.serviceName}</td>
                                        <td>${dto.accountName}</td>
                                        <td>${util.FormatDate(dto.orderDate)}</td>
                                        <td>${util.FormatPrice(dto.total_Order)}</td>
                                        <td>${dto.form_Receipt}</td>
                                        <td>${dto.payBy}</td>
                                        <td>
                                            <form action="updatedOrders-staff">
                                                <select name="txtNewStatus" onchange="submit()" class="rounded-select" >
                                                    <option ${dto.status == 'Processing' ? 'selected' : '' }>Processing</option>
                                                    <option ${dto.status == 'Delivering' ? 'selected' : '' }>Delivering</option>
                                                    <option ${dto.status == 'Complete' ?'selected' : '' }>Complete</option>
                                                </select>
                                                <input type="hidden" name="txtOrderID" value="${dto.orderID}">
                                                <input type="hidden" name="txtServiceID" value="${session.SERVICE_ID}" >
                                            </form>
                                        </td>

                                        <td>
                                            <div class="action">
                                                <!--<a href="#"><i class="fa-solid fa-check"></i></a>-->
                                                <a href="#"><i class="fa-solid fa-xmark"></i></a>
                                            </div>
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            function submit() {
                document.querySelector(".myForm").onsubmit();
            }
        </script>
    </body>
</html>