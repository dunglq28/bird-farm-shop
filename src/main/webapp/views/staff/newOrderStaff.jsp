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
        <title>New Order</title>
    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>


        <jsp:include page="/components/siveBar.jsp"></jsp:include>

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
         
            <div class="tabular--wrapper">
                <h3 class="main--title">New Order</h3>
                <form action="Order">
                    <div class="mb-4 justify-content-between align-items-sm-start">
                        <div class="col-md-4 col-lg-6 col-xl-6">
                            <input type="submit" name="Status" value="All" class="btn btn-secondary ${STATUS_ORDER == 'All' ? 'active' : ''}" style="background: rgb(13,103,128);">
                            <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}" style="background: rgb(13,103,128);">
                            <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}" style="background: rgb(13,103,128);">
                            <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}" style="background: rgb(13,103,128);">
                            <input type="submit" name="Status" value="Wait fot comfirmation" class="btn btn-secondary ${STATUS_ORDER == 'Wait fot comfirmation' ? 'active' : ''}" style="background: rgb(13,103,128);">

                            <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                        </div>
                    </div>
                </form>
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
                            <c:set var="order" value="${requestScope.STAFF_ALL_ORDERS}"></c:set>
                            <c:if test="${not empty order}">
                                <c:forEach items="${order}" var="dto">
                                    <div>
                                        <div>
                                            <tr>
                                                <td><a href="" class="order-detail">${dto.orderID}</a></td>
                                                <td>${dto.serviceName}</td>
                                                <td>${dto.accountName}</td>
                                                <td>${util.FormatDate(dto.orderDate)}</td>
                                                <td>${util.FormatPrice(dto.total_order_final)}</td>
                                                <td>${dto.form_Receipt}</td>
                                                <td>${dto.payBy}</td>
                                                <td>${dto.status}</td>
                                                <td>
                                                    <div class="action">
                                                        <a href="acceptOrder-staff?orderID=${dto.orderID}"><i class="fa-solid fa-check"></i></a>
                                                        <a href="#"><i class="fa-solid fa-xmark"></i></a>
                                                    </div>
                                                    <input type="hidden" name="orderID" value="" />
                                                    <input type="hidden" name="" value="" />
                                                    <input type="hidden" name="" value="" />
                                                    <input type="hidden" name="" value="" />
                                                    <input type="hidden" name="" value="" />
                                                </td>
                                            </tr>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>