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
                        <form action="viewNewOrder" class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input name="lastSearch" value="${param.lastSearch}" type="text" placeholder="Search" />
                        <button type="submit"></button>
                    </form>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">
                <h3 class="main--title">New Order</h3>
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
                                    <tr>
                                        <td><a href="viewDetailOrder?OrderID=${dto.orderID}" class="order-detail">${dto.orderID}</a></td>
                                        <td>${dto.serviceName}</td>
                                        <td>${dto.accountName}</td>
                                        <td>${util.FormatDate(dto.orderDate)}</td>
                                        <c:if test="${dto.total_order_final == 0}">
                                            <td>${util.FormatPrice(dto.deposit_Price)}</td>
                                        </c:if>
                                        <c:if test="${dto.total_order_final != 0}">
                                            <td>${util.FormatPrice(dto.total_order_final)}</td>
                                        </c:if>
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
                                </c:forEach>
                            </c:if>
                            </tbody>
                    </table>
                </div>

            </div>
            <div class="col-lg-12 text-center mt-2">
                <div class="pagination__option" style="text-align: end">
                    <c:if test="${not empty requestScope.SEARCH_VALUE}">
                        <c:set var="search" value="lastSearch=${requestScope.SEARCH_VALUE}"></c:set>
                    </c:if>
                    <c:if test="${requestScope.indexCurrent > 1}">
                        <a href="viewNewOrder?${search}&page=1"><i class="fa fa-angle-double-left"></i></a>
                        <a href="viewNewOrder?${search}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                        </c:if>

                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewNewOrder?${search}&page=${i}">${i}</a>
                    </c:forEach>

                    <c:if test="${requestScope.indexCurrent < requestScope.endPage}">
                        <a href="viewNewOrder?${search}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                        <a href="viewNewOrder?${search}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                        </c:if>
                </div>
            </div>  
    </body>
</html>