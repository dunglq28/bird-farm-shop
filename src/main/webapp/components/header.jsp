<%-- 
    Document   : header
    Created on : Sep 24, 2023, 2:18:15 PM
    Author     : tt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <a href="#" class="brand">Bird Farm Shop</a>
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
                <a href="#"><i class="fa-solid fa-shop fa-lg"></i>Shop</a>
                <a href="#" class="list-cart-icon">
                    <i class="fa-solid fa-cart-shopping fa-lg"></i>
                    <span class="cart-number">10</span>
                </a>
                <!-- <a href="#">Login </a>
                <div class="separator"></div>
                <a href="#">Register </a> -->
            </div>

            <div class="dropdown">
                <button class="dropbtn"><i class="fa-regular fa-circle-user "></i>Truong Tuyet Ngan (K17 HCM)</button>
                <div class="dropdown-content-wrapper">
                    <div class="dropdown-content">
                        <a href="">My account</a>
                        <a href="">My purchase</a>
                        <a href="">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>
