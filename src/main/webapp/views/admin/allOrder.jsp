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

        <title>All Order</title>

    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>

            <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <span>Primary</span>
                        <h2>Order Management</h2>
                    </div>
                    <div class="user--info">
                        <form action="viewAllOrder" class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input name="lastSearch" value="${param.lastSearch}" type="text" placeholder="Search" />
                        <button type="submit"></button>
                    </form>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">
                <!--                <c:if test="${requestScope.SERVICE_ID == 1}">
                                    <h3 class="main--title">My Order</h3>
                </c:if>
                <c:if test="${requestScope.SERVICE_ID != 1}">
                    <h3 class="main--title">My Booking</h3>
                </c:if>
                -->
                <form action="viewAllOrder">
                    <div class="mb-4 justify-content-between align-items-sm-start">
                        <div class="col-md-6 col-lg-8 col-xl-8">
                            <input type="submit" name="Status" value="All" class="btn btn-secondary ${STATUS_ORDER == '' ? 'active' : ''}" >
                            <input type="submit" name="Status" value="Wait for confirmation" class="btn btn-secondary ${STATUS_ORDER == 'Wait for confirmation' ? 'active' : ''}"  >
                            <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}"  >
                            <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}"  >
                            <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}"  >
                            <input type="submit" name="Status" value="Cancel" class="btn btn-secondary ${STATUS_ORDER == 'Cancel' ? 'active' : ''}"  >
                        </div>
                    </div>
                </form>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>StaffID</th>
                                <th class="text-center">Service</th>
                                <th class="text-center">Customer Name</th>
                                <th class="text-center">Order Date</th>
                                <th class="text-center">Deposit Price</th>
                                <th class="text-center">Total</th>
                                <th class="text-center">Delivery method</th>
                                <th class="text-center">Payment method</th>
                                <th class="text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        <div class="tbody-wrapper">
                            <c:set var="order" value="${ALL_ORDERS}"></c:set>
                            <c:if test="${not empty order}">
                                <c:forEach items="${order}" var="dto">
                                    <tr class="text-center">
                                        <td><a href="viewDetailOrder?OrderID=${dto.orderID}" class="order-detail">${dto.orderID}</a></td>
                                        <td>${dto.staffID}</td>
                                        <td>${dto.serviceName}</td>
                                        <td>${dto.accountName}</td>
                                        <td>${util.FormatDate(dto.orderDate)}</td>
                                        <td>${util.FormatPrice(dto.deposit_Price)}</td>
                                        <td>${util.FormatPrice(dto.total_order_final)}</td>
                                        <td>${dto.form_Receipt}</td>
                                        <td>${dto.payBy}</td>
                                        <td>${dto.status}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </div>
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
                        <a href="viewAllOrder?Status=${STATUS_ORDER}&${search}&page=1"><i class="fa fa-angle-double-left"></i></a>
                        <a href="viewAllOrder?Status=${STATUS_ORDER}&${search}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                        </c:if>

                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewAllOrder?Status=${STATUS_ORDER}&${search}&page=${i}">${i}</a>
                    </c:forEach>

                    <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                        <a href="viewAllOrder?Status=${STATUS_ORDER}&${search}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                        <a href="viewAllOrder?Status=${STATUS_ORDER}&${search}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                        </c:if>
                </div>
            </div>  
        </div>

        <script>
            function submit() {
                document.querySelector(".myForm").onsubmit();
                document.querySelector(".myOrder").onsubmit();
            }
        </script>
    </body>
</html>