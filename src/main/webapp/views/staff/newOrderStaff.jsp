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

        <title>New Order</title>
    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
            <header class="" style="opacity: unset !important">
                <a href="home" class="brand">Bird Farm Shop</a>
                <div class="menu-btn"></div>
                <div class="search-container">
                    <form action="search-product" class="search-bar">
                        <input type="text" placeholder="Search anything" name="lastSearch" value="${param.lastSearch}">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass" style="color: #ddd7d7;"></i></button>
                </form>
            </div>
            <div class="navigation">
                <div class="navigation-items">
                    <div class="dropdown">
                        <button class="dropbtn" style="margin-left: 15px;">
                            <i class="fa-solid fa-shop fa-lg"></i>
                            Shop
                            <i class="fa-solid fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content-wrapper">
                            <div class="dropdown-content">
                                <a href="product_list?productType=bird">Buying birds</a>
                                <a href="Bird-Nest-Services">Ordering bird nests</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <a href="#"><i class="fa-solid fa-phone"></i>Contact</a>
                        <jsp:useBean id="cart" class="Cart.CartObj"></jsp:useBean>
                            <a href="cart" class="list-cart-icon">
                                <i class="fa-solid fa-cart-shopping fa-lg"></i>
                                <span class="cart-number">${empty sessionScope.CART_QUANTITY_PRODUCT ? 0 : sessionScope.CART_QUANTITY_PRODUCT}</span>
                            Cart
                        </a>
                        <c:if test="${empty sessionScope.ACCOUNT}">
                            <a href="guest?btAction=loginPage">Login </a>
                            <div class="separator"></div>
                            <a href="guest?btAction=registerPage">Register </a> 
                        </c:if>
                    </div>
                    <c:if test="${not empty sessionScope.ACCOUNT}">
                        <div class="dropdown">
                            <button class="dropbtn"><i class="fa-regular fa-circle-user "></i>${sessionScope.ACCOUNT.fullName}</button>
                            <div class="dropdown-content-wrapper">
                                <div class="dropdown-content">
                                    <a href="">My account</a>
                                    <a href="Order">Order management</a>
                                    <a href="Service_Tracking">Tracking</a>
                                    <a href="guest?btAction=logout">Logout</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </header>
        <script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>
        <script src="./assets/js/headerControl.js"></script>
        <jsp:include page="/components/siveBar.jsp"></jsp:include>

            <div class="main--content">
                
            <div class="tabular--wrapper" style="margin-top: 3.5%">
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
