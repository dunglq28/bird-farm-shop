
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="">
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
                <button class="dropbtn" style="margin-left: 15px;"><i class="fa-solid fa-shop fa-lg"></i>Shop</button>
                <div class="dropdown-content-wrapper">
                    <div class="dropdown-content">
                        <a href="product-list">Buying birds</a>
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

