<%-- 
    Document   : header
    Created on : Sep 24, 2023, 2:18:15 PM
    Author     : tt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <c:set var="account" value="${sessionScope.ACCOUNT}"></c:set>

        <a href="home" class="brand">Bird Farm Shop</a>
        <div class="menu-btn"></div>
        <div class="search-container">
            <form action="" class="search-bar">
                <input type="text" placeholder="search anything" name="q">
                <button type="submit"><i class="fa-solid fa-magnifying-glass" style="color: #ddd7d7;"></i></button>
            </form>
        </div>
        <div class="navigation">

            <div class="navigation-items">
                <div class="item">
                    <a href="#"><i class="fa-solid fa-shop"></i>Shop</a>
                    <a href="#"><i class="fa-solid fa-phone"></i>Contact</a>
                    <a href="#"><i class="fa-solid fa-cart-shopping"></i>Cart</a>
                <c:if test="${empty account}">
                    <a href="guest?btAction=loginPage">Login</a>
                    <div class="separator"></div>
                    <a href="guest?btAction=registerPage">Register</a>
                </c:if>
            </div>

            <c:if test="${not empty account}">
                <div class="dropdown">
                    <button class="dropbtn"><i class="fa-regular fa-circle-user"></i>${account.fullName}</button>
                    <div class="dropdown-content-wrapper">
                        <div class="dropdown-content">
                            <a href="">My account</a>
                            <a href="">My purchase</a>
                            <a href="guest?btAction=logout">Logout</a>
                        </div>
                    </div>
                </div> 
            </c:if>
        </div>
    </div>
</header>
<script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>
