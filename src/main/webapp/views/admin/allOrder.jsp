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
                        <form action="viewMyOrder-staff" class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input name="txtSearch" value="" type="text" placeholder="Search" />
                            <button type="submit"></button>
                        </form>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">
                <c:if test="${requestScope.SERVICE_ID == 1}">
                    <h3 class="main--title">My Order</h3>
                </c:if>
                <c:if test="${requestScope.SERVICE_ID != 1}">
                    <h3 class="main--title">My Booking</h3>
                </c:if>
                

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>StaffID</th>
                                <th>Service</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                <th>Total</th>
                                <th>Delivery method</th>
                                <th>Payment method</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        <div class="tbody-wrapper">
                            <c:set var="order" value="${ALL_ORDERS}"></c:set>
                            <c:if test="${not empty order}">
                                <c:forEach items="${order}" var="dto">
                                    <tr>
                                        <td><a href="viewDetailOrderServlet?OrderID=${dto.orderID}" class="order-detail">${dto.orderID}</a></td>
                                        <td>${dto.staffID}</td>
                                        <td>${dto.serviceName}</td>
                                        <td>${dto.accountName}</td>
                                        <td>${util.FormatDate(dto.orderDate)}</td>
                                        <td>${util.FormatPrice(dto.total_Order)}</td>
                                        <td>${dto.form_Receipt}</td>
                                        <td>${dto.payBy}</td>
                                        <td>${dto.status}</td>
                                        <td>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
<!--            <div class="col-lg-12 text-center mt-2">
                <div class="pagination__option" style="text-align: end">
                    <%--<c:if test="${requestScope.indexCurrent > 1}">--%>
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&page=1"><i class="fa fa-angle-double-left"></i></a>
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                        <%--</c:if>--%>

                    <%--<c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">--%>
                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&page=${i}">${i}</a>
                    <%--</c:forEach>--%>

                    <%--<c:if test="${requestScope.indexCurrent<requestScope.endPage}">--%>
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                        <%--</c:if>--%>
                </div>
            </div>  -->
        </div>

<!--        <script>
            function submit() {
                document.querySelector(".myForm").onsubmit();
                document.querySelector(".myOrder").onsubmit();
            }
        </script>-->
    </body>
</html>