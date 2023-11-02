<%-- 
    Document   : trackingCoupleBird
    Created on : Oct 24, 2023, 12:24:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>
        <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <h2>Bird Nest Tracking Management</h2>
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
                <h3 class="main--title">Bird Nest</h3>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderID</th>
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
                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
